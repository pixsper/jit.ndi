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
#include <ext_dictobj.h>

#include <Processing.NDI.Lib.h>

#include "ndi_runtime.h"
#include "build/version.h"

#ifdef MAC_VERSION
#include <sys/param.h>
#endif

void* ndiLibHandle;
NDIlib_v5* ndiLib;

typedef enum _WhiteBalanceMode
{
	WHITEBALANCEMODE_AUTO,
	WHITEBALANCEMODE_INDOOR,
	WHITEBALANCEMODE_OUTDOOR,
	WHITEBALANCEMODE_ONE_PUSH,
	WHITEBALANCEMODE_MANUAL

} WhiteBalanceMode;

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
t_symbol* _sym_sourcelist;
t_symbol* _sym_getsourcelist;
t_symbol* _sym_getsource;
t_symbol* _sym_setsource;
t_symbol* _sym_sourcelistmenu;
t_symbol* _sym_audio_start;
t_symbol* _sym_get_samples;
t_symbol* _sym_tally_onprogram;
t_symbol* _sym_tally_onpreview;
t_symbol* _sym_runtimeurl;
t_symbol* _sym_ptz_capable;
t_symbol* _sym_ptz_zoom;
t_symbol* _sym_ptz_zoom_speed;
t_symbol* _sym_ptz_pantilt;
t_symbol* _sym_ptz_pantilt_speed;
t_symbol* _sym_ptz_flip;
t_symbol* _sym_ptz_autofocus;
t_symbol* _sym_ptz_focus;
t_symbol* _sym_ptz_focus_speed;
t_symbol* _sym_ptz_whitebalance_mode;
t_symbol* _sym_ptz_whitebalance_red;
t_symbol* _sym_ptz_whitebalance_blue;
t_symbol* _sym_ptz_autoexposure;
t_symbol* _sym_ptz_exposure;


t_jit_err jit_ndi_receive_init();

void* max_jit_ndi_receive_new(t_symbol* s, long argc, t_atom* argv);
void max_jit_ndi_receive_free(t_max_jit_ndi_receive* x);
void max_jit_ndi_receive_assist(t_max_jit_ndi_receive* x, void* b, long io, long index, char* s);

void max_jit_ndi_receive_notify(t_max_jit_ndi_receive* x, t_symbol* s, t_symbol* msg, void* ob, void* data);
void max_jit_ndi_outputmatrix(t_max_jit_ndi_receive *x);

void max_jit_ndi_receive_ptz_update_enabled_attr(t_max_jit_ndi_receive* x);

void max_jit_ndi_receive_getsourcelist(t_max_jit_ndi_receive* x);
void max_jit_ndi_receive_getsourcelistmenu(t_max_jit_ndi_receive* x);
void max_jit_ndi_receive_getsource(t_max_jit_ndi_receive* x);
void max_jit_ndi_receive_setsource(t_max_jit_ndi_receive* x, t_symbol* s, long argc, t_atom* argv);

void max_jit_ndi_receive_dsp64(t_max_jit_ndi_receive* x, t_object* dsp64, short* count, double samplerate,
							   long maxvectorsize, long flags);
long max_jit_ndi_receive_multichanneloutputs(t_max_jit_ndi_receive* x, long outletIndex);
void max_jit_ndi_receive_perform64(t_max_jit_ndi_receive* x, t_object* dsp64, double** ins, long numins, double** outs,
								   long numouts, long sampleframes, long flags, void* userparam);

void max_jit_ndi_receive_printversion(t_max_jit_ndi_receive* x);
void max_jit_ndi_receive_getruntimeurl(t_max_jit_ndi_receive* x);

t_symbol* max_jit_ndi_gethostname(t_max_jit_ndi_receive* x);

t_class* max_jit_ndi_receive_class;


