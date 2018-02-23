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

typedef enum _ColorMode
{
	COLORMODE_ARGB,
	COLORMODE_UYVY

} ColorMode;

typedef enum _Framerate
{
	FRAMERATE_23_98,
	FRAMERATE_24,
	FRAMERATE_25,
	FRAMERATE_29_97,
	FRAMERATE_30,
	FRAMERATE_48,
	FRAMERATE_50,
	FRAMERATE_59_94,
	FRAMERATE_60

} Framerate;

typedef struct _jit_ndi_send
{
	t_object object;

	NDIlib_send_instance_t ndiSendInstance;
	NDIlib_video_frame_v2_t* ndiFrameInfo;

	void* framebuffers[NUM_FRAMEBUFFERS];
	int framebufferIndex;

	t_symbol* attrSenderName;
	ColorMode attrColorMode;
	t_atom_long attrFramerate;

} t_jit_ndi_send;

t_symbol* _sym_argb;
t_symbol* _sym_uyvy;

t_jit_err jit_ndi_send_init();
t_jit_ndi_send* jit_ndi_send_new(t_symbol* sourceName);
void jit_ndi_send_free(t_jit_ndi_send* x);
t_jit_err jit_spill_matrix_calc(t_jit_ndi_send* x, void* inputs, void* outputs);

bool jit_ndi_create_sender(t_jit_ndi_send* x);
void jit_ndi_free_sender(t_jit_ndi_send* x);
void jit_ndi_create_frame_struct(t_jit_ndi_send* x);
void jit_ndi_free_frame_struct(t_jit_ndi_send* x);
void jit_ndi_create_frame_buffers(t_jit_ndi_send* x);
void jit_ndi_free_frame_buffers(t_jit_ndi_send* x);

t_jit_err jit_ndi_setattr_colormode(t_jit_ndi_send* x, void* attr, long argc, t_atom* argv);
t_jit_err jit_ndi_setattr_framerate(t_jit_ndi_send* x, void* attr, long argc, t_atom* argv);


void* _jit_ndi_send_class;

// --------------------------------------------------------------------------------

t_jit_err jit_ndi_send_init()
{
	_sym_argb = gensym("argb");
	_sym_uyvy = gensym("uyvy");

	_jit_ndi_send_class = jit_class_new("jit_ndi_send",
	                                    (method)jit_ndi_send_new, (method)jit_ndi_send_free,
	                                    sizeof(t_jit_ndi_send), A_DEFSYM, 0L);

	t_jit_object* mop = jit_object_new(_jit_sym_jit_mop, 1, 0);
	jit_class_addadornment(_jit_ndi_send_class, mop);

	jit_class_addmethod(_jit_ndi_send_class, (method)jit_spill_matrix_calc, "matrix_calc", A_CANT, 0L);


	long attrflags = JIT_ATTR_GET_DEFER_LOW | JIT_ATTR_SET_USURP_LOW;

	t_jit_object* attr = jit_object_new(_jit_sym_jit_attr_offset, "name", _jit_sym_symbol, attrflags | JIT_ATTR_SET_OPAQUE | JIT_ATTR_SET_OPAQUE_USER, 
		(method)0L, (method)0L, calcoffset(t_jit_ndi_send, attrSenderName));
	jit_class_addattr(_jit_ndi_send_class, attr);
	object_addattr_parse(attr, "label",_jit_sym_symbol, 0, "\"NDI Source Name\"");
	object_addattr_parse(attr, "order",_jit_sym_long, 0, "1");
	object_addattr_parse(attr, "disabled",_jit_sym_long, 0, "1");

	attr = jit_object_new(_jit_sym_jit_attr_offset, "colormode", _jit_sym_long, attrflags, 
		(method)0L, (method)jit_ndi_setattr_colormode, calcoffset(t_jit_ndi_send, attrColorMode));
	jit_class_addattr(_jit_ndi_send_class, attr);
	object_addattr_parse(attr, "label",_jit_sym_symbol, 0, "\"Color Mode\"");
	object_addattr_parse(attr, "order",_jit_sym_long, 0, "2");
	object_addattr_parse(attr, "style", _jit_sym_symbol, 0, "enumindex");
	object_addattr_parse(attr, "enumvals", _jit_sym_symbol, 0, "argb uyvy");

	attr = jit_object_new(_jit_sym_jit_attr_offset, "framerate", _jit_sym_long, attrflags, 
		(method)0L, (method)jit_ndi_setattr_framerate, calcoffset(t_jit_ndi_send, attrFramerate));
	jit_class_addattr(_jit_ndi_send_class, attr);
	object_addattr_parse(attr, "label",_jit_sym_symbol, 0, "\"Framerate\"");
	object_addattr_parse(attr, "order",_jit_sym_long, 0, "3");
	object_addattr_parse(attr, "style", _jit_sym_symbol, 0, "enumindex");
	object_addattr_parse(attr, "enumvals", _jit_sym_symbol, 0, "\"23.98\" \"24\" \"25\" \"29.97\" \"30\" \"48\" \"50\" \"59.98\" \"60\"");

	jit_class_register(_jit_ndi_send_class);

	return JIT_ERR_NONE;
}


