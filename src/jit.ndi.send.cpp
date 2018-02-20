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

typedef struct _jit_gl_notch
{
	t_object object;
	void* ob3d;
	
} t_jit_gl_notch;

t_jit_err jit_ndi_send_init();
t_jit_gl_notch *jit_gl_notch_new(t_symbol* destName);
void jit_gl_notch_free(t_jit_gl_notch *x);

t_jit_err jit_gl_notch_draw(t_jit_gl_notch *x);
t_jit_err jit_gl_notch_dest_closing(t_jit_gl_notch *x);
t_jit_err jit_gl_notch_dest_changed(t_jit_gl_notch *x);

void* _jit_gl_notch_class;

// --------------------------------------------------------------------------------

t_jit_err jit_ndi_send_init()
{
	// setup our OB3D flags to indicate our capabilities.
	const long ob3dFlags = JIT_OB3D_NO_ROTATION_SCALE
						 | JIT_OB3D_NO_POLY_VARS
						 | JIT_OB3D_NO_TEXTURE
						 | JIT_OB3D_NO_MATRIXOUTPUT
					     | JIT_OB3D_NO_DEPTH
						 | JIT_OB3D_NO_FOG
						 | JIT_OB3D_NO_LIGHTING_MATERIAL
						 | JIT_OB3D_NO_COLOR;

	_jit_gl_notch_class = jit_class_new("jit_gl_notch",
										 (method)jit_gl_notch_new, (method)jit_gl_notch_free,
										 sizeof(t_jit_gl_notch), A_DEFSYM, 0L);

	// set up object extension for 3d object, customized with flags
	void* ob3d = jit_ob3d_setup(_jit_gl_notch_class,
	                            calcoffset(t_jit_gl_notch, ob3d),
	                            ob3dFlags);


	jit_class_addmethod(_jit_gl_notch_class,
						(method)jit_gl_notch_draw, "ob3d_draw", A_CANT, 0L);

	jit_class_addmethod(_jit_gl_notch_class,
						(method)jit_gl_notch_dest_closing, "dest_closing", A_CANT, 0L);
	jit_class_addmethod(_jit_gl_notch_class,
						(method)jit_gl_notch_dest_changed, "dest_changed", A_CANT, 0L);


	jit_class_addmethod(_jit_gl_notch_class,
						(method)jit_object_register, "register", A_CANT, 0L);

	jit_class_register(_jit_gl_notch_class);

	return JIT_ERR_NONE;
}


t_jit_gl_notch *jit_gl_notch_new(t_symbol* destName)
{
	t_jit_gl_notch *x;
	
	// make jit object
	if ((x = (t_jit_gl_notch *)jit_object_alloc(_jit_gl_notch_class)))
	{
		jit_ob3d_new(x, destName);
	}
	else
	{
		x = nullptr;
	}

	return x;
}

void jit_gl_notch_free(t_jit_gl_notch *x)
{
	if (!x)
		return;

	jit_ob3d_free(x);
}

t_jit_err jit_gl_notch_draw(t_jit_gl_notch *x)
{
	return JIT_ERR_NONE;
}

t_jit_err jit_gl_notch_dest_closing(t_jit_gl_notch *x)
{
	return JIT_ERR_NONE;
}

t_jit_err jit_gl_notch_dest_changed(t_jit_gl_notch *x)
{
	return JIT_ERR_NONE;
}