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

#ifndef H_JIT_NDI_RUNTIME
#define H_JIT_NDI_RUNTIME

#include <jit.common.h>
#include <Processing.NDI.Lib.h>

// TODO: Remove this if the NDI SDK is updated to include these functions
typedef struct NDIlib_framesync
{	
	NDIlib_framesync_instance_t (*NDIlib_framesync_create)(NDIlib_recv_instance_t p_receiver);
	void (*NDIlib_framesync_destroy)(NDIlib_framesync_instance_t p_instance);
	void (*NDIlib_framesync_capture_audio)(NDIlib_framesync_instance_t p_instance, NDIlib_audio_frame_v2_t* p_audio_data,
									int sample_rate, int no_channels, int no_samples);
	void (*NDIlib_framesync_free_audio)(NDIlib_framesync_instance_t p_instance, NDIlib_audio_frame_v2_t* p_audio_data);
	void (*NDIlib_framesync_capture_video)(NDIlib_framesync_instance_t p_instance, NDIlib_video_frame_v2_t* p_video_data,
									NDIlib_frame_format_type_e field_type NDILIB_CPP_DEFAULT_VALUE(NDIlib_frame_format_type_progressive));
	void (*NDIlib_framesync_free_video)(NDIlib_framesync_instance_t p_instance, NDIlib_video_frame_v2_t* p_video_data);

} NDIlib_framesync;

inline NDIlib_framesync* NDIlib_framesync_load(HMODULE runtimeModule)
{
	NDIlib_framesync* lib = (NDIlib_framesync*)malloc(sizeof(struct NDIlib_framesync));

	lib->NDIlib_framesync_create = (NDIlib_framesync_instance_t (*)(NDIlib_recv_instance_t))GetProcAddress(runtimeModule, "NDIlib_framesync_create");
	lib->NDIlib_framesync_destroy = (void (*)(NDIlib_recv_instance_t))GetProcAddress(runtimeModule, "NDIlib_framesync_destroy");
	lib->NDIlib_framesync_capture_audio = (void (*)(NDIlib_recv_instance_t, NDIlib_audio_frame_v2_t*, int, int, int))
											GetProcAddress(runtimeModule, "NDIlib_framesync_capture_audio");
	lib->NDIlib_framesync_free_audio = (void (*)(NDIlib_recv_instance_t, NDIlib_audio_frame_v2_t*))
											GetProcAddress(runtimeModule, "NDIlib_framesync_free_audio");
	lib->NDIlib_framesync_capture_video = (void (*)(NDIlib_recv_instance_t, NDIlib_video_frame_v2_t*, NDIlib_frame_format_type_e))
											GetProcAddress(runtimeModule, "NDIlib_framesync_capture_video");
	lib->NDIlib_framesync_free_video = (void (*)(NDIlib_recv_instance_t, NDIlib_video_frame_v2_t*))
											GetProcAddress(runtimeModule, "NDIlib_framesync_free_video");

	return lib;
}

#ifdef WIN_VERSION

inline void free_ndi_runtime(HMODULE* runtimeModule)
{
	if (*runtimeModule != NULL)
	{
		FreeLibrary(*runtimeModule);
		*runtimeModule = NULL;
	}
}

inline bool load_ndi_runtime(NDIlib_v3** ndiLib, NDIlib_framesync** ndiLibFramesync)
{
	*ndiLib = NULL;
	
	HMODULE runtimeModule = NULL;
	
	LPSTR runtimeDir[MAX_PATH];
	
	const DWORD runtimeDirLen = GetEnvironmentVariable(NDILIB_REDIST_FOLDER, runtimeDir, MAX_PATH);
	
	if (runtimeDirLen == 0)
	{
		error("Unable to load jit.ndi externals as NDI Runtime is not installed, please download and install from '%s' and restart Max.", NDILIB_REDIST_URL);
		return false;
	}
	
	LPSTR runtimeDllPath[MAX_PATH];
	
	snprintf(runtimeDllPath, MAX_PATH, "%s\\%s", runtimeDir, NDILIB_LIBRARY_NAME);
	
	runtimeModule = LoadLibrary(runtimeDllPath);
	if (runtimeModule == NULL)
	{
		error("Unable to load NDI runtime from path '%s'. Please download and reinstall NDI runtime from '%s' and restart Max", runtimeDllPath, NDILIB_REDIST_URL);
		return false;
	}
	
	quittask_install((method)free_ndi_runtime, &runtimeModule);
	
	FARPROC loadFunction = GetProcAddress(runtimeModule, "NDIlib_v3_load");
	
	if (loadFunction == NULL)
	{
		error("Unable to load NDI functions from DLL at path '%s'. Please download and reinstall NDI runtime from '%s' and restart Max", runtimeDllPath, NDILIB_REDIST_URL);
		return false;
	}
	
	*ndiLib = (NDIlib_v3*)loadFunction();

	if (ndiLibFramesync != NULL)
		*ndiLibFramesync = NDIlib_framesync_load(runtimeModule);
	
	return true;
}

#else

#include <dlfcn.h>

bool load_ndi_runtime(NDIlib_v3** ndiLib)
{
	char ndiRuntimePath[MAX_PATH_CHARS];
	
	const char* ndiRuntimeDirPath = getenv("NDI_RUNTIME_DIR_V3");
	if (ndiRuntimeDirPath)
		snprintf(ndiRuntimePath, MAX_PATH_CHARS, "%s/libndi.dylib", ndiRuntimeDirPath);
	else
		strncpy(ndiRuntimePath, NDILIB_LIBRARY_NAME, MAX_PATH_CHARS);
	
	void* ndiLibHandle = dlopen(ndiRuntimePath, RTLD_LOCAL | RTLD_LAZY);
	
	const NDIlib_v3* (*NDIlib_v3_load)(void) = NULL;
	if (ndiLibHandle)
		*((void**)&NDIlib_v3_load) = dlsym(ndiLibHandle, "NDIlib_v3_load");
	
	if (!NDIlib_v3_load)
	{
		error("Unable to load NDI runtime library. Please download and/or reinstall NDI runtime from '%s' and restart Max", NDILIB_REDIST_URL);
		return false;
	}
	
	*ndiLib = (NDIlib_v3*)NDIlib_v3_load();
	
	return true;
}

#endif


#endif // H_JIT_NDI_RUNTIME