t_jit_ndi_send* jit_ndi_send_new(t_symbol* sourceName)
{
	t_jit_ndi_send* x;

	if (!NDIlib_initialize())
	{
		jit_object_error(NULL, "jit.ndi.send: This machine does not meet the specification required to run NDI.");
		return NULL;
	}

	if (!((x = (t_jit_ndi_send *)jit_object_alloc(_jit_ndi_send_class))))
		return NULL;

	x->attrSenderName = sourceName;
	x->attrFramerate = FRAMERATE_30;
	x->attrColorMode = COLORMODE_ARGB;

	for (int i = 0; i < NUM_FRAMEBUFFERS; ++i)
		x->framebuffers[i] = NULL;
	x->ndiFrameInfo = NULL;
	x->ndiSendInstance = NULL;

	if (!jit_ndi_create_sender(x))
	{
		object_error((t_object*)x, "Failed to create NDI sender, sender name '%s' may already be in use", sourceName->s_name);
		jit_object_free(x);
		return NULL; 
	}

	jit_ndi_create_frame_struct(x);

	return x;
}

void jit_ndi_send_free(t_jit_ndi_send* x)
{
	if (!x)
		return;

	jit_ndi_free_frame_buffers(x);
	jit_ndi_free_frame_struct(x);
	jit_ndi_free_sender(x);
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
			err = JIT_ERR_MISMATCH_DIM;
			goto out;
		}

		if (inputMatrixInfo.type != _jit_sym_char)
		{
			err = JIT_ERR_MISMATCH_TYPE;
			goto out;
		}

		if (inputMatrixInfo.dim[0] != x->ndiFrameInfo->xres / (x->attrColorMode == COLORMODE_UYVY ? 2 : 1) || inputMatrixInfo.dim[1] != x->ndiFrameInfo->yres)
		{
			jit_ndi_free_frame_buffers(x);

			x->ndiFrameInfo->xres = inputMatrixInfo.dim[0] * (x->attrColorMode == COLORMODE_UYVY ? 2 : 1);
			x->ndiFrameInfo->yres = inputMatrixInfo.dim[1];
			x->ndiFrameInfo->line_stride_in_bytes = x->ndiFrameInfo->xres * (x->attrColorMode == COLORMODE_UYVY ? 2 : 4);

			if (x->ndiFrameInfo->xres % 2 == 1 || x->ndiFrameInfo->yres % 2 == 1)
			{
				err = JIT_ERR_MISMATCH_DIM;
				jit_object_error((t_object*)x, "NDI frame dimensions must be divisible by 2");
				x->ndiFrameInfo->xres = -1;
				x->ndiFrameInfo->yres = -1;
				x->ndiFrameInfo->line_stride_in_bytes = 0;
				goto out;
			}

			jit_ndi_create_frame_buffers(x);
		}

		char* src = inputData;
		char* dst = x->framebuffers[x->framebufferIndex];


		switch(x->attrColorMode)
		{
			default: 
			case COLORMODE_ARGB:
			{
				if (inputMatrixInfo.planecount != 3 && inputMatrixInfo.planecount != 4)
				{
					err = JIT_ERR_MISMATCH_PLANE;
					goto out;
				}

				x->ndiFrameInfo->FourCC = inputMatrixInfo.planecount == 3 ? NDIlib_FourCC_type_RGBX : NDIlib_FourCC_type_RGBA;

				for(int dy = 0; dy < inputMatrixInfo.dim[1]; ++dy)
				{
					for(int dx = 0; dx < inputMatrixInfo.dim[0]; ++dx)
					{
						*(dst + 3) = inputMatrixInfo.planecount == 3 ? 255 : *(src++);
						*(dst) = *(src++);
						*(dst + 1) = *(src++);
						*(dst + 2) = *(src++);

						dst += 4;
					}
				}
			}
				break;

			case COLORMODE_UYVY:
			{
				if (inputMatrixInfo.planecount != 4)
				{
					err = JIT_ERR_MISMATCH_PLANE;
					goto out;
				}

				x->ndiFrameInfo->FourCC = NDIlib_FourCC_type_UYVY;

				for(int dy = 0; dy < inputMatrixInfo.dim[1]; ++dy)
				{
					for(int dx = 0; dx < inputMatrixInfo.dim[0]; ++dx)
					{
						*(dst++) = *(src++);
						*(dst++) = *(src++);
						*(dst++) = *(src++);
						*(dst++) = *(src++);
					}
				}
			}
				break;
		}

		x->ndiFrameInfo->p_data = x->framebuffers[x->framebufferIndex];

		++x->framebufferIndex;
		x->framebufferIndex %= NUM_FRAMEBUFFERS;

		NDIlib_send_send_video_async_v2(x->ndiSendInstance, x->ndiFrameInfo);
	}
	else
	{
		return JIT_ERR_INVALID_PTR;
	}

