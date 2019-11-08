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
#include <max.jit.mop.h>

#include <Processing.NDI.Lib.h>

#include "ndi_runtime.h"

#define DEFAULT_INTERNAL_MATRIX_WIDTH 1920
#define DEFAULT_INTERNAL_MATRIX_HEIGHT 1080

NDIlib_v4* ndiLib;

typedef enum _ColorMode
{
	COLORMODE_ARGB,
	COLORMODE_UYVY

} ColorMode;

typedef enum _WhiteBalanceMode
{
	WHITEBALANCEMODE_AUTO,
	WHITEBALANCEMODE_AUTO_INDOOR,
	WHITEBALANCEMODE_AUTO_OUTDOOR,
	WHITEBALANCEMODE_MANUAL

} WhiteBalanceMode;

typedef struct _jit_ndi_receive
{
	t_object object;

	NDIlib_find_instance_t ndiFinder;
	NDIlib_recv_instance_t ndiReceiver;
	NDIlib_framesync_instance_t ndiFrameSync;

	t_dictionary* sources;
	t_symbol* activeSourceId;

	t_jit_object* matrix;
	int matrixWidth;
	int matrixHeight;
	NDIlib_FourCC_type_e lastFourCCType;

	double samplerate;

	t_systhread receiveThread;
	bool isCancelThread;

	t_symbol* attrHostName;
	t_symbol* attrSourceName;
	t_atom_long attrNumAudioChannels;

	t_bool attrTallyOnProgram;
	t_bool attrTallyOnPreview;

	ColorMode attrColorMode;
	t_bool attrLowBandwidth;

	float attrPtzZoom;
	float attrPtzZoomSpeed;
	float attrPtzPanTilt[2];
	float attrPtzPanTiltSpeed[2];

	t_bool attrPtzAutoFocus;
	float attrPtzFocus;

	WhiteBalanceMode attrPtzWhiteBalanceMode;
	float attrPtzWhiteBalanceRed;
	float attrPtzWhiteBalanceBlue;

	t_bool attrPtzAutoExposure;
	float attrPtzExposure;


} t_jit_ndi_receive;

t_symbol* _sym_argb;
t_symbol* _sym_uyvy;

t_jit_err jit_ndi_receive_init();
t_jit_ndi_receive* jit_ndi_receive_new(t_symbol* hostName, t_symbol* sourceName, t_atom_long numAudioChannels);
void jit_ndi_receive_free(t_jit_ndi_receive* x);

t_jit_err jit_ndi_receive_matrix_calc(t_jit_ndi_receive* x, void* inputs, void* outputs);

void jit_ndi_receive_create_receiver(t_jit_ndi_receive* x);
void jit_ndi_receive_free_receiver(t_jit_ndi_receive* x);

void jit_ndi_receive_threadproc(t_jit_ndi_receive* x);
void jit_ndi_receive_resize_internal_matrix(t_jit_ndi_receive *x, long width, long height);

void jit_ndi_receive_process_video(t_jit_ndi_receive* x, const NDIlib_video_frame_v2_t* videoFrame);

void jit_ndi_receive_startaudio(t_jit_ndi_receive* x, double samplerate);
void jit_ndi_receive_get_samples(t_jit_ndi_receive* x, double** outs, long sampleFrames);

void jit_ndi_receive_refreshsources(t_jit_ndi_receive* x);
void jit_ndi_receive_update_tally(t_jit_ndi_receive* x);

t_jit_err jit_ndi_receive_setattr_hostname(t_jit_ndi_receive* x, void* attr, long argc, t_atom* argv);
t_jit_err jit_ndi_receive_setattr_sourcename(t_jit_ndi_receive* x, void* attr, long argc, t_atom* argv);
t_jit_err jit_ndi_receive_setattr_colormode(t_jit_ndi_receive* x, void* attr, long argc, t_atom* argv);
t_jit_err jit_ndi_receive_setattr_lowbandwidth(t_jit_ndi_receive* x, void* attr, long argc, t_atom* argv);
t_jit_err jit_ndi_receive_setattr_tally_onprogram(t_jit_ndi_receive* x, void* attr, long argc, t_atom* argv);
t_jit_err jit_ndi_receive_setattr_tally_onpreview(t_jit_ndi_receive* x, void* attr, long argc, t_atom* argv);

