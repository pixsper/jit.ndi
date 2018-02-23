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

HMODULE runtimeModule;
extern NDIlib_v3* ndiLib;

typedef struct _max_jit_ndi_send
{
	t_object object;
	void* obex;

} t_max_jit_ndi_send;

t_symbol* _sym_jit_ndi_send;

t_jit_err jit_ndi_send_init();

void* max_jit_ndi_send_new(t_symbol* s, long argc, t_atom* argv);
void max_jit_ndi_send_free(t_max_jit_ndi_send* x);

t_class* max_jit_ndi_send_class;


void ext_main(void* r)
{
	if (!load_ndi_runtime(&runtimeModule, &ndiLib))
		return;

	common_symbols_init();
	_sym_jit_ndi_send = gensym("jit_ndi_send");

	jit_ndi_send_init();

	t_class* maxclass = class_new("jit.ndi.send", (method)max_jit_ndi_send_new, (method)max_jit_ndi_send_free, sizeof(t_max_jit_ndi_send), NULL, A_GIMME, 0);


	max_jit_class_obex_setup(maxclass, calcoffset(t_max_jit_ndi_send, obex));

	t_class* jitclass = (t_class*)jit_class_findbyname(_sym_jit_ndi_send);

	max_jit_class_mop_wrap(maxclass, jitclass,  MAX_JIT_MOP_FLAGS_OWN_ADAPT | MAX_JIT_MOP_FLAGS_OWN_OUTPUTMODE);
	max_jit_class_wrap_standard(maxclass, jitclass, 0);

	class_addmethod(maxclass, (method)max_jit_mop_assist, "assist", A_CANT, 0);

	// register our class with max
	class_register(CLASS_BOX, maxclass);
	max_jit_ndi_send_class = maxclass;
}

void* max_jit_ndi_send_new(t_symbol *s, long argc, t_atom *argv)
{
	t_max_jit_ndi_send* x;
	void* jit_ob;
	t_symbol* sourceName = jit_symbol_unique();

	if ((x = (t_max_jit_ndi_send *)max_jit_object_alloc(max_jit_ndi_send_class, _sym_jit_ndi_send)))
	{
		const long attrstart = max_jit_attr_args_offset(argc, argv);
		if (attrstart && argv)
			jit_atom_arg_getsym(&sourceName, 0, attrstart, argv);

		// instantiate Jitter object with dest_name arg
		if ((jit_ob = jit_object_new(_sym_jit_ndi_send, sourceName)))
		{
			max_jit_mop_setup_simple(x, jit_ob, 0, NULL);
			max_jit_attr_args(x, argc, argv);
		}
		else
		{
			error("jit.ndi.send: could not allocate jitter object");
			freeobject((t_object*)x);
			x = NULL;
		}
	}
	else
	{
		error("jit.ndi.send: could not allocate max object");
	}

	return x;
}

void max_jit_ndi_send_free(t_max_jit_ndi_send *x)
{
	max_jit_mop_free(x);
	jit_object_free(max_jit_obex_jitob_get(x));
	max_jit_object_free(x);
}