out:
	jit_object_method(inputMatrix, _jit_sym_lock, inputLock);
	return err;
}


bool jit_ndi_create_sender(t_jit_ndi_send* x)
{
	jit_ndi_free_sender(x);

	NDIlib_send_create_t ndiSendCreateDesc = { 0 };
	ndiSendCreateDesc.p_ndi_name = x->attrSenderName->s_name;
	ndiSendCreateDesc.clock_video = true;
	ndiSendCreateDesc.clock_audio = false;

	x->ndiSendInstance = NDIlib_send_create(&ndiSendCreateDesc);

	return x->ndiSendInstance != NULL;
}

void jit_ndi_free_sender(t_jit_ndi_send* x)
{
	if (x->ndiSendInstance != NULL)
	{
		// Make sure that NDI isn't still using the last framebuffer
		NDIlib_send_send_video_async_v2(x->ndiSendInstance, NULL);

		NDIlib_send_destroy(x->ndiSendInstance);
		x->ndiSendInstance = NULL;
	}
}

void jit_ndi_create_frame_struct(t_jit_ndi_send* x)
{
	jit_ndi_free_frame_struct(x);

	x->ndiFrameInfo = (NDIlib_video_frame_v2_t*)sysmem_newptrclear(sizeof(NDIlib_video_frame_v2_t));

	// These values will be filled in upon receiving a matrix
	x->ndiFrameInfo->xres = -1;
	x->ndiFrameInfo->yres = -1;
	x->ndiFrameInfo->FourCC = 0;

	switch(x->attrFramerate)
	{
		case FRAMERATE_23_98: x->ndiFrameInfo->frame_rate_N = 24000; x->ndiFrameInfo->frame_rate_D = 1001; break;
		case FRAMERATE_24: x->ndiFrameInfo->frame_rate_N = 24000; x->ndiFrameInfo->frame_rate_D = 1000; break;
		case FRAMERATE_25: x->ndiFrameInfo->frame_rate_N = 30000; x->ndiFrameInfo->frame_rate_D = 1200; break;
		default: case FRAMERATE_29_97: x->ndiFrameInfo->frame_rate_N = 30000; x->ndiFrameInfo->frame_rate_D = 1001; break;
		case FRAMERATE_30: x->ndiFrameInfo->frame_rate_N = 30000; x->ndiFrameInfo->frame_rate_D = 1000; break;
		case FRAMERATE_48: x->ndiFrameInfo->frame_rate_N = 48000; x->ndiFrameInfo->frame_rate_D = 1000; break;
		case FRAMERATE_50: x->ndiFrameInfo->frame_rate_N = 60000; x->ndiFrameInfo->frame_rate_D = 1200; break;
		case FRAMERATE_59_94: x->ndiFrameInfo->frame_rate_N = 60000; x->ndiFrameInfo->frame_rate_D = 1001; break;
		case FRAMERATE_60: x->ndiFrameInfo->frame_rate_N = 60000; x->ndiFrameInfo->frame_rate_D = 1000; break;
	}

	x->ndiFrameInfo->frame_format_type = NDIlib_frame_format_type_progressive;
	x->ndiFrameInfo->timecode = NDIlib_send_timecode_synthesize;
	x->ndiFrameInfo->timestamp = NDIlib_send_timecode_empty;
}

