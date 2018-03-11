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
#include <ext_atomic.h>
#include <z_dsp.h>
#include <max.jit.mop.h>

#include <Processing.NDI.Lib.h>

#include "ndi_runtime.h"

HMODULE runtimeModule;
extern NDIlib_v3* ndiLib;

typedef struct _max_jit_ndi_receive
{
	t_pxobject object;
	void* obex;
	void* jitObject;
	t_symbol* notifyName;

	t_symbol* hostName;
	t_symbol* sourceName;
	t_atom_long numAudioChannels;

} t_max_jit_ndi_receive;

t_symbol* _sym_jit_ndi_receive;
t_symbol* _sym_ptz_autofocus;
t_symbol* _sym_ptz_focus;
t_symbol* _sym_ptz_whitebalancemode;
t_symbol* _sym_ptz_whitebalance_red;
t_symbol* _sym_ptz_whitebalance_blue;
t_symbol* _sym_ptz_autoexposure;
t_symbol* _sym_ptz_exposure;

t_jit_err jit_ndi_receive_init();

void* max_jit_ndi_receive_new(t_symbol* s, long argc, t_atom* argv);
void max_jit_ndi_receive_free(t_max_jit_ndi_receive* x);

void max_jit_ndi_receive_notify(t_max_jit_ndi_receive* x, t_symbol* s, t_symbol* msg, void* ob, void* data);
void max_jit_ndi_outputmatrix(t_max_jit_ndi_receive *x);

void max_jit_ndi_receive_getsourcelist(t_max_jit_ndi_receive* x);

void max_jit_ndi_receive_dsp64(t_max_jit_ndi_receive* x, t_object* dsp64, short* count, double samplerate,
                               long maxvectorsize, long flags);
void max_jit_ndi_receive_perform64(t_max_jit_ndi_receive* x, t_object* dsp64, double** ins, long numins, double** outs,
                                   long numouts, long sampleframes, long flags, void* userparam);

t_class* max_jit_ndi_receive_class;


void ext_main(void* r)
{
	if (!load_ndi_runtime(&runtimeModule, &ndiLib))
		return;

	common_symbols_init();
	_sym_jit_ndi_receive = gensym("jit_ndi_receive");
	_sym_ptz_autofocus = gensym("ptz_autofocus");
	_sym_ptz_focus = gensym("ptz_focus");
	_sym_ptz_whitebalancemode = gensym("ptz_whitebalancemode");
	_sym_ptz_whitebalance_red = gensym("ptz_whitebalance_red");
	_sym_ptz_whitebalance_blue = gensym("ptz_whitebalance_blue");
	_sym_ptz_autoexposure = gensym("ptz_autoexposure");
	_sym_ptz_exposure = gensym("ptz_exposure");

	jit_ndi_receive_init();

	t_class* maxclass = class_new("jit.ndi.receive~", (method)max_jit_ndi_receive_new, (method)max_jit_ndi_receive_free,
	                              sizeof(t_max_jit_ndi_receive), NULL, A_GIMME, 0);


	max_jit_class_obex_setup(maxclass, calcoffset(t_max_jit_ndi_receive, obex));

	t_class* jitclass = (t_class*)jit_class_findbyname(_sym_jit_ndi_receive);

	max_jit_class_mop_wrap(maxclass, jitclass, MAX_JIT_MOP_FLAGS_OWN_OUTPUTMATRIX | MAX_JIT_MOP_FLAGS_OWN_JIT_MATRIX | MAX_JIT_MOP_FLAGS_OWN_ADAPT 
		| MAX_JIT_MOP_FLAGS_OWN_OUTPUTMODE | MAX_JIT_MOP_FLAGS_OWN_DIM | MAX_JIT_MOP_FLAGS_OWN_PLANECOUNT | MAX_JIT_MOP_FLAGS_OWN_TYPE);
	max_jit_class_wrap_standard(maxclass, jitclass, 0);

	class_addmethod(maxclass, (method)max_jit_mop_assist, "assist", A_CANT, 0);
	class_addmethod(maxclass, (method)max_jit_ndi_receive_notify, "notify", A_CANT, 0);
	class_addmethod(maxclass, (method)max_jit_ndi_receive_dsp64, "dsp64", A_CANT, 0);
	class_addmethod(maxclass, (method)max_jit_ndi_receive_getsourcelist, "getsourcelist", 0);

	max_jit_class_addmethod_usurp_low(maxclass, (method)max_jit_ndi_outputmatrix, "outputmatrix");

	class_dspinit(maxclass);
	class_register(CLASS_BOX, maxclass);
	max_jit_ndi_receive_class = maxclass;
}