t_symbol* pack_source_id(t_symbol* hostName, t_symbol* sourceName);
bool unpack_source_id(t_symbol** hostName, t_symbol** sourceName, const char* const sourceId);

void* _jit_ndi_receive_class;

// --------------------------------------------------------------------------------

t_jit_err jit_ndi_receive_init()
{
	_sym_argb = gensym("argb");
	_sym_uyvy = gensym("uyvy");

	_jit_ndi_receive_class = jit_class_new("jit_ndi_receive",
	                                    (method)jit_ndi_receive_new, (method)jit_ndi_receive_free,
	                                    sizeof(t_jit_ndi_receive), A_DEFSYM, 0L);

	t_jit_object* mop = jit_object_new(_jit_sym_jit_mop, 0, 1);
	jit_class_addadornment(_jit_ndi_receive_class, mop);

	jit_class_addmethod(_jit_ndi_receive_class, (method)jit_ndi_receive_matrix_calc, "matrix_calc", A_CANT, 0L);

	jit_class_addmethod(_jit_ndi_receive_class, (method)jit_object_register, "register", A_CANT, 0L);

	jit_class_addmethod(_jit_ndi_receive_class, (method)jit_ndi_receive_startaudio, "audio_start", A_CANT, 0L);
	jit_class_addmethod(_jit_ndi_receive_class, (method)jit_ndi_receive_get_samples, "get_samples", A_CANT, 0L);

	long attrflags = JIT_ATTR_GET_DEFER_LOW | JIT_ATTR_SET_USURP_LOW;

	t_jit_object* attr = jit_object_new(_jit_sym_jit_attr_offset, "hostname", _jit_sym_symbol, attrflags, 
		(method)0L, (method)jit_ndi_receive_setattr_hostname, calcoffset(t_jit_ndi_receive, attrHostName));
	jit_class_addattr(_jit_ndi_receive_class, attr);
	object_addattr_parse(attr, "label",_jit_sym_symbol, 0, "\"NDI Host Name\"");
	object_addattr_parse(attr, "order",_jit_sym_long, 0, "1");


	attr = jit_object_new(_jit_sym_jit_attr_offset, "name", _jit_sym_symbol, attrflags, 
		(method)0L, (method)jit_ndi_receive_setattr_sourcename, calcoffset(t_jit_ndi_receive, attrSourceName));
	jit_class_addattr(_jit_ndi_receive_class, attr);
	object_addattr_parse(attr, "label",_jit_sym_symbol, 0, "\"NDI Source Name\"");
	object_addattr_parse(attr, "order",_jit_sym_long, 0, "2");
	
	attr = jit_object_new(_jit_sym_jit_attr_offset, "colormode", _jit_sym_char, attrflags, 
		(method)0L, (method)jit_ndi_receive_setattr_colormode, calcoffset(t_jit_ndi_receive, attrColorMode));
	jit_class_addattr(_jit_ndi_receive_class, attr);
	object_addattr_parse(attr, "label",_jit_sym_symbol, 0, "\"Color Mode\"");
	object_addattr_parse(attr, "style", _jit_sym_symbol, 0, "enumindex");
	object_addattr_parse(attr, "enumvals", _jit_sym_symbol, 0, "argb uyvy");
	object_addattr_parse(attr, "order",_jit_sym_long, 0, "3");

	attr = jit_object_new(_jit_sym_jit_attr_offset, "low_bandwidth", _jit_sym_char, attrflags, 
		(method)0L, (method)jit_ndi_receive_setattr_lowbandwidth, calcoffset(t_jit_ndi_receive, attrLowBandwidth));
	jit_class_addattr(_jit_ndi_receive_class, attr);
	object_addattr_parse(attr, "label",_jit_sym_symbol, 0, "\"Low Bandwidth Mode\"");
	object_addattr_parse(attr, "style",_jit_sym_symbol, 0, "onoff");
	object_addattr_parse(attr, "order",_jit_sym_long, 0, "4");

	attr = jit_object_new(_jit_sym_jit_attr_offset, "tally_onprogram", _jit_sym_char, attrflags, 
		(method)0L, (method)jit_ndi_receive_setattr_tally_onprogram, calcoffset(t_jit_ndi_receive, attrTallyOnProgram));
	jit_class_addattr(_jit_ndi_receive_class, attr);
	object_addattr_parse(attr, "label",_jit_sym_symbol, 0, "\"On Program\"");
	object_addattr_parse(attr, "style",_jit_sym_symbol, 0, "onoff");
	object_addattr_parse(attr, "category",_jit_sym_symbol, 0, "\"Tally\"");
	object_addattr_parse(attr, "order",_jit_sym_long, 0, "1");

	attr = jit_object_new(_jit_sym_jit_attr_offset, "tally_onpreview", _jit_sym_char, attrflags, 
		(method)0L, (method)jit_ndi_receive_setattr_tally_onpreview, calcoffset(t_jit_ndi_receive, attrTallyOnPreview));
	jit_class_addattr(_jit_ndi_receive_class, attr);
	object_addattr_parse(attr, "label",_jit_sym_symbol, 0, "\"On Preview\"");
	object_addattr_parse(attr, "style",_jit_sym_symbol, 0, "onoff");
	object_addattr_parse(attr, "category",_jit_sym_symbol, 0, "\"Tally\"");
	object_addattr_parse(attr, "order",_jit_sym_long, 0, "2");


	attr = jit_object_new(_jit_sym_jit_attr_offset, "ptz_zoom", _jit_sym_float32, attrflags, 
		(method)0L, (method)0L, calcoffset(t_jit_ndi_receive, attrPtzZoom));
	jit_class_addattr(_jit_ndi_receive_class, attr);
	attr_addfilter_clip(attr, 0, 1, true, true);
	object_addattr_parse(attr, "label",_jit_sym_symbol, 0, "\"Zoom\"");
	object_addattr_parse(attr, "category",_jit_sym_symbol, 0, "\"PTZ Controls\"");
	object_addattr_parse(attr, "order",_jit_sym_long, 0, "1");

	attr = jit_object_new(_jit_sym_jit_attr_offset, "ptz_zoom_speed", _jit_sym_float32, attrflags, 
		(method)0L, (method)0L, calcoffset(t_jit_ndi_receive, attrPtzZoomSpeed));
	jit_class_addattr(_jit_ndi_receive_class, attr);
	attr_addfilter_clip(attr, 0, 1, true, true);
	object_addattr_parse(attr, "label",_jit_sym_symbol, 0, "\"Zoom Speed\"");
	object_addattr_parse(attr, "category",_jit_sym_symbol, 0, "\"PTZ Controls\"");
	object_addattr_parse(attr, "order",_jit_sym_long, 0, "2");

	attr = jit_object_new(_jit_sym_jit_attr_offset_array, "ptz_pantilt", _jit_sym_float32, 2, attrflags, 
		(method)0L, (method)0L, NULL, calcoffset(t_jit_ndi_receive, attrPtzPanTilt));
	jit_class_addattr(_jit_ndi_receive_class, attr);
	attr_addfilter_clip(attr, 0, 1, true, true);
	object_addattr_parse(attr, "label",_jit_sym_symbol, 0, "\"Pan/Tilt\"");
	object_addattr_parse(attr, "category",_jit_sym_symbol, 0, "\"PTZ Controls\"");
	object_addattr_parse(attr, "order",_jit_sym_long, 0, "3");

	attr = jit_object_new(_jit_sym_jit_attr_offset_array, "ptz_pantilt_speed", _jit_sym_float32, 2, attrflags, 
		(method)0L, (method)0L, NULL, calcoffset(t_jit_ndi_receive, attrPtzPanTiltSpeed));
	jit_class_addattr(_jit_ndi_receive_class, attr);
	attr_addfilter_clip(attr, 0, 1, true, true);
	object_addattr_parse(attr, "label",_jit_sym_symbol, 0, "\"Pan/Tilt Speed\"");
	object_addattr_parse(attr, "category",_jit_sym_symbol, 0, "\"PTZ Controls\"");
	object_addattr_parse(attr, "order",_jit_sym_long, 0, "4");

	attr = jit_object_new(_jit_sym_jit_attr_offset, "ptz_autofocus", _jit_sym_char, attrflags, 
		(method)0L, (method)0L, calcoffset(t_jit_ndi_receive, attrPtzAutoFocus));
	jit_class_addattr(_jit_ndi_receive_class, attr);
	object_addattr_parse(attr, "label",_jit_sym_symbol, 0, "\"Auto-focus\"");
	object_addattr_parse(attr, "style",_jit_sym_symbol, 0, "onoff");
	object_addattr_parse(attr, "category",_jit_sym_symbol, 0, "\"PTZ Controls\"");
	object_addattr_parse(attr, "order",_jit_sym_long, 0, "5");

	attr = jit_object_new(_jit_sym_jit_attr_offset, "ptz_focus", _jit_sym_float32, attrflags, 
		(method)0L, (method)0L, calcoffset(t_jit_ndi_receive, attrPtzFocus));
	jit_class_addattr(_jit_ndi_receive_class, attr);
	attr_addfilter_clip(attr, 0, 1, true, true);
	object_addattr_parse(attr, "label",_jit_sym_symbol, 0, "\"Focus\"");
	object_addattr_parse(attr, "category",_jit_sym_symbol, 0, "\"PTZ Controls\"");
	object_addattr_parse(attr, "order",_jit_sym_long, 0, "6");
	object_addattr_parse(attr, "disabled",_jit_sym_long, 0, "1");

	attr = jit_object_new(_jit_sym_jit_attr_offset, "ptz_whitebalance", _jit_sym_char, attrflags, 
		(method)0L, (method)0L, calcoffset(t_jit_ndi_receive, attrPtzWhiteBalanceMode));
	jit_class_addattr(_jit_ndi_receive_class, attr);
	object_addattr_parse(attr, "label",_jit_sym_symbol, 0, "\"White Balance Mode\"");
	object_addattr_parse(attr, "style",_jit_sym_symbol, 0, "enumindex");
	object_addattr_parse(attr, "enumvals", _jit_sym_symbol, 0, "\"Auto\" \"Auto (Indoor)\" \"Auto (Outdoor)\" \"Manual\"");
	object_addattr_parse(attr, "category",_jit_sym_symbol, 0, "\"PTZ Controls\"");
	object_addattr_parse(attr, "order",_jit_sym_long, 0, "7");

	attr = jit_object_new(_jit_sym_jit_attr_offset, "ptz_whitebalance_red", _jit_sym_float32, attrflags, 
		(method)0L, (method)0L, calcoffset(t_jit_ndi_receive, attrPtzWhiteBalanceRed));
	jit_class_addattr(_jit_ndi_receive_class, attr);
	attr_addfilter_clip(attr, 0, 1, true, true);
	object_addattr_parse(attr, "label",_jit_sym_symbol, 0, "\"White Balance Red\"");
	object_addattr_parse(attr, "category",_jit_sym_symbol, 0, "\"PTZ Controls\"");
	object_addattr_parse(attr, "order",_jit_sym_long, 0, "8");
	object_addattr_parse(attr, "disabled",_jit_sym_long, 0, "1");

	attr = jit_object_new(_jit_sym_jit_attr_offset, "ptz_whitebalance_blue", _jit_sym_float32, attrflags, 
		(method)0L, (method)0L, calcoffset(t_jit_ndi_receive, attrPtzWhiteBalanceBlue));
	jit_class_addattr(_jit_ndi_receive_class, attr);
	attr_addfilter_clip(attr, 0, 1, true, true);
	object_addattr_parse(attr, "label",_jit_sym_symbol, 0, "\"White Balance Blue\"");
	object_addattr_parse(attr, "category",_jit_sym_symbol, 0, "\"PTZ Controls\"");
	object_addattr_parse(attr, "order",_jit_sym_long, 0, "9");
	object_addattr_parse(attr, "disabled",_jit_sym_long, 0, "1");

	attr = jit_object_new(_jit_sym_jit_attr_offset, "ptz_autoexposure", _jit_sym_char, attrflags, 
		(method)0L, (method)0L, calcoffset(t_jit_ndi_receive, attrPtzAutoExposure));
	jit_class_addattr(_jit_ndi_receive_class, attr);
	object_addattr_parse(attr, "label",_jit_sym_symbol, 0, "\"Auto-exposure\"");
	object_addattr_parse(attr, "style",_jit_sym_symbol, 0, "onoff");
	object_addattr_parse(attr, "category",_jit_sym_symbol, 0, "\"PTZ Controls\"");
	object_addattr_parse(attr, "order",_jit_sym_long, 0, "10");

	attr = jit_object_new(_jit_sym_jit_attr_offset, "ptz_exposure", _jit_sym_float32, attrflags, 
		(method)0L, (method)0L, calcoffset(t_jit_ndi_receive, attrPtzExposure));
	jit_class_addattr(_jit_ndi_receive_class, attr);
	attr_addfilter_clip(attr, 0, 1, true, true);
	object_addattr_parse(attr, "label",_jit_sym_symbol, 0, "\"Exposure\"");
	object_addattr_parse(attr, "category",_jit_sym_symbol, 0, "\"PTZ Controls\"");
	object_addattr_parse(attr, "order",_jit_sym_long, 0, "11");
	object_addattr_parse(attr, "disabled",_jit_sym_long, 0, "1");


	jit_class_register(_jit_ndi_receive_class);

	return JIT_ERR_NONE;
}


