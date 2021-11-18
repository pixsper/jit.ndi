//
// This file is part of jit.ndi https://github.com/pixsperdavid/jit.ndi
// Copyright (c) 2021 Pixsper Ltd.
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
#include "version.h"



void* ndiLibHandle;
NDIlib_v5* ndiLib;

typedef struct _max_jit_ndi_send
{
	t_pxobject object;
	void* obex;
	void* jitObject;
	t_symbol* notifyName;

	t_symbol* sourceName;
	t_atom_long numAudioChannels;

} t_max_jit_ndi_send;

t_symbol* _sym_jit_ndi_send;
t_symbol* _sym_audio_start;
t_symbol* _sym_add_samples;
t_symbol* _sym_tally_onprogram;
t_symbol* _sym_tally_onpreview;
t_symbol* _sym_runtimeurl;
t_symbol* _sym_getnuminputchannels;
t_symbol* _sym_inputchanged;

t_symbol* _sym_ptz_zoom_sensitivity;
t_symbol* _sym_ptz_pantilt_sensitivity;
t_symbol* _sym_ptz_focus_sensitivity;
t_symbol* _sym_ptz_zoom;
t_symbol* _sym_ptz_pantilt;
t_symbol* _sym_ptz_flip;
t_symbol* _sym_ptz_autofocus;
t_symbol* _sym_ptz_focus;
t_symbol* _sym_ptz_whitebalance_mode;
t_symbol* _sym_ptz_whitebalance_red;
t_symbol* _sym_ptz_whitebalance_blue;
t_symbol* _sym_ptz_autoexposure;
t_symbol* _sym_ptz_exposure;
t_symbol* _sym_preset_store;
t_symbol* _sym_preset_recall;
t_symbol* _sym_get_preset_store;
t_symbol* _sym_get_preset_recall;

t_jit_err jit_ndi_send_init();

void* max_jit_ndi_send_new(t_symbol* s, long argc, t_atom* argv);
void max_jit_ndi_send_free(t_max_jit_ndi_send* x);
void max_jit_ndi_send_assist(t_max_jit_ndi_send* x, void* b, long io, long index, char* s);

void max_jit_ndi_send_notify(t_max_jit_ndi_send* x, t_symbol* s, t_symbol* msg, void* ob, void* data);

void max_jit_ndi_send_dsp64(t_max_jit_ndi_send* x, t_object* dsp64, short* count, double samplerate, long maxvectorsize, long flags);
long max_jit_ndi_send_multichanneloutputs(t_max_jit_ndi_send* x, long outletIndex);
long max_jit_ndi_send_inputchanged(t_max_jit_ndi_send *x, long index, long count);

void max_jit_ndi_send_perform64(t_max_jit_ndi_send* x, t_object* dsp64, double** ins, long numins, double** outs, long numouts, long sampleframes, long flags, void* userparam);

void max_jit_ndi_send_printversion(t_max_jit_ndi_send* x);
void max_jit_ndi_send_getruntimeurl(t_max_jit_ndi_send* x);

t_class* max_jit_ndi_send_class;