void ext_main(void* r)
{
	if (!load_ndi_runtime(&ndiLib, &ndiLibHandle))
		return;

	common_symbols_init();
	_sym_jit_ndi_receive = gensym("jit_ndi_receive");
	_sym_sourcelist = gensym("sourcelist");
	_sym_getsourcelist = gensym("getsourcelist");
	_sym_getsource = gensym("getsource");
	_sym_setsource = gensym("setsource");
	_sym_sourcelistmenu = gensym("sourcelistmenu");
	_sym_audio_start = gensym("audio_start");
	_sym_get_samples = gensym("get_samples");
	_sym_tally_onprogram = gensym("tally_onprogram");
	_sym_tally_onpreview = gensym("tally_onpreview");
	_sym_runtimeurl = gensym("runtimeurl");
	_sym_ptz_capable = gensym("ptz_capable");
	_sym_ptz_zoom = gensym("ptz_zoom");
	_sym_ptz_zoom_speed = gensym("ptz_zoom_speed");
	_sym_ptz_pantilt = gensym("ptz_pantilt");
	_sym_ptz_pantilt_speed = gensym("ptz_pantilt_speed");
	_sym_ptz_flip = gensym("ptz_flip");
	_sym_ptz_autofocus = gensym("ptz_autofocus");
	_sym_ptz_focus = gensym("ptz_focus");
	_sym_ptz_focus_speed = gensym("ptz_focus_speed");
	_sym_ptz_whitebalance_mode = gensym("ptz_whitebalance_mode");
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

	class_addmethod(maxclass, (method)max_jit_ndi_receive_assist, "assist", A_CANT, 0);
	class_addmethod(maxclass, (method)max_jit_ndi_receive_notify, "notify", A_CANT, 0);
	class_addmethod(maxclass, (method)max_jit_ndi_receive_dsp64, "dsp64", A_CANT, 0);
	class_addmethod(maxclass, (method)max_jit_ndi_receive_multichanneloutputs, "multichanneloutputs", A_CANT, 0);
	class_addmethod(maxclass, (method)max_jit_ndi_receive_getsourcelist, "getsourcelist", 0);
	class_addmethod(maxclass, (method)max_jit_ndi_receive_getsourcelistmenu, "getsourcelistmenu", 0);
	class_addmethod(maxclass, (method)max_jit_ndi_receive_getsource, "getsource", 0);
	class_addmethod(maxclass, (method)max_jit_ndi_receive_setsource, "anything", A_GIMME, 0);

	class_addmethod(maxclass, (method)max_jit_ndi_receive_printversion, "version", 0);
	class_addmethod(maxclass, (method)max_jit_ndi_receive_getruntimeurl, "getruntimeurl", 0);

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
		error("jit.ndi.receive~: could not allocate max object");
		return NULL;
	}

	x->sourceName = jit_symbol_unique();
	x->numAudioChannels = 0;

	const long attrstart = max_jit_attr_args_offset(argc, argv);
	if (argc == 1)
	{
		x->hostName = max_jit_ndi_gethostname(x);
		
		if (atom_gettype(argv) == A_LONG)
		{
			t_atom_long numAudioChannels;
			if (!jit_atom_arg_getlong(&numAudioChannels, 0, attrstart, argv))
				x->numAudioChannels = numAudioChannels;
		}
		else
		{
			t_symbol* sourceName;
			if (!jit_atom_arg_getsym(&sourceName, 0, attrstart, argv))
				x->sourceName = sourceName;
		}	
	}
	else if (argc == 2)
	{
		if (atom_gettype(argv + 1) == A_LONG)
		{
			x->hostName = max_jit_ndi_gethostname(x);
			
			t_symbol* sourceName;
			if (!jit_atom_arg_getsym(&sourceName, 0, attrstart, argv))
				x->sourceName = sourceName;

			t_atom_long numAudioChannels;
			if (!jit_atom_arg_getlong(&numAudioChannels, 1, attrstart, argv))
				x->numAudioChannels = numAudioChannels;
		}
		else
		{
			t_symbol* hostName;
			if (!jit_atom_arg_getsym(&hostName, 0, attrstart, argv))
				x->hostName = hostName;

			t_symbol* sourceName;
			if (!jit_atom_arg_getsym(&sourceName, 1, attrstart, argv))
				x->sourceName = sourceName;
		}
	}
	else if (argc == 3)
	{
		t_symbol* hostName;
		if (!jit_atom_arg_getsym(&hostName, 0, attrstart, argv))
			x->hostName = hostName;

		t_symbol* sourceName;
		if (!jit_atom_arg_getsym(&sourceName, 1, attrstart, argv))
			x->sourceName = sourceName;

		t_atom_long numAudioChannels;
		if (!jit_atom_arg_getlong(&numAudioChannels, 2, attrstart, argv))
			x->numAudioChannels = numAudioChannels;
	}

	dsp_setup((t_pxobject*)x, 0);
	x->object.z_misc |= Z_NO_INPLACE | Z_MC_INLETS;

	// instantiate Jitter object with dest_name arg
	if (!((x->jitObject = jit_object_new(_sym_jit_ndi_receive, x->hostName,  x->sourceName, x->numAudioChannels))))
	{
		object_error((t_object*)x, "Could not allocate jitter object");
		freeobject((t_object*)x);
		return NULL;
	}

	max_jit_mop_setup_simple(x, x->jitObject, 0, NULL);
	max_jit_attr_args(x, argc, argv);
	
	if (x->numAudioChannels > 0)
		outlet_new((t_object * )x, "multichannelsignal");

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