t_jit_ndi_receive* jit_ndi_receive_new(t_symbol* hostName, t_symbol* sourceName, t_atom_long numAudioChannels)
{
	t_jit_ndi_receive* x;

	if (!ndiLib->NDIlib_initialize())
	{
		jit_object_error(NULL, "jit.ndi.send: This machine does not meet the specification required to run NDI.");
		return NULL;
	}

	if (!((x = (t_jit_ndi_receive *)jit_object_alloc(_jit_ndi_receive_class))))
		return NULL;

	x->lastFourCCType = -1;
	jit_ndi_receive_resize_internal_matrix(x, DEFAULT_INTERNAL_MATRIX_WIDTH / (x->attrColorMode == COLORMODE_UYVY ? 2 : 1), DEFAULT_INTERNAL_MATRIX_HEIGHT);

	x->ndiReceiver = NULL;
	x->ndiFrameSync = NULL;

	x->receiveThread = NULL;
	x->isCancelThread = false;
	
	x->samplerate = 0;

	x->attrHostName = hostName;
	x->attrSourceName = sourceName;
	x->attrNumAudioChannels = numAudioChannels;
	x->attrTallyOnProgram = false;
	x->attrTallyOnPreview = false;

	x->attrLowBandwidth = false;

	x->attrPtzZoom = 0.5;
	x->attrPtzZoomSpeed = 1;
	x->attrPtzPanTilt[0] = 0.5;
	x->attrPtzPanTilt[1] = 0.5;
	x->attrPtzPanTiltSpeed[0] = 1;
	x->attrPtzPanTiltSpeed[1] = 1;
	x->attrPtzAutoFocus = true;
	x->attrPtzFocus = 0.5;
	x->attrPtzWhiteBalanceMode = WHITEBALANCEMODE_AUTO;
	x->attrPtzWhiteBalanceRed = 0.5;
	x->attrPtzWhiteBalanceBlue = 0.5;
	x->attrPtzAutoExposure = true;
	x->attrPtzExposure = 0.5;

	x->activeSourceId = pack_source_id(x->attrHostName, x->attrSourceName);

	NDIlib_find_create_t finderCreateDesc = { 0 };
	finderCreateDesc.show_local_sources = true;

	x->ndiFinder = ndiLib->NDIlib_find_create_v2(&finderCreateDesc);
	x->sources = dictionary_new();

	jit_ndi_receive_create_receiver(x);

	return x;
}

