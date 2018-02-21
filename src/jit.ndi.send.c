//
// This file is part of jit.ndi https://github.com/impsnldavid/jit.ndi
// Copyright (c) 2018 David Butler / The Impersonal Stereo
// 
// This program is free software: you can redistribute it and/or modify  
// it under the terms of the GNU Lesser General Public License as 
// published by the Free Software Foundation, version 3.
//
// This program is distributed in the hope that it will be useful, but 
// WITHOUT ANY WARRANTY; without even the implied warranty of 
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU 
// General Public License for more details.
//
// You should have received a copy of the GNU Lesser General Public 
// License along with this program. 
// If not, see <http://www.gnu.org/licenses/>.

#include <jit.common.h>
#include <jit.gl.h>

#include <Processing.NDI.Lib.h>

#define NUM_FRAMEBUFFERS 2


typedef struct _jit_ndi_send
{
	t_object object;

	NDIlib_send_instance_t ndiSendInstance;
	NDIlib_video_frame_v2_t* ndiVideoFrame;

	void* framebuffers[NUM_FRAMEBUFFERS];
	int framebufferIndex;

} t_jit_ndi_send;


t_jit_err jit_ndi_send_init();
t_jit_ndi_send* jit_ndi_send_new(t_symbol* destName);
void jit_ndi_send_free(t_jit_ndi_send* x);
t_jit_err jit_spill_matrix_calc(t_jit_ndi_send* x, void* inputs, void* outputs);


void* _jit_ndi_send_class;

// --------------------------------------------------------------------------------

t_jit_err jit_ndi_send_init()
{
	_jit_ndi_send_class = jit_class_new("jit_ndi_send",
	                                    (method)jit_ndi_send_new, (method)jit_ndi_send_free,
	                                    sizeof(t_jit_ndi_send), A_DEFSYM, 0L);

	t_jit_object* mop = jit_object_new(_jit_sym_jit_mop, 1, 0);
	jit_class_addadornment(_jit_ndi_send_class, mop);

	jit_class_addmethod(_jit_ndi_send_class, (method)jit_spill_matrix_calc, "matrix_calc", A_CANT, 0L);


	/*long attrflags = JIT_ATTR_GET_DEFER_LOW | JIT_ATTR_SET_USURP_LOW;
	t_jit_object* attr = jit_object_new(_jit_sym_jit_attr_offset, "listlength", _jit_sym_long, attrflags,
						  (method)0L, (method)0L, calcoffset(t_jit_object, listlength));
	jit_class_addattr(_jit_ndi_send_class, attr);
	object_addattr_parse(attr, "label",_jit_sym_symbol, 0, "\"List Length\"");*/


	jit_class_register(_jit_ndi_send_class);

	return JIT_ERR_NONE;
}


t_jit_ndi_send* jit_ndi_send_new(t_symbol* destName)
{
	t_jit_ndi_send* x;

	if (!NDIlib_initialize())
	{
		jit_object_error(NULL, "jit.ndi.send: This machine does not meet the specification required to run NDI.");
		return NULL;
	}

	// make jit object
	if (!((x = (t_jit_ndi_send *)jit_object_alloc(_jit_ndi_send_class))))
		return NULL;

	x->ndiVideoFrame = (NDIlib_video_frame_v2_t*)sysmem_newptrclear(sizeof(NDIlib_video_frame_v2_t));

	x->ndiVideoFrame->xres = -1;
	x->ndiVideoFrame->yres = -1;
	x->ndiVideoFrame->FourCC = NDIlib_FourCC_type_RGBA;
	x->ndiVideoFrame->frame_rate_N = 30000;
	x->ndiVideoFrame->frame_rate_D = 1001;
	x->ndiVideoFrame->frame_format_type = NDIlib_frame_format_type_progressive;
	x->ndiVideoFrame->timecode = NDIlib_send_timecode_synthesize;
	x->ndiVideoFrame->timestamp = NDIlib_send_timecode_empty;

	for (int i = 0; i < NUM_FRAMEBUFFERS; ++i)
		x->framebuffers[i] = NULL;

	x->framebufferIndex = 0;

	x->ndiSendInstance = NULL;

	NDIlib_send_create_t ndiSendCreateDesc = { 0 };
	ndiSendCreateDesc.p_ndi_name = "Max Video";

	x->ndiSendInstance = NDIlib_send_create(&ndiSendCreateDesc);
	if (!x->ndiSendInstance)
	{
		object_error((t_object*)x, "Failed to create NDI sender");
		jit_object_free(x);
		return NULL; 
	}

	return x;
}