void max_jit_ndi_receive_assist(t_max_jit_ndi_receive* x, void* b, long io, long index, char* s)
{
	switch (io)
	{
        case 1:
			strncpy_zero(s, "bang, messages in", 512);
            break;
        case 2:
			if (x->numAudioChannels > 0)
			{
				switch (index)
				{
					case 0:
						strncpy_zero(s, "(multi-channel signal) out", 512);
		                break;
		            case 1:
						strncpy_zero(s, "(matrix) out", 512);
		                break;
					case 2:
						strncpy_zero(s, "dumpout", 512);
		                break;
		        }
			}
			else
			{
				switch (index)
				{
		            case 0:
						strncpy_zero(s, "(matrix) out", 512);
		                break;
					case 1:
						strncpy_zero(s, "dumpout", 512);
		                break;
		        }
			}
            break;
    }
}


void max_jit_ndi_receive_notify(t_max_jit_ndi_receive* x, t_symbol* s, t_symbol* msg, void* ob, void* data)
{
	if (msg == _sym_attr_modified)
	{
		t_symbol* attrname = (t_symbol*)jit_object_method((t_object *)data, _sym_getname); 

		if (attrname == _sym_ptz_capable 
			|| attrname == _sym_ptz_autofocus || attrname == _sym_ptz_whitebalance_mode || attrname == _sym_ptz_autoexposure)
		{
			max_jit_ndi_receive_ptz_update_enabled_attr(x);
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


void max_jit_ndi_receive_ptz_update_enabled_attr(t_max_jit_ndi_receive* x)
{
	const t_bool isPtzCapable = jit_attr_getlong(x->jitObject, _sym_ptz_capable);
	
	if (isPtzCapable)
	{
		const t_bool isAutofocus = jit_attr_getlong(x->jitObject, _sym_ptz_autofocus);
		const t_atom_long whiteBalanceMode = jit_attr_getlong(x->jitObject, _sym_ptz_whitebalance_mode);
		const t_bool isAutoExposure = jit_attr_getlong(x->jitObject, _sym_ptz_autoexposure);
		
		object_attr_setdisabled((t_object*)x, _sym_ptz_zoom, 0);
		object_attr_setdisabled((t_object*)x, _sym_ptz_zoom_speed, 0);
		object_attr_setdisabled((t_object*)x, _sym_ptz_zoom_speed, 0);
		object_attr_setdisabled((t_object*)x, _sym_ptz_pantilt, 0);
		object_attr_setdisabled((t_object*)x, _sym_ptz_pantilt_speed, 0);
		object_attr_setdisabled((t_object*)x, _sym_ptz_flip, 0);
		object_attr_setdisabled((t_object*)x, _sym_ptz_autofocus, 0);

		object_attr_setdisabled((t_object*)x, _sym_ptz_focus, isAutofocus);
		object_attr_setdisabled((t_object*)x, _sym_ptz_focus_speed, isAutofocus);
		
		object_attr_setdisabled((t_object*)x, _sym_ptz_whitebalance_mode, 0);
		object_attr_setdisabled((t_object*)x, _sym_ptz_whitebalance_red, whiteBalanceMode != WHITEBALANCEMODE_MANUAL);
		object_attr_setdisabled((t_object*)x, _sym_ptz_whitebalance_blue, whiteBalanceMode != WHITEBALANCEMODE_MANUAL);
		
		object_attr_setdisabled((t_object*)x, _sym_ptz_autoexposure, 0);
		object_attr_setdisabled((t_object*)x, _sym_ptz_exposure, isAutoExposure);
	}
	else
	{
		object_attr_setdisabled((t_object*)x, _sym_ptz_zoom, 1);
		object_attr_setdisabled((t_object*)x, _sym_ptz_zoom_speed, 1);
		object_attr_setdisabled((t_object*)x, _sym_ptz_pantilt, 1);
		object_attr_setdisabled((t_object*)x, _sym_ptz_pantilt_speed, 1);
		object_attr_setdisabled((t_object*)x, _sym_ptz_flip, 1);
		object_attr_setdisabled((t_object*)x, _sym_ptz_autofocus, 1);
		object_attr_setdisabled((t_object*)x, _sym_ptz_focus, 1);
		object_attr_setdisabled((t_object*)x, _sym_ptz_focus_speed, 1);
		object_attr_setdisabled((t_object*)x, _sym_ptz_whitebalance_mode, 1);
		object_attr_setdisabled((t_object*)x, _sym_ptz_whitebalance_red, 1);
		object_attr_setdisabled((t_object*)x, _sym_ptz_whitebalance_blue, 1);
		object_attr_setdisabled((t_object*)x, _sym_ptz_autoexposure, 1);
		object_attr_setdisabled((t_object*)x, _sym_ptz_exposure, 1);
	}
}


void max_jit_ndi_receive_getsourcelist(t_max_jit_ndi_receive* x)
{
	t_symbol* sourceListDictName = (t_symbol*)jit_object_method((t_object *)x->jitObject, _sym_getsourcelist);
	t_atom argv[2];
	atom_setsym(argv, _sym_dictionary);
	atom_setsym(argv + 1, sourceListDictName);
	max_jit_obex_dumpout(x, _sym_sourcelist, 2, argv);
}

void max_jit_ndi_receive_getsource(t_max_jit_ndi_receive* x)
{
	t_symbol* sourceName = (t_symbol*)jit_object_method((t_object *)x->jitObject, _sym_getsource);
	t_atom argv[1];
	atom_setsym(argv, sourceName);
	max_jit_obex_dumpout(x, _sym_source, 1, argv);
}

void max_jit_ndi_receive_setsource(t_max_jit_ndi_receive* x, t_symbol* s, long argc, t_atom* argv)
{
	if (argc != 0)
		object_error((t_object*)x, "doesn't understand \"%s\"", s);
	else
		jit_object_method((t_object *)x->jitObject, _sym_setsource, s);
}

void max_jit_ndi_receive_getsourcelistmenu(t_max_jit_ndi_receive* x)
{
	t_atom argv[2];
	atom_setsym(argv, _sym_clear);
	max_jit_obex_dumpout(x, _sym_sourcelistmenu, 1, argv);

	atom_setsym(argv, _sym_append);
	
	t_symbol* sourceListDictName = (t_symbol*)jit_object_method((t_object *)x->jitObject, _sym_getsourcelist);

	t_dictionary* sources = dictobj_findregistered_retain(sourceListDictName);
	assert(sources);

	if (!sources)
		return;

	long numHostKeys;
	t_symbol** hostKeys;
	
	dictionary_getkeys(sources, &numHostKeys, &hostKeys);

	for(int i = 0; i < numHostKeys; ++i)
	{
		t_dictionary* hostSources = NULL;
		dictionary_getdictionary(sources, hostKeys[i], (t_object**)&hostSources);

		if (!hostSources)
			continue;
		
		long numSourceKeys;
		t_symbol** sourceKeys;
	
		dictionary_getkeys(hostSources, &numSourceKeys, &sourceKeys);

		for (int j = 0; j < numSourceKeys; ++j)
		{
			t_symbol* value = NULL;
			dictionary_getsym(hostSources, sourceKeys[j], &value);

			if (!value)
				continue;
			
			atom_setsym(argv + 1, value);
			max_jit_obex_dumpout(x, _sym_sourcelistmenu, 2, argv);
		}
	}
}

void max_jit_ndi_receive_dsp64(t_max_jit_ndi_receive* x, t_object* dsp64, short* count, double samplerate,
							   long maxvectorsize, long flags)
{
	object_method_direct(void, (t_jit_object*, double), x->jitObject, _sym_audio_start, samplerate);
	object_method(dsp64, gensym("dsp_add64"), x, max_jit_ndi_receive_perform64, 0, NULL);
}

long max_jit_ndi_receive_multichanneloutputs(t_max_jit_ndi_receive* x, long outletIndex)
{
    return x->numAudioChannels;
}

void max_jit_ndi_receive_perform64(t_max_jit_ndi_receive* x, t_object* dsp64, double** ins, long numins, double** outs,
								   long numouts, long sampleframes, long flags, void* userparam)
{
	jit_object_method(x->jitObject, _sym_get_samples, outs, sampleframes);
}

void max_jit_ndi_receive_printversion(t_max_jit_ndi_receive* x)
{
	object_post((t_object*)x, "jit.ndi.receive~ V%ld.%ld.%ld - %s",
		JIT_NDI_VERSION_MAJOR, JIT_NDI_VERSION_MINOR, JIT_NDI_VERSION_BUGFIX, JIT_NDI_COPYRIGHT);
}

void max_jit_ndi_receive_getruntimeurl(t_max_jit_ndi_receive* x)
{
	t_atom argv;
	atom_setsym(&argv, gensym(NDILIB_REDIST_URL));
	max_jit_obex_dumpout(x, _sym_runtimeurl, 1, &argv);
}

t_symbol* max_jit_ndi_gethostname(t_max_jit_ndi_receive* x)
{
#ifdef WIN_VERSION
		
	TCHAR  computerName[MAX_COMPUTERNAME_LENGTH+1];
	DWORD  bufferSize = MAX_COMPUTERNAME_LENGTH+1;
	GetComputerName(computerName, &bufferSize);

	return gensym(computerName);
		
#else
		
	char hostname[MAXHOSTNAMELEN];
	gethostname(hostname, MAXHOSTNAMELEN);

	return gensym(hostname);
		
#endif
}