void jit_ndi_receive_free(t_jit_ndi_receive* x)
{
	if (!x)
		return;

	ndiLib->NDIlib_find_destroy(x->ndiFinder);
	object_free(x->sources);

	jit_ndi_receive_free_receiver(x);

	jit_object_free(x->matrix);
}


t_jit_err jit_ndi_receive_matrix_calc(t_jit_ndi_receive* x, void* inputs, void* outputs)
{
	t_jit_err err = JIT_ERR_NONE;
	long lock;
	long inputLock;
	void* outputMatrix = jit_object_method(outputs,_jit_sym_getindex, 0);

	if (x->ndiFrameSync != NULL)
	{
		NDIlib_video_frame_v2_t videoFrame = { 0 };
		ndiLib->NDIlib_framesync_capture_video(x->ndiFrameSync, &videoFrame, NDIlib_frame_format_type_progressive);
		jit_ndi_receive_process_video(x, &videoFrame);
		ndiLib->NDIlib_framesync_free_video(x->ndiFrameSync, &videoFrame);
	}

	if (x && outputMatrix)
	{
		lock = (long)jit_object_method(outputMatrix, _jit_sym_lock, 1);
		inputLock = (long)jit_object_method(x->matrix, _jit_sym_lock, 1);

		t_jit_matrix_info info;
		jit_object_method(x->matrix, _jit_sym_getinfo, &info);
		jit_object_method(outputMatrix, _jit_sym_setinfo, &info);

		t_matrix_conv_info convInfo = { 0 };
		convInfo.flags = JIT_MATRIX_CONVERT_SRCDIM;
		convInfo.planemap[0] = 0;
		convInfo.planemap[1] = 1;
		convInfo.planemap[2] = 2;
		convInfo.planemap[3] = 3;
		convInfo.srcdimstart[0] = 0;
		convInfo.srcdimstart[1] = 0;
		convInfo.srcdimend[0] = info.dim[0];
		convInfo.srcdimend[1] = info.dim[1];
		convInfo.dstdimstart[0] = 0;
		convInfo.dstdimstart[1] = 0;
		convInfo.dstdimend[0] = info.dim[0];
		convInfo.dstdimend[1] = info.dim[1];

		err = jit_object_method(outputMatrix, _jit_sym_frommatrix, x->matrix, &convInfo);
	}
	else
	{
		return JIT_ERR_INVALID_PTR;
	}

	jit_object_method(outputMatrix, _jit_sym_lock, lock);
	jit_object_method(x->matrix, _jit_sym_lock, inputLock);
	return err;
}


