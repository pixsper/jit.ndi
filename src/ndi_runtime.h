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

#ifdef WIN_VERSION

inline void free_ndi_runtime(HMODULE* runtimeModule)
{
	if (*runtimeModule != NULL)
	{
		FreeLibrary(*runtimeModule);
		*runtimeModule = NULL;
	}
}

inline bool load_ndi_runtime(NDIlib_v4** ndiLib)
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
	
	FARPROC loadFunction = GetProcAddress(runtimeModule, "NDIlib_v4_load");
	
	if (loadFunction == NULL)
	{
		error("Unable to load NDI functions from DLL at path '%s'. Please download and reinstall NDI runtime from '%s' and restart Max", runtimeDllPath, NDILIB_REDIST_URL);
		return false;
	}
	
	*ndiLib = (NDIlib_v4*)loadFunction();
	
	return true;
}

#else

#include <dlfcn.h>

void free_ndi_runtime(void* handle)
{
    if (handle != NULL)
    {
        dlclose(handle);
        handle = NULL;
    }
}

bool load_ndi_runtime(NDIlib_v4** ndiLib)
{
	char ndiRuntimePath[MAX_PATH_CHARS];
	
	const char* ndiRuntimeDirPath = getenv(NDILIB_REDIST_FOLDER);
	if (ndiRuntimeDirPath)
    {
        post("Loading NDI Runtime from environent varable path - '%s'", ndiRuntimeDirPath);
		snprintf(ndiRuntimePath, MAX_PATH_CHARS, "%s%s", ndiRuntimeDirPath, NDILIB_LIBRARY_NAME);
    }
	else
    {
		strncpy(ndiRuntimePath, NDILIB_LIBRARY_NAME, MAX_PATH_CHARS);
    }
    
    dlerror();
	void* ndiLibHandle = dlopen(ndiRuntimePath, RTLD_LOCAL | RTLD_LAZY);
	if (!ndiLibHandle)
    {
        error("Can't find NDI runtime library - '%s'. Please download and/or reinstall NDI runtime from '%s' and restart Max", dlerror(), NDILIB_REDIST_URL);
        return false;
    }
    
    quittask_install((method)free_ndi_runtime, ndiLibHandle);
        
    const NDIlib_v4* (*NDIlib_v4_load)(void) = NULL;
    
    dlerror();
    *((void**)&NDIlib_v4_load) = dlsym(ndiLibHandle, "NDIlib_v4_load");
	if (!NDIlib_v4_load)
	{
		error("Unable to load NDI runtime library - '%s'. Please download and/or reinstall NDI runtime from '%s' and restart Max", dlerror(), NDILIB_REDIST_URL);
		return false;
	}
	
	*ndiLib = (NDIlib_v4*)NDIlib_v4_load();
	
	return true;
}

#endif


#endif // H_JIT_NDI_RUNTIME