void* max_jit_ndi_receive_new(t_symbol* s, long argc, t_atom* argv)
{
	t_max_jit_ndi_receive* x;

	if (!((x = (t_max_jit_ndi_receive *)max_jit_object_alloc(max_jit_ndi_receive_class, _sym_jit_ndi_receive))))
	{
		error("jit.ndi.send: could not allocate max object");
		return NULL;
	}

	x->sourceName = jit_symbol_unique();
	x->numAudioChannels = 0;

	const long attrstart = max_jit_attr_args_offset(argc, argv);
	if (attrstart && argv)
	{
		t_symbol* hostName;
		if (!jit_atom_arg_getsym(&hostName, 0, attrstart, argv))
			x->hostName = hostName;

		t_symbol* sourceName;
		if (!jit_atom_arg_getsym(&sourceName, 1, attrstart, argv))
			x->sourceName = sourceName;

		t_atom_long numAudioChannels;
		if (!jit_atom_arg_getlong(&numAudioChannels, 2, attrstart, argv))
		{
			x->numAudioChannels = MAX(numAudioChannels, 0);

			if (x->numAudioChannels > SYS_MAXSIGS)
			{
				object_error((t_object*)x, "Can't have greater than %ld signal inlets", SYS_MAXSIGS);
				freeobject((t_object*)x);
				return NULL;
			}
		}
	}

	dsp_setup((t_pxobject*)x, x->numAudioChannels);

	// instantiate Jitter object with dest_name arg
	if (!((x->jitObject = jit_object_new(_sym_jit_ndi_receive, x->hostName,  x->sourceName, x->numAudioChannels))))
	{
		object_error((t_object*)x, "Could not allocate jitter object");
		freeobject((t_object*)x);
		return NULL;
	}

	max_jit_mop_setup_simple(x, x->jitObject, 0, NULL);
	max_jit_attr_args(x, argc, argv);

	x->notifyName = jit_symbol_unique();
	jit_object_method(x->jitObject, _jit_sym_register, x->notifyName);
	jit_object_attach(x->notifyName, x);

	return x;
}

void max_jit_ndi_receive_free(t_max_jit_ndi_receive* x)
{
	dsp_free((t_pxobject *)x);
	max_jit_mop_free(x);
	jit_object_free(max_jit_obex_jitob_get(x));
	max_jit_object_free(x);
}

void max_jit_ndi_receive_notify(t_max_jit_ndi_receive* x, t_symbol* s, t_symbol* msg, void* ob, void* data)
{
	if (msg == _sym_attr_modified)
	{
		t_symbol* attrname = (t_symbol*)jit_object_method((t_object *)data, _sym_getname); 

		if (attrname == _sym_ptz_autofocus)
		{
			object_attr_setdisabled((t_object*)x, _sym_ptz_focus, jit_attr_getlong(x->jitObject, _sym_ptz_autofocus));
		}
		else if (attrname == _sym_ptz_whitebalancemode)
		{
			object_attr_setdisabled((t_object*)x, _sym_ptz_whitebalance_red, jit_attr_getlong(x->jitObject, _sym_ptz_whitebalancemode) != 3);
			object_attr_setdisabled((t_object*)x, _sym_ptz_whitebalance_blue, jit_attr_getlong(x->jitObject, _sym_ptz_whitebalancemode) != 3);
		}
		else if (attrname == _sym_ptz_autoexposure)
		{
			object_attr_setdisabled((t_object*)x, _sym_ptz_exposure, jit_attr_getlong(x->jitObject, _sym_ptz_autoexposure));
		}
	} 
	else
	{
		max_jit_mop_notify(x, s, msg);
	}
}

void max_jit_ndi_outputmatrix(t_max_jit_ndi_receive *x)
{
	void* mop = max_jit_obex_adornment_get(x, _jit_sym_jit_mop);
	jit_object_method(x->jitObject, _jit_sym_matrix_calc, jit_object_method(mop, _jit_sym_getinputlist), jit_object_method(mop, _jit_sym_getoutputlist));
	max_jit_mop_outputmatrix(x);
}


void max_jit_ndi_receive_getsourcelist(t_max_jit_ndi_receive* x)
{
	/*max_jit_ndi_receive_refreshsources(x);

	long kc = 0;
	t_symbol** keys = NULL;

	hashtab_getkeys(x->sources, &kc, &keys);

	if (kc == 0)
	{
	}
	else
	{
		long ac = 0;
		t_atom* av = NULL;

		char alloc;
		atom_alloc_array(kc, &ac, &av, &alloc);
		if (!alloc)
			return;

		for (long i = 0; i < kc; ++i)
			atom_setsym(av + i, keys[i]);

		max_jit_obex_dumpout(x, gensym("sources"), ac, av);
	}*/
}

void max_jit_ndi_receive_dsp64(t_max_jit_ndi_receive* x, t_object* dsp64, short* count, double samplerate,
                               long maxvectorsize, long flags)
{
	object_method(dsp64, gensym("dsp_add64"), x, max_jit_ndi_receive_perform64, 0, NULL);
}

void max_jit_ndi_receive_perform64(t_max_jit_ndi_receive* x, t_object* dsp64, double** ins, long numins, double** outs,
                                   long numouts, long sampleframes, long flags, void* userparam)
{
}
