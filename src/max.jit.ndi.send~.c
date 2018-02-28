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

typedef struct _max_jit_ndi_send
{
	t_pxobject object;
	void* obex;
	void* jitObject;

	t_symbol* sourceName;
	t_atom_long numAudioChannels;

} t_max_jit_ndi_send;

t_symbol* _sym_jit_ndi_send;
t_symbol* _sym_audio_start;
t_symbol* _sym_audio_stop;
t_symbol* _sym_add_samples;

t_jit_err jit_ndi_send_init();

void* max_jit_ndi_send_new(t_symbol* s, long argc, t_atom* argv);
void max_jit_ndi_send_free(t_max_jit_ndi_send* x);

void max_jit_ndi_send_dsp64(t_max_jit_ndi_send* x, t_object* dsp64, short* count, double samplerate, long maxvectorsize, long flags);
void max_jit_ndi_send_perform64(t_max_jit_ndi_send* x, t_object* dsp64, double** ins, long numins, double** outs, long numouts, long sampleframes, long flags, void* userparam);

t_class* max_jit_ndi_send_class;


void ext_main(void* r)
{
	if (!load_ndi_runtime(&runtimeModule, &ndiLib))
		return;

	common_symbols_init();
	_sym_jit_ndi_send = gensym("jit_ndi_send");
	_sym_audio_start = gensym("audio_start");
	_sym_audio_stop = gensym("audio_stop");
	_sym_add_samples = gensym("add_samples");

	jit_ndi_send_init();

	t_class* maxclass = class_new("jit.ndi.send~", (method)max_jit_ndi_send_new, (method)max_jit_ndi_send_free, sizeof(t_max_jit_ndi_send), NULL, A_GIMME, 0);
	

	max_jit_class_obex_setup(maxclass, calcoffset(t_max_jit_ndi_send, obex));

	t_class* jitclass = (t_class*)jit_class_findbyname(_sym_jit_ndi_send);

	max_jit_class_mop_wrap(maxclass, jitclass,  MAX_JIT_MOP_FLAGS_OWN_ADAPT | MAX_JIT_MOP_FLAGS_OWN_OUTPUTMODE);
	max_jit_class_wrap_standard(maxclass, jitclass, 0);

	class_addmethod(maxclass, (method)max_jit_mop_assist, "assist", A_CANT, 0);
	class_addmethod(maxclass, (method)max_jit_ndi_send_dsp64, "dsp64", A_CANT, 0);

	class_dspinit(maxclass);
	class_register(CLASS_BOX, maxclass);
	max_jit_ndi_send_class = maxclass;
}

void* max_jit_ndi_send_new(t_symbol *s, long argc, t_atom *argv)
{
	t_max_jit_ndi_send* x;

	if ((x = (t_max_jit_ndi_send *)max_jit_object_alloc(max_jit_ndi_send_class, _sym_jit_ndi_send)))
	{
		x->sourceName = jit_symbol_unique();
		x->numAudioChannels = 0;

		const long attrstart = max_jit_attr_args_offset(argc, argv);
		if (attrstart && argv)
		{
			t_symbol* as;
			if (!jit_atom_arg_getsym(&as, 0, attrstart, argv))
			{
				x->sourceName = as;
			}

			t_atom_long al;
			if (!jit_atom_arg_getlong(&al, 1, attrstart, argv))
			{
				x->numAudioChannels = MAX(al, 0);

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
		if ((x->jitObject = jit_object_new(_sym_jit_ndi_send, x->sourceName, x->numAudioChannels)))
		{
			max_jit_mop_setup_simple(x, x->jitObject, 0, NULL);
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
	dsp_free((t_pxobject *)x);
	max_jit_mop_free(x);
	jit_object_free(max_jit_obex_jitob_get(x));
	max_jit_object_free(x);
}

void max_jit_ndi_send_dsp64(t_max_jit_ndi_send* x, t_object* dsp64, short* count, double samplerate, long maxvectorsize, long flags)
{
	object_method_direct(void, (t_jit_object*, double), x->jitObject, _sym_audio_start, samplerate);
	object_method(dsp64, gensym("dsp_add64"), x, max_jit_ndi_send_perform64, 0, NULL);
}

void max_jit_ndi_send_perform64(t_max_jit_ndi_send* x, t_object* dsp64, double** ins, long numins, double** outs, long numouts, long sampleframes, long flags, void* userparam)
{
	object_method(x->jitObject, _sym_add_samples, ins, sampleframes, 0);
}