void jit_ndi_receive_create_receiver(t_jit_ndi_receive* x)
{
	if (x->ndiReceiver != NULL)
		ndiLib->NDIlib_recv_destroy(x->ndiReceiver);

	if (x->activeSourceId == NULL)
		return;

	NDIlib_recv_create_v3_t receiverCreateDesc = { 0 };
	receiverCreateDesc.source_to_connect_to.p_ndi_name = x->activeSourceId->s_name;

	// Seems like we should be using NDIlib_recv_color_format_RGBX_RGBA instead below, but causes internal NDI SDK crash
	receiverCreateDesc.color_format = x->attrColorMode == COLORMODE_UYVY ? NDIlib_recv_color_format_UYVY_BGRA : NDIlib_recv_color_format_BGRX_BGRA;
	receiverCreateDesc.allow_video_fields = false;
	receiverCreateDesc.bandwidth = x->attrLowBandwidth ? NDIlib_recv_bandwidth_lowest : NDIlib_recv_bandwidth_highest;

	x->ndiReceiver = ndiLib->NDIlib_recv_create_v3(&receiverCreateDesc);
	if (x->ndiReceiver == NULL)
	{
		object_error((t_object*)x, "Failed to connect to source '%s'", x->attrSourceName->s_name);
		return;
	}

	x->ndiFrameSync = ndiLib->NDIlib_framesync_create(x->ndiReceiver);

	systhread_create((method)jit_ndi_receive_threadproc, x, 0, 0, 0, &x->receiveThread);
}