void ext_main(void* r)
{
	if (!load_ndi_runtime(&ndiLib, &ndiLibHandle))
		return;

	common_symbols_init();
	_sym_jit_ndi_send = gensym("jit_ndi_send");
	_sym_audio_start = gensym("audio_start");
	_sym_add_samples = gensym("add_samples");
	_sym_tally_onprogram = gensym("tally_onprogram");
	_sym_tally_onpreview = gensym("tally_onpreview");
	_sym_runtimeurl = gensym("runtimeurl");
	_sym_getnuminputchannels = gensym("getnuminputchannels");

	_sym_ptz_zoom_sensitivity = gensym("ptz_zoom_sensitivity");
	_sym_ptz_pantilt_sensitivity = gensym("ptz_pantilt_sensitivity");
	_sym_ptz_focus_sensitivity = gensym("ptz_focus_sensitivity");
	_sym_ptz_zoom = gensym("ptz_zoom");
	_sym_ptz_pantilt = gensym("ptz_pantilt");
	_sym_ptz_flip = gensym("ptz_flip");
	_sym_ptz_autofocus = gensym("ptz_autofocus");
	_sym_ptz_focus = gensym("ptz_focus");
	_sym_ptz_whitebalance_mode = gensym("ptz_whitebalance_mode");
	_sym_ptz_whitebalance_red = gensym("ptz_whitebalance_red");
	_sym_ptz_whitebalance_blue = gensym("ptz_whitebalance_blue");
	_sym_ptz_autoexposure = gensym("ptz_autoexposure");
	_sym_ptz_exposure = gensym("ptz_exposure");
	_sym_preset_store = gensym("preset_store");
	_sym_preset_recall = gensym("preset_recall");
	_sym_get_preset_store = gensym("get_preset_store");
	_sym_get_preset_recall = gensym("get_preset_recall");

	jit_ndi_send_init();

	t_class* maxclass = class_new("jit.ndi.send~", (method)max_jit_ndi_send_new, (method)max_jit_ndi_send_free, sizeof(t_max_jit_ndi_send), NULL, A_GIMME, 0);
	

	max_jit_class_obex_setup(maxclass, calcoffset(t_max_jit_ndi_send, obex));

	t_class* jitclass = (t_class*)jit_class_findbyname(_sym_jit_ndi_send);

	max_jit_class_mop_wrap(maxclass, jitclass,  MAX_JIT_MOP_FLAGS_OWN_ADAPT | MAX_JIT_MOP_FLAGS_OWN_OUTPUTMODE | MAX_JIT_MOP_FLAGS_OWN_NOTIFY);
	max_jit_class_wrap_standard(maxclass, jitclass, 0);

	class_addmethod(maxclass, (method)max_jit_ndi_send_assist, "assist", A_CANT, 0);
	class_addmethod(maxclass, (method)max_jit_ndi_send_notify, "notify", A_CANT, 0);
	class_addmethod(maxclass, (method)max_jit_ndi_send_dsp64, "dsp64", A_CANT, 0);
	class_addmethod(maxclass, (method)max_jit_ndi_send_multichanneloutputs, "multichanneloutputs", A_CANT, 0);
	
	class_addmethod(maxclass, (method)max_jit_ndi_send_printversion, "version", 0);
	class_addmethod(maxclass, (method)max_jit_ndi_send_getruntimeurl, "getruntimeurl", 0);


	class_dspinit(maxclass);
	class_register(CLASS_BOX, maxclass);
	max_jit_ndi_send_class = maxclass;
}

void* max_jit_ndi_send_new(t_symbol *s, long argc, t_atom *argv)
{
	t_max_jit_ndi_send* x;

	if (!((x = (t_max_jit_ndi_send *)max_jit_object_alloc(max_jit_ndi_send_class, _sym_jit_ndi_send))))
	{
		error("jit.ndi.send~: could not allocate max object");
		return NULL;
	}

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
	}

	dsp_setup((t_pxobject*)x, 1);
	x->object.z_misc |= Z_NO_INPLACE | Z_MC_INLETS;

	// instantiate Jitter object with dest_name arg
	if (!((x->jitObject = jit_object_new(_sym_jit_ndi_send, x->sourceName))))
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

void max_jit_ndi_send_free(t_max_jit_ndi_send *x)
{
	dsp_free((t_pxobject *)x);
	max_jit_mop_free(x);
	jit_object_free(max_jit_obex_jitob_get(x));
	max_jit_object_free(x);
}

void max_jit_ndi_send_assist(t_max_jit_ndi_send* x, void* b, long io, long index, char* s)
{
	switch (io)
	{
        case 1:
            switch (index) {
                case 0:
                    strncpy_zero(s, "(matrix, multi-channel signal) in", 512);
                    break;
            }
            break;
        case 2:
            strncpy_zero(s, "dumpout", 512);
            break;
    }
}

