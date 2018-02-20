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

typedef struct _max_jit_ndi_send
{
	t_object object;
	void* obex;

	void* outletDump;

} t_max_jit_ndi_send;

t_symbol* _sym_texturename;
t_symbol* _sym_jit_ndi_send;

t_jit_err jit_ndi_send_init();

void* max_jit_ndi_send_new(t_symbol* s, long argc, t_atom* argv);
void max_jit_ndi_send_free(t_max_jit_ndi_send* x);

t_class* max_jit_ndi_send_class;


void ext_main(void* r)
{
	// init common symbols
	common_symbols_init();
	_sym_texturename = gensym("texturename");
	_sym_jit_ndi_send = gensym("jit_ndi_send");

	// initialize our Jitter class
	jit_ndi_send_init();

	// create our Max class
	t_class* maxclass = class_new("jit.ndi.send", (method)max_jit_ndi_send_new, (method)max_jit_ndi_send_free, sizeof(t_max_jit_ndi_send), nullptr, A_GIMME, 0);

	// specify a byte offset to keep additional information about our object
	max_jit_class_obex_setup(maxclass, calcoffset(t_max_jit_ndi_send, obex));

	// look up our Jitter class in the class registry
	t_class* jitclass = (t_class*)jit_class_findbyname(gensym("jit_ndi_send"));

	// wrap our Jitter class with the standard methods for Jitter objects
	max_jit_class_wrap_standard(maxclass, jitclass, 0);

	// use standard ob3d assist method
	class_addmethod(maxclass, (method)max_jit_ob3d_assist, "assist", A_CANT, 0);

	// add methods for 3d drawing
	max_jit_class_ob3d_wrap(maxclass);

	// register our class with max
	class_register(CLASS_BOX, maxclass);
	max_jit_ndi_send_class = maxclass;
}

void max_jit_ndi_send_free(t_max_jit_ndi_send *x)
{
	// lookup our internal Jitter object instance and free
	jit_object_free(max_jit_obex_jitob_get(x));

	// free resources associated with our obex entry
	max_jit_object_free(x);
}

void *max_jit_ndi_send_new(t_symbol *s, long argc, t_atom *argv)
{
	t_max_jit_ndi_send* x;
	void* jit_ob;
	t_symbol* destName = _jit_sym_nothing;

	if ((x = (t_max_jit_ndi_send *)max_jit_object_alloc(max_jit_ndi_send_class, _sym_jit_ndi_send)))
	{
		const long attrstart = max_jit_attr_args_offset(argc, argv);
		if (attrstart && argv)
			jit_atom_arg_getsym(&destName, 0, attrstart, argv);

		// instantiate Jitter object with dest_name arg
		if ((jit_ob = jit_object_new(_sym_jit_ndi_send, destName)))
		{
			// set internal jitter object instance
			max_jit_obex_jitob_set(x, jit_ob);

			// process attribute arguments
			max_jit_attr_args(x, argc, argv);

			// add a general purpose outlet (rightmost)
			x->outletDump = outlet_new(x, nullptr);
			max_jit_obex_dumpout_set(x, x->outletDump);
		}
		else
		{
			error("jit.ndi.send: could not allocate object");
			freeobject((t_object*)x);
			x = nullptr;
		}
	}
	return x;
}