void jit_ndi_receive_free_receiver(t_jit_ndi_receive* x)
{
	if (x->ndiReceiver == NULL)
		return;

	x->isCancelThread = true;
	unsigned retVal;
	systhread_join(x->receiveThread, &retVal);

	x->receiveThread = NULL;
	x->isCancelThread = false;

	ndiLib->NDIlib_framesync_destroy(x->ndiFrameSync);

	ndiLib->NDIlib_recv_destroy(x->ndiReceiver);
}


void jit_ndi_receive_threadproc(t_jit_ndi_receive* x)
{
	NDIlib_metadata_frame_t metadataFrame = { 0 };

	while(!x->isCancelThread)
	{

		switch (ndiLib->NDIlib_recv_capture_v2(x->ndiReceiver, NULL, NULL, &metadataFrame, 250))
		{	
			default:
			case NDIlib_frame_type_none:
				break;

			case NDIlib_frame_type_metadata:
				ndiLib->NDIlib_recv_free_metadata(x->ndiReceiver, &metadataFrame);
				break;

			case NDIlib_frame_type_status_change:
				break;
		}
	}
}

void jit_ndi_receive_resize_internal_matrix(t_jit_ndi_receive *x, long width, long height)
{
	x->matrixWidth = width;
	x->matrixHeight = height;

	t_jit_matrix_info info;
	jit_matrix_info_default(&info);
	info.type = _jit_sym_char;
	info.planecount = 4;
	info.dimcount = 2;
	info.dim[0] = x->matrixWidth;
	info.dim[1] = x->matrixHeight;

	if (x->matrix == NULL)
		x->matrix = jit_object_new(_jit_sym_jit_matrix, &info);
	else
		jit_object_method(x->matrix, _jit_sym_setinfo, &info);
}