void max_jit_ndi_send_notify(t_max_jit_ndi_send* x, t_symbol* s, t_symbol* msg, void* ob, void* data)
{
	if (msg == _sym_attr_modified)
	{
		 t_symbol* attrname = (t_symbol*)jit_object_method((t_object *)data, _sym_getname); 

		 if (attrname == _sym_tally_onprogram || attrname == _sym_tally_onpreview
			 || attrname == _sym_ptz_zoom || attrname == _sym_ptz_pantilt || attrname == _sym_ptz_flip 
			 || attrname == _sym_ptz_autofocus || attrname == _sym_ptz_focus
			 || attrname == _sym_ptz_whitebalance_mode || attrname == _sym_ptz_whitebalance_red || attrname == _sym_ptz_whitebalance_blue
			 || attrname == _sym_ptz_exposure || attrname == _sym_ptz_autoexposure)
		 {
			long ac = 0;
			t_atom* av = NULL;
			object_method((t_object*)data, _sym_get, x->jitObject, &ac, &av);
			max_jit_obex_dumpout(x, attrname, ac, av);
		 }
	}
	else if (msg == _sym_preset_store)
	{
		t_atom rv;
		object_method_typed((t_object*)data, _sym_get_preset_store, 0, NULL, &rv);
		max_jit_obex_dumpout(x, _sym_preset_store, 1, &rv);
	}
	else if (msg == _sym_preset_recall)
	{
		t_atom rv;
		object_method_typed((t_object*)data, _sym_get_preset_recall, 0, NULL, &rv);

		t_atomarray* vals = atom_getobj(&rv);
		long ac;
		t_atom* av;
		atomarray_getatoms(vals, &ac, &av);
		max_jit_obex_dumpout(x, _sym_preset_recall, ac, av);
	}
	else
	{
		max_jit_mop_notify(x, s, msg);
	}
}

void max_jit_ndi_send_dsp64(t_max_jit_ndi_send* x, t_object* dsp64, short* count, double samplerate, long maxvectorsize, long flags)
{
	const long numChannels = (long)object_method(dsp64, _sym_getnuminputchannels, x, 0);
	object_method_direct(void, (t_jit_object*, double, long), x->jitObject, _sym_audio_start, samplerate, numChannels);
	
	jit_object_method(dsp64, gensym("dsp_add64"), x, max_jit_ndi_send_perform64, 0, NULL);
}

long max_jit_ndi_send_multichanneloutputs(t_max_jit_ndi_send* x, long outletIndex)
{
    return 0;
}

void max_jit_ndi_send_perform64(t_max_jit_ndi_send* x, t_object* dsp64, double** ins, long numins, double** outs, long numouts, long sampleframes, long flags, void* userparam)
{
	jit_object_method(x->jitObject, _sym_add_samples, ins, sampleframes, 0);
}

void max_jit_ndi_send_printversion(t_max_jit_ndi_send* x)
{
	object_post((t_object*)x, "jit.ndi.send~ V%ld.%ld.%ld - %s",
		JIT_NDI_VERSION_MAJOR, JIT_NDI_VERSION_MINOR, JIT_NDI_VERSION_BUGFIX, JIT_NDI_COPYRIGHT);
}

void max_jit_ndi_send_getruntimeurl(t_max_jit_ndi_send* x)
{
	t_atom argv;

// TODO: Update this when NewTek fixes their link to the Mac runtime
#ifdef MAC_VERSION
	atom_setsym(&argv, gensym("https://ndi.tv/tools/"));
#else
	atom_setsym(&argv, gensym(NDILIB_REDIST_URL));
#endif
	
	max_jit_obex_dumpout(x, _sym_runtimeurl, 1, &argv);
}