void jit_ndi_free_frame_struct(t_jit_ndi_send* x)
{
	if (x->ndiFrameInfo != NULL)
	{
		sysmem_freeptr(x->ndiFrameInfo);
		x->ndiFrameInfo = NULL;
	}
}

void jit_ndi_create_frame_buffers(t_jit_ndi_send* x)
{
	jit_ndi_free_frame_buffers(x);

	for (int i = 0; i < NUM_FRAMEBUFFERS; ++i)
		x->framebuffers[i] = jit_newptr(x->ndiFrameInfo->xres * x->ndiFrameInfo->yres * (x->attrColorMode == COLORMODE_UYVY ? 2 : 4));

	x->framebufferIndex = 0;
}

void jit_ndi_free_frame_buffers(t_jit_ndi_send* x)
{
	// Make sure that NDI isn't still using the last framebuffer
	NDIlib_send_send_video_async_v2(x->ndiSendInstance, NULL);

	for (int i = 0; i < NUM_FRAMEBUFFERS; ++i)
	{
		if (x->framebuffers[i] != NULL)
			jit_disposeptr(x->framebuffers[i]);

		x->framebuffers[i] = NULL;
	}
}



t_jit_err jit_ndi_setattr_colormode(t_jit_ndi_send* x, void* attr, long argc, t_atom* argv)
{
	if (argc < 1)
		return JIT_ERR_NONE;

	ColorMode updatedValue = x->attrColorMode;

	t_symbol* s = jit_atom_getsym(argv);

	if (s == _sym_argb)
		updatedValue = COLORMODE_ARGB;
	else if (s == _sym_uyvy)
		updatedValue = COLORMODE_UYVY;
	else
		updatedValue = CLAMP(jit_atom_getlong(argv), COLORMODE_ARGB, COLORMODE_UYVY);

	if (x->attrColorMode != updatedValue)
	{
		x->attrColorMode = updatedValue;
		jit_ndi_create_frame_buffers(x);
	}

	return JIT_ERR_NONE;
}

t_jit_err jit_ndi_setattr_framerate(t_jit_ndi_send* x, void* attr, long argc, t_atom* argv)
{
	if (argc < 1)
		return JIT_ERR_NONE;

	Framerate updatedValue = x->attrFramerate;

	if (atom_gettype(argv) == A_SYM && strchr(jit_atom_getsym(argv)->s_name, '.') != NULL) 
	{
		t_symbol* s = jit_atom_getsym(argv);

		if (strstr(s->s_name, "23") != NULL) updatedValue = FRAMERATE_23_98;
		else if (strstr(s->s_name, "29") != NULL) updatedValue = FRAMERATE_29_97;
		else if (strstr(s->s_name, "59") != NULL) updatedValue = FRAMERATE_59_94;
	}
	else
	{
		switch(jit_atom_getlong(argv))
		{
			case 0: case 23: updatedValue = FRAMERATE_23_98; break;
			case 1: case 24: updatedValue = FRAMERATE_24; break;
			case 2: case 25: updatedValue = FRAMERATE_25; break;
			case 3: case 29: updatedValue = FRAMERATE_29_97; break;
			case 4: case 30: updatedValue = FRAMERATE_30; break;
			case 5: case 48: updatedValue = FRAMERATE_48; break;
			case 6: case 50: updatedValue = FRAMERATE_50; break;
			case 7: case 59: updatedValue = FRAMERATE_59_94; break;
			case 8: case 60: updatedValue = FRAMERATE_60; break;
			default: break;
		}
	}
	
	if (x->attrFramerate != updatedValue)
	{
		x->attrFramerate = updatedValue;
		jit_ndi_create_frame_struct(x);
	}

	return JIT_ERR_NONE;
}