void jit_ndi_receive_process_video(t_jit_ndi_receive* x, const NDIlib_video_frame_v2_t* videoFrame)
{
	long lock = (long)jit_object_method(x->matrix,_jit_sym_lock, 1);
				
	const int targetWidth = videoFrame->xres / (videoFrame->FourCC == NDIlib_FourCC_type_UYVY ? 2 : 1);

	if (x->matrixWidth != targetWidth || x->matrixHeight != videoFrame->yres || x->lastFourCCType != videoFrame->FourCC)
		jit_ndi_receive_resize_internal_matrix(x, targetWidth, videoFrame->yres);

	x->lastFourCCType = videoFrame->FourCC;

	char* data;
	jit_object_method(x->matrix,_jit_sym_getdata, &data);

	if (data == NULL)
		return true;

	uint8_t* src = videoFrame->p_data;
	uint8_t* dst = (uint8_t*)data;

	switch(videoFrame->FourCC)
	{
		case NDIlib_FourCC_type_BGRX:
		case NDIlib_FourCC_type_BGRA:

			for(int dy = 0; dy < videoFrame->yres; dy++)
			{
				for(int dx = 0; dx < videoFrame->xres; dx++)
				{
					*(dst++) = videoFrame->FourCC == NDIlib_FourCC_type_BGRA ? *(src + 3) : 255;
					*(dst++) = *(src + 2);
					*(dst++) = *(src + 1);
					*(dst++) = *(src);

					src += 4;
				}
			}

			break;

		case NDIlib_FourCC_type_UYVY:
		{
			const int length = videoFrame->yres * videoFrame->line_stride_in_bytes;
			for(int i = 0; i < length; i++)
				*(dst++) = *(src++);
		}
			break;

		default:
			break;
	}

	jit_object_method(x->matrix,_jit_sym_lock, lock);
}


void jit_ndi_receive_startaudio(t_jit_ndi_receive* x, double samplerate)
{
	x->samplerate = samplerate;
}

void jit_ndi_receive_get_samples(t_jit_ndi_receive* x, double** outs, long sampleFrames)
{
	assert(x->samplerate != 0);

	NDIlib_audio_frame_v2_t audioFrame = { 0 };
	ndiLib->NDIlib_framesync_capture_audio(x->ndiFrameSync, &audioFrame, x->samplerate, x->attrNumAudioChannels, sampleFrames);

	assert(audioFrame.no_channels == x->attrNumAudioChannels);
	assert(audioFrame.no_samples == sampleFrames);

	for(int i = 0; i < x->attrNumAudioChannels; ++i)
	{
		double* dst = outs[i];
		float* src = audioFrame.p_data + ((audioFrame.channel_stride_in_bytes / sizeof(float)) * i);

		for(int j = 0; j < sampleFrames; ++j)
			*dst++ = *src++;
	}

	ndiLib->NDIlib_framesync_free_audio(x->ndiFrameSync, &audioFrame);
}

void jit_ndi_receive_refreshsources(t_jit_ndi_receive* x)
{
	dictionary_clear(x->sources);

	uint32_t numSources = 0;
	const NDIlib_source_t* sources = ndiLib->NDIlib_find_get_current_sources(x->ndiFinder, &numSources);

	for (uint32_t i = 0; i < numSources; ++i)
	{
		t_symbol* hostName;
		t_symbol* sourceName;

		if (!unpack_source_id(&hostName, &sourceName, sources[i].p_ndi_name))
		{
			object_error((t_object*)x, "Failed to parse NDI source name '%s'", sources[i].p_ndi_name);
			continue;
		}

		t_dictionary* hostSources = NULL;

		if (dictionary_getdictionary(x->sources, hostName, (t_object**)&hostSources) != MAX_ERR_NONE)
		{
			hostSources = dictionary_new();
			dictionary_appenddictionary(x->sources, hostName, (t_object*)hostSources);
		}

		dictionary_appendsym(hostSources, sourceName, gensym(sources[i].p_ndi_name));
	}
}