void jit_ndi_send_free(t_jit_ndi_send* x)
{
	if (!x)
		return;

	// Make sure that NDI isn't still using the last framebuffer
	NDIlib_send_send_video_async_v2(x->ndiSendInstance, NULL);

	for (int i = 0; i < NUM_FRAMEBUFFERS; ++i)
	{
		if (x->framebuffers[i] != NULL)
			sysmem_freeptr(x->framebuffers[i]);

		x->framebuffers[i] = NULL;
	}

	NDIlib_send_destroy(x->ndiSendInstance);
	x->ndiSendInstance = NULL;

	sysmem_freeptr(x->ndiVideoFrame);
	x->ndiVideoFrame = NULL;
}

t_jit_err jit_spill_matrix_calc(t_jit_ndi_send* x, void* inputs, void* outputs)
{
	t_jit_err err = JIT_ERR_NONE;
	long inputLock;
	t_jit_matrix_info inputMatrixInfo;
	char* inputData;

	void* inputMatrix = jit_object_method(inputs, _jit_sym_getindex, 0);

	if (x && inputMatrix)
	{
		inputLock = (long)jit_object_method(inputMatrix, _jit_sym_lock, 1);
		jit_object_method(inputMatrix, _jit_sym_getinfo, &inputMatrixInfo);
		jit_object_method(inputMatrix, _jit_sym_getdata, &inputData);

		if (!inputData)
		{
			err = JIT_ERR_INVALID_INPUT;
			goto out;
		}

		if (inputMatrixInfo.dimcount != 2)
		{
			err = JIT_ERR_INVALID_INPUT;
			goto out;
		}

		if (inputMatrixInfo.dim[0] != x->ndiVideoFrame->xres || inputMatrixInfo.dim[1] != x->ndiVideoFrame->yres)
		{
			// Make sure that NDI isn't still using the last framebuffer
			NDIlib_send_send_video_async_v2(x->ndiSendInstance, NULL);

			for (int i = 0; i < NUM_FRAMEBUFFERS; ++i)
			{
				if (x->framebuffers[i] != NULL)
					sysmem_freeptr(x->framebuffers[i]);

				x->framebuffers[i] = NULL;
			}

			x->ndiVideoFrame->xres = inputMatrixInfo.dim[0];
			x->ndiVideoFrame->yres = inputMatrixInfo.dim[1];
			x->ndiVideoFrame->line_stride_in_bytes = x->ndiVideoFrame->xres * 4;

			for (int i = 0; i < NUM_FRAMEBUFFERS; ++i)
				x->framebuffers[i] = sysmem_newptr(x->ndiVideoFrame->xres * x->ndiVideoFrame->yres * 4);
		}

		char* src = inputData;
		char* dst = x->framebuffers[x->framebufferIndex];

		if (inputMatrixInfo.planecount == 3)
		{
			for(int dy = 0; dy < x->ndiVideoFrame->yres; ++dy)
			{
				for(int dx = 0; dx < x->ndiVideoFrame->xres; ++dx)
				{
					*(dst++) = *(src++);
					*(dst++) = *(src++);
					*(dst++) = *(src++);
					*(dst++) = 0;
				}
			}
		}
		else if (inputMatrixInfo.planecount == 4)
		{
			for(int dy = 0; dy < x->ndiVideoFrame->yres; ++dy)
			{
				for(int dx = 0; dx < x->ndiVideoFrame->xres; ++dx)
				{
					*(dst++) = *(src+1);
					*(dst++) = *(src+2);
					*(dst++) = *(src+3);
					*(dst++) = *(src);

					src += 4;
				}
			}
		}
		else
		{
			err = JIT_ERR_INVALID_INPUT;
			goto out;
		}

		x->ndiVideoFrame->p_data = x->framebuffers[x->framebufferIndex];

		++x->framebufferIndex;
		x->framebufferIndex %= NUM_FRAMEBUFFERS;

		NDIlib_send_send_video_async_v2(x->ndiSendInstance, x->ndiVideoFrame);
	}
	else
	{
		return JIT_ERR_INVALID_PTR;
	}

out:
	jit_object_method(inputMatrix, _jit_sym_lock, inputLock);
	return err;
}