void jit_ndi_receive_update_tally(t_jit_ndi_receive* x)
{
	if (x->ndiReceiver == NULL)
		return;

	NDIlib_tally_t tallyState;
	tallyState.on_program = x->attrTallyOnProgram;
	tallyState.on_preview = x->attrTallyOnPreview;
	ndiLib->NDIlib_recv_set_tally(x->ndiReceiver, &tallyState);
}



t_jit_err jit_ndi_receive_setattr_hostname(t_jit_ndi_receive* x, void* attr, long argc, t_atom* argv)
{
	if (argc < 1)
		return JIT_ERR_NONE;

	t_symbol* s = jit_atom_getsym(argv);

	if (s != x->attrHostName)
	{
		x->attrHostName = s;
		x->activeSourceId = pack_source_id(x->attrHostName, x->attrSourceName);
		jit_ndi_receive_create_receiver(x);
	}

	return JIT_ERR_NONE;
}

t_jit_err jit_ndi_receive_setattr_sourcename(t_jit_ndi_receive* x, void* attr, long argc, t_atom* argv)
{
	if (argc < 1)
		return JIT_ERR_NONE;

	t_symbol* s = jit_atom_getsym(argv);

	if (s != x->attrHostName)
	{
		x->attrSourceName = s;
		x->activeSourceId = pack_source_id(x->attrHostName, x->attrSourceName);
		jit_ndi_receive_create_receiver(x);
	}

	return JIT_ERR_NONE;
}

t_jit_err jit_ndi_receive_setattr_colormode(t_jit_ndi_receive* x, void* attr, long argc, t_atom* argv)
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
		jit_ndi_receive_create_receiver(x);
	}

	return JIT_ERR_NONE;
}

t_jit_err jit_ndi_receive_setattr_lowbandwidth(t_jit_ndi_receive* x, void* attr, long argc, t_atom* argv)
{
	if (argc < 1)
		return JIT_ERR_NONE;

	const t_bool v = jit_atom_getlong(argv) > 0;

	if (v != x->attrLowBandwidth)
	{
		x->attrLowBandwidth = v;
		jit_ndi_receive_create_receiver(x);
	}

	return JIT_ERR_NONE;
}

t_jit_err jit_ndi_receive_setattr_tally_onprogram(t_jit_ndi_receive* x, void* attr, long argc, t_atom* argv)
{
	if (argc < 1)
		return JIT_ERR_NONE;

	const t_bool v = jit_atom_getlong(argv) > 0;

	if (v != x->attrTallyOnProgram)
	{
		x->attrTallyOnProgram = v;
		jit_ndi_receive_update_tally(x);
	}

	return JIT_ERR_NONE;
}

t_jit_err jit_ndi_receive_setattr_tally_onpreview(t_jit_ndi_receive* x, void* attr, long argc, t_atom* argv)
{
	if (argc < 1)
		return JIT_ERR_NONE;

	const t_bool v = jit_atom_getlong(argv) > 0;

	if (v != x->attrTallyOnPreview)
	{
		x->attrTallyOnPreview = v;
		jit_ndi_receive_update_tally(x);
	}

	return JIT_ERR_NONE;
}


t_symbol* pack_source_id(t_symbol* hostName, t_symbol* sourceName)
{
	if (hostName == NULL || sourceName == NULL || hostName == _jit_sym_nothing || sourceName == _jit_sym_nothing)
		return NULL;

	const size_t bufferLength = strlen(hostName->s_name) + strlen(sourceName->s_name) + 4;
	char* buffer = jit_newptr(bufferLength);

	snprintf(buffer, bufferLength, "%s (%s)", hostName->s_name, sourceName->s_name);

	t_symbol* sourceId = gensym(buffer);

	jit_disposeptr(buffer);

	return sourceId;
}

bool unpack_source_id(t_symbol** hostName, t_symbol** sourceName, const char* const sourceId)
{
	const size_t bufferLength = strlen(sourceId);
	char* hostNameBuffer = jit_newptr(bufferLength);
	char* sourceNameBuffer = jit_newptr(bufferLength);

	const int result = sscanf(sourceId, "%[^(](%[^)]", hostNameBuffer, sourceNameBuffer);

	if (result == 2)
	{
		*hostName = gensym(hostNameBuffer);
		*sourceName = gensym(sourceNameBuffer);
	}

	jit_disposeptr(hostNameBuffer);
	jit_disposeptr(sourceNameBuffer);

	return result == 2;
}