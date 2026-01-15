{
    "patcher": {
        "fileversion": 1,
        "appversion": {
            "major": 9,
            "minor": 1,
            "revision": 2,
            "architecture": "x64",
            "modernui": 1
        },
        "classnamespace": "box",
        "rect": [ 1543.0, 364.0, 730.0, 835.0 ],
        "gridonopen": 2,
        "gridsize": [ 10.0, 10.0 ],
        "gridsnaponopen": 2,
        "objectsnaponopen": 0,
        "showrootpatcherontab": 0,
        "showontab": 0,
        "boxes": [
            {
                "box": {
                    "id": "obj-2",
                    "maxclass": "newobj",
                    "numinlets": 0,
                    "numoutlets": 0,
                    "patcher": {
                        "fileversion": 1,
                        "appversion": {
                            "major": 9,
                            "minor": 1,
                            "revision": 2,
                            "architecture": "x64",
                            "modernui": 1
                        },
                        "classnamespace": "box",
                        "rect": [ 0.0, 26.0, 730.0, 809.0 ],
                        "gridonopen": 2,
                        "gridsize": [ 10.0, 10.0 ],
                        "gridsnaponopen": 2,
                        "objectsnaponopen": 0,
                        "showontab": 1,
                        "boxes": [
                            {
                                "box": {
                                    "id": "obj-12",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 360.0, 150.0, 60.0, 22.0 ],
                                    "text": "loadmess"
                                }
                            },
                            {
                                "box": {
                                    "hidden": 1,
                                    "id": "obj-18",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 550.0, 610.0, 90.0, 22.0 ],
                                    "text": "loadmess 5000"
                                }
                            },
                            {
                                "box": {
                                    "bubble": 1,
                                    "bubbleside": 3,
                                    "fontname": "Arial",
                                    "fontsize": 13.0,
                                    "id": "obj-68",
                                    "linecount": 2,
                                    "maxclass": "comment",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 406.0, 670.0, 130.0, 40.0 ],
                                    "text": "Fade time multiplier (ms)"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-66",
                                    "maxclass": "newobj",
                                    "numinlets": 3,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patcher": {
                                        "fileversion": 1,
                                        "appversion": {
                                            "major": 9,
                                            "minor": 1,
                                            "revision": 2,
                                            "architecture": "x64",
                                            "modernui": 1
                                        },
                                        "classnamespace": "box",
                                        "rect": [ 646.0, 382.0, 640.0, 676.0 ],
                                        "gridonopen": 2,
                                        "gridsize": [ 10.0, 10.0 ],
                                        "gridsnaponopen": 2,
                                        "objectsnaponopen": 0,
                                        "boxes": [
                                            {
                                                "box": {
                                                    "id": "obj-7",
                                                    "maxclass": "newobj",
                                                    "numinlets": 2,
                                                    "numoutlets": 1,
                                                    "outlettype": [ "float" ],
                                                    "patching_rect": [ 210.0, 220.0, 29.5, 22.0 ],
                                                    "text": "!- 1."
                                                }
                                            },
                                            {
                                                "box": {
                                                    "id": "obj-50",
                                                    "maxclass": "newobj",
                                                    "numinlets": 2,
                                                    "numoutlets": 1,
                                                    "outlettype": [ "int" ],
                                                    "patching_rect": [ 90.0, 130.0, 29.5, 22.0 ],
                                                    "text": "+ 1"
                                                }
                                            },
                                            {
                                                "box": {
                                                    "id": "obj-49",
                                                    "maxclass": "newobj",
                                                    "numinlets": 3,
                                                    "numoutlets": 1,
                                                    "outlettype": [ "" ],
                                                    "patching_rect": [ 20.0, 560.0, 62.0, 22.0 ],
                                                    "text": "switch 2 1"
                                                }
                                            },
                                            {
                                                "box": {
                                                    "id": "obj-46",
                                                    "maxclass": "newobj",
                                                    "numinlets": 1,
                                                    "numoutlets": 1,
                                                    "outlettype": [ "" ],
                                                    "patching_rect": [ 330.0, 510.0, 85.0, 22.0 ],
                                                    "text": "prepend recall"
                                                }
                                            },
                                            {
                                                "box": {
                                                    "id": "obj-45",
                                                    "maxclass": "newobj",
                                                    "numinlets": 2,
                                                    "numoutlets": 1,
                                                    "outlettype": [ "int" ],
                                                    "patching_rect": [ 90.0, 100.0, 36.0, 22.0 ],
                                                    "text": ">= 1."
                                                }
                                            },
                                            {
                                                "box": {
                                                    "id": "obj-39",
                                                    "maxclass": "newobj",
                                                    "numinlets": 2,
                                                    "numoutlets": 1,
                                                    "outlettype": [ "" ],
                                                    "patching_rect": [ 210.0, 190.0, 42.0, 22.0 ],
                                                    "text": "gate 1"
                                                }
                                            },
                                            {
                                                "box": {
                                                    "id": "obj-33",
                                                    "maxclass": "newobj",
                                                    "numinlets": 1,
                                                    "numoutlets": 2,
                                                    "outlettype": [ "float", "float" ],
                                                    "patching_rect": [ 170.0, 60.0, 29.5, 22.0 ],
                                                    "text": "t f f"
                                                }
                                            },
                                            {
                                                "box": {
                                                    "id": "obj-32",
                                                    "maxclass": "newobj",
                                                    "numinlets": 2,
                                                    "numoutlets": 1,
                                                    "outlettype": [ "int" ],
                                                    "patching_rect": [ 190.0, 100.0, 29.5, 22.0 ],
                                                    "text": "< 1."
                                                }
                                            },
                                            {
                                                "box": {
                                                    "id": "obj-25",
                                                    "maxclass": "newobj",
                                                    "numinlets": 2,
                                                    "numoutlets": 1,
                                                    "outlettype": [ "float" ],
                                                    "patching_rect": [ 210.0, 310.0, 29.5, 22.0 ],
                                                    "text": "f"
                                                }
                                            },
                                            {
                                                "box": {
                                                    "id": "obj-24",
                                                    "maxclass": "newobj",
                                                    "numinlets": 1,
                                                    "numoutlets": 2,
                                                    "outlettype": [ "", "int" ],
                                                    "patching_rect": [ 210.0, 390.0, 29.5, 22.0 ],
                                                    "text": "t l 0"
                                                }
                                            },
                                            {
                                                "box": {
                                                    "id": "obj-23",
                                                    "maxclass": "newobj",
                                                    "numinlets": 1,
                                                    "numoutlets": 1,
                                                    "outlettype": [ "" ],
                                                    "patching_rect": [ 210.0, 350.0, 63.0, 22.0 ],
                                                    "text": "prepend 1"
                                                }
                                            },
                                            {
                                                "box": {
                                                    "id": "obj-14",
                                                    "maxclass": "newobj",
                                                    "numinlets": 2,
                                                    "numoutlets": 1,
                                                    "outlettype": [ "float" ],
                                                    "patching_rect": [ 210.0, 250.0, 59.0, 22.0 ],
                                                    "text": "* 0."
                                                }
                                            },
                                            {
                                                "box": {
                                                    "id": "obj-13",
                                                    "maxclass": "newobj",
                                                    "numinlets": 1,
                                                    "numoutlets": 4,
                                                    "outlettype": [ "bang", "int", "int", "bang" ],
                                                    "patching_rect": [ 40.0, 240.0, 50.5, 22.0 ],
                                                    "text": "t b i i b"
                                                }
                                            },
                                            {
                                                "box": {
                                                    "id": "obj-12",
                                                    "maxclass": "newobj",
                                                    "numinlets": 2,
                                                    "numoutlets": 1,
                                                    "outlettype": [ "int" ],
                                                    "patching_rect": [ 120.0, 390.0, 29.5, 22.0 ],
                                                    "text": "i"
                                                }
                                            },
                                            {
                                                "box": {
                                                    "id": "obj-9",
                                                    "maxclass": "newobj",
                                                    "numinlets": 3,
                                                    "numoutlets": 1,
                                                    "outlettype": [ "" ],
                                                    "patching_rect": [ 40.0, 470.0, 190.0, 22.0 ],
                                                    "text": "join 3 @triggers 2"
                                                }
                                            },
                                            {
                                                "box": {
                                                    "id": "obj-6",
                                                    "maxclass": "newobj",
                                                    "numinlets": 3,
                                                    "numoutlets": 1,
                                                    "outlettype": [ "" ],
                                                    "patching_rect": [ 40.0, 510.0, 137.0, 22.0 ],
                                                    "text": "sprintf recall %ld %ld %f"
                                                }
                                            },
                                            {
                                                "box": {
                                                    "id": "obj-5",
                                                    "maxclass": "newobj",
                                                    "numinlets": 3,
                                                    "numoutlets": 2,
                                                    "outlettype": [ "", "bang" ],
                                                    "patching_rect": [ 210.0, 430.0, 41.0, 22.0 ],
                                                    "text": "line 0."
                                                }
                                            },
                                            {
                                                "box": {
                                                    "comment": "",
                                                    "id": "obj-4",
                                                    "index": 3,
                                                    "maxclass": "inlet",
                                                    "numinlets": 0,
                                                    "numoutlets": 1,
                                                    "outlettype": [ "" ],
                                                    "patching_rect": [ 250.0, 10.0, 30.0, 30.0 ]
                                                }
                                            },
                                            {
                                                "box": {
                                                    "comment": "",
                                                    "id": "obj-3",
                                                    "index": 1,
                                                    "maxclass": "outlet",
                                                    "numinlets": 1,
                                                    "numoutlets": 0,
                                                    "patching_rect": [ 20.0, 610.0, 30.0, 30.0 ]
                                                }
                                            },
                                            {
                                                "box": {
                                                    "comment": "",
                                                    "id": "obj-2",
                                                    "index": 2,
                                                    "maxclass": "inlet",
                                                    "numinlets": 0,
                                                    "numoutlets": 1,
                                                    "outlettype": [ "float" ],
                                                    "patching_rect": [ 170.0, 10.0, 30.0, 30.0 ]
                                                }
                                            },
                                            {
                                                "box": {
                                                    "comment": "",
                                                    "id": "obj-1",
                                                    "index": 1,
                                                    "maxclass": "inlet",
                                                    "numinlets": 0,
                                                    "numoutlets": 1,
                                                    "outlettype": [ "int" ],
                                                    "patching_rect": [ 40.0, 10.0, 30.0, 30.0 ]
                                                }
                                            }
                                        ],
                                        "lines": [
                                            {
                                                "patchline": {
                                                    "destination": [ "obj-13", 0 ],
                                                    "source": [ "obj-1", 0 ]
                                                }
                                            },
                                            {
                                                "patchline": {
                                                    "destination": [ "obj-9", 1 ],
                                                    "source": [ "obj-12", 0 ]
                                                }
                                            },
                                            {
                                                "patchline": {
                                                    "destination": [ "obj-12", 0 ],
                                                    "midpoints": [ 81.0, 305.0, 129.5, 305.0 ],
                                                    "source": [ "obj-13", 3 ]
                                                }
                                            },
                                            {
                                                "patchline": {
                                                    "destination": [ "obj-12", 1 ],
                                                    "midpoints": [ 70.5, 316.0, 140.0, 316.0 ],
                                                    "source": [ "obj-13", 2 ]
                                                }
                                            },
                                            {
                                                "patchline": {
                                                    "destination": [ "obj-25", 0 ],
                                                    "midpoints": [ 49.5, 291.0, 219.5, 291.0 ],
                                                    "source": [ "obj-13", 0 ]
                                                }
                                            },
                                            {
                                                "patchline": {
                                                    "destination": [ "obj-46", 0 ],
                                                    "midpoints": [ 60.0, 276.0, 339.5, 276.0 ],
                                                    "order": 0,
                                                    "source": [ "obj-13", 1 ]
                                                }
                                            },
                                            {
                                                "patchline": {
                                                    "destination": [ "obj-9", 0 ],
                                                    "order": 1,
                                                    "source": [ "obj-13", 1 ]
                                                }
                                            },
                                            {
                                                "patchline": {
                                                    "destination": [ "obj-25", 1 ],
                                                    "source": [ "obj-14", 0 ]
                                                }
                                            },
                                            {
                                                "patchline": {
                                                    "destination": [ "obj-33", 0 ],
                                                    "midpoints": [ 179.5, 50.0, 179.5, 50.0 ],
                                                    "source": [ "obj-2", 0 ]
                                                }
                                            },
                                            {
                                                "patchline": {
                                                    "destination": [ "obj-24", 0 ],
                                                    "source": [ "obj-23", 0 ]
                                                }
                                            },
                                            {
                                                "patchline": {
                                                    "destination": [ "obj-5", 0 ],
                                                    "midpoints": [ 230.0, 422.0, 219.5, 422.0 ],
                                                    "source": [ "obj-24", 1 ]
                                                }
                                            },
                                            {
                                                "patchline": {
                                                    "destination": [ "obj-5", 0 ],
                                                    "source": [ "obj-24", 0 ]
                                                }
                                            },
                                            {
                                                "patchline": {
                                                    "destination": [ "obj-23", 0 ],
                                                    "source": [ "obj-25", 0 ]
                                                }
                                            },
                                            {
                                                "patchline": {
                                                    "destination": [ "obj-39", 0 ],
                                                    "midpoints": [ 199.5, 141.0, 219.5, 141.0 ],
                                                    "source": [ "obj-32", 0 ]
                                                }
                                            },
                                            {
                                                "patchline": {
                                                    "destination": [ "obj-32", 0 ],
                                                    "order": 0,
                                                    "source": [ "obj-33", 1 ]
                                                }
                                            },
                                            {
                                                "patchline": {
                                                    "destination": [ "obj-39", 1 ],
                                                    "midpoints": [ 179.5, 167.0, 242.5, 167.0 ],
                                                    "source": [ "obj-33", 0 ]
                                                }
                                            },
                                            {
                                                "patchline": {
                                                    "destination": [ "obj-45", 0 ],
                                                    "midpoints": [ 190.0, 89.0, 99.5, 89.0 ],
                                                    "order": 1,
                                                    "source": [ "obj-33", 1 ]
                                                }
                                            },
                                            {
                                                "patchline": {
                                                    "destination": [ "obj-7", 0 ],
                                                    "source": [ "obj-39", 0 ]
                                                }
                                            },
                                            {
                                                "patchline": {
                                                    "destination": [ "obj-14", 1 ],
                                                    "source": [ "obj-4", 0 ]
                                                }
                                            },
                                            {
                                                "patchline": {
                                                    "destination": [ "obj-50", 0 ],
                                                    "source": [ "obj-45", 0 ]
                                                }
                                            },
                                            {
                                                "patchline": {
                                                    "destination": [ "obj-49", 2 ],
                                                    "midpoints": [ 339.5, 541.0, 72.5, 541.0 ],
                                                    "source": [ "obj-46", 0 ]
                                                }
                                            },
                                            {
                                                "patchline": {
                                                    "destination": [ "obj-3", 0 ],
                                                    "source": [ "obj-49", 0 ]
                                                }
                                            },
                                            {
                                                "patchline": {
                                                    "destination": [ "obj-9", 2 ],
                                                    "source": [ "obj-5", 0 ]
                                                }
                                            },
                                            {
                                                "patchline": {
                                                    "destination": [ "obj-49", 0 ],
                                                    "midpoints": [ 99.5, 166.0, 29.5, 166.0 ],
                                                    "source": [ "obj-50", 0 ]
                                                }
                                            },
                                            {
                                                "patchline": {
                                                    "destination": [ "obj-49", 1 ],
                                                    "source": [ "obj-6", 0 ]
                                                }
                                            },
                                            {
                                                "patchline": {
                                                    "destination": [ "obj-14", 0 ],
                                                    "source": [ "obj-7", 0 ]
                                                }
                                            },
                                            {
                                                "patchline": {
                                                    "destination": [ "obj-6", 0 ],
                                                    "source": [ "obj-9", 0 ]
                                                }
                                            }
                                        ]
                                    },
                                    "patching_rect": [ 470.0, 720.0, 114.0, 22.0 ],
                                    "text": "p recall_interpolator"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-56",
                                    "maxclass": "number",
                                    "maximum": 5000,
                                    "minimum": 0,
                                    "numinlets": 1,
                                    "numoutlets": 2,
                                    "outlettype": [ "", "bang" ],
                                    "parameter_enable": 0,
                                    "patching_rect": [ 540.0, 680.0, 50.0, 22.0 ]
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-54",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 3,
                                    "outlettype": [ "", "", "" ],
                                    "patching_rect": [ 190.0, 770.0, 214.0, 22.0 ],
                                    "restore": [ 0.5 ],
                                    "saved_object_attributes": {
                                        "parameter_enable": 0,
                                        "parameter_mappable": 0
                                    },
                                    "text": "pattr zoom @bindto ndi_ptz::ptz_zoom",
                                    "varname": "zoom"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-53",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 3,
                                    "outlettype": [ "", "", "" ],
                                    "patching_rect": [ 190.0, 740.0, 220.0, 22.0 ],
                                    "restore": [ 0.0, 0.0 ],
                                    "saved_object_attributes": {
                                        "parameter_enable": 0,
                                        "parameter_mappable": 0
                                    },
                                    "text": "pattr pantilt @bindto ndi_ptz::ptz_pantilt",
                                    "varname": "pantilt"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-49",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 470.0, 770.0, 153.0, 22.0 ],
                                    "saved_object_attributes": {
                                        "client_rect": [ 1570, 212, 2178, 642 ],
                                        "parameter_enable": 0,
                                        "parameter_mappable": 0,
                                        "storage_rect": [ 583, 69, 1034, 197 ]
                                    },
                                    "text": "pattrstorage @savemode 0",
                                    "varname": "u742000520"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-33",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 590.0, 640.0, 83.0, 22.0 ],
                                    "text": "prepend store"
                                }
                            },
                            {
                                "box": {
                                    "bubble": 1,
                                    "bubbleside": 3,
                                    "fontname": "Arial",
                                    "fontsize": 13.0,
                                    "id": "obj-30",
                                    "linecount": 6,
                                    "maxclass": "comment",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 360.0, 560.0, 100.0, 98.0 ],
                                    "text": "Preset number followed by desired recall speed (0-1)"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-29",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 2,
                                    "outlettype": [ "int", "float" ],
                                    "patching_rect": [ 470.0, 600.0, 67.0, 22.0 ],
                                    "text": "unpack i f"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-22",
                                    "linecount": 5,
                                    "maxclass": "comment",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 440.0, 460.0, 232.0, 74.0 ],
                                    "style": "helpfile_label",
                                    "text": "The object has no internal mechanism for storing presets, however it will report any requests to recall/store presets via the below messages, and can be hooked up to Max's pattr system."
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-16",
                                    "maxclass": "newobj",
                                    "numinlets": 3,
                                    "numoutlets": 3,
                                    "outlettype": [ "", "", "" ],
                                    "patching_rect": [ 470.0, 560.0, 178.0, 22.0 ],
                                    "text": "route preset_recall preset_store"
                                }
                            },
                            {
                                "box": {
                                    "attr": "ptz_zoom",
                                    "id": "obj-15",
                                    "lock": 1,
                                    "maxclass": "attrui",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "parameter_enable": 0,
                                    "patching_rect": [ 232.0, 330.0, 248.0, 22.0 ]
                                }
                            },
                            {
                                "box": {
                                    "attr": "ptz_pantilt",
                                    "id": "obj-3",
                                    "lock": 1,
                                    "maxclass": "attrui",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "parameter_enable": 0,
                                    "patching_rect": [ 232.0, 300.0, 248.0, 22.0 ]
                                }
                            },
                            {
                                "box": {
                                    "attr": "ptz_autofocus",
                                    "id": "obj-38",
                                    "lock": 1,
                                    "maxclass": "attrui",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "parameter_enable": 0,
                                    "patching_rect": [ 490.0, 330.0, 170.0, 22.0 ]
                                }
                            },
                            {
                                "box": {
                                    "attr": "ptz_focus",
                                    "id": "obj-37",
                                    "lock": 1,
                                    "maxclass": "attrui",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "parameter_enable": 0,
                                    "patching_rect": [ 490.0, 300.0, 170.0, 22.0 ]
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-34",
                                    "linecount": 3,
                                    "maxclass": "comment",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 250.0, 370.0, 412.0, 47.0 ],
                                    "style": "helpfile_label",
                                    "text": "PTZ attributes can be set locally, but will be overriden by values sent from a NDI receiver. They are automatically sent from the dump outlet upon change. All attributes are of normalized range (either 0 to 1 or -1 to 1)."
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-32",
                                    "linecount": 2,
                                    "maxclass": "comment",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 255.0, 250.0, 375.0, 33.0 ],
                                    "style": "helpfile_label",
                                    "text": "This example shows a 'virtual PTZ' implementation by hooking up the pan, tilt and zoom attributes of jit.ndi.send~ to jit.gl.camera."
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-27",
                                    "linecount": 4,
                                    "maxclass": "comment",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 99.0, 80.0, 514.0, 60.0 ],
                                    "style": "helpfile_label",
                                    "text": "NDI sources can advertise themselves as PTZ devices to allow control data to be received from NDI receivers. Whilst this capability would usually be implemented by a hardware camera which has PTZ capability, jit.ndi.send~ can optionally receive this data into read-only ptz attributes to allow custom functionality to be implemented in a Max patch."
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-14",
                                    "maxclass": "newobj",
                                    "numinlets": 3,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 10.0, 610.0, 51.0, 22.0 ],
                                    "text": "pak f f 0"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-13",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 10.0, 640.0, 88.0, 22.0 ],
                                    "text": "prepend lookat"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-11",
                                    "maxclass": "newobj",
                                    "numinlets": 6,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 120.0, 570.0, 98.0, 22.0 ],
                                    "text": "scale -1. 1. -3. 3."
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-10",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 2,
                                    "outlettype": [ "float", "float" ],
                                    "patching_rect": [ 10.0, 520.0, 61.0, 22.0 ],
                                    "text": "unpack f f"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-7",
                                    "maxclass": "newobj",
                                    "numinlets": 6,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 10.0, 570.0, 98.0, 22.0 ],
                                    "text": "scale -1. 1. 6. -6."
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-36",
                                    "maxclass": "newobj",
                                    "numinlets": 6,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 230.0, 570.0, 103.0, 22.0 ],
                                    "text": "scale 0. 1. 80. 20."
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-35",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 230.0, 640.0, 114.0, 22.0 ],
                                    "text": "prepend lens_angle"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-26",
                                    "maxclass": "newobj",
                                    "numinlets": 6,
                                    "numoutlets": 2,
                                    "outlettype": [ "jit_gl_texture", "" ],
                                    "patching_rect": [ 360.0, 180.0, 257.0, 22.0 ],
                                    "text": "jit.gl.cubemap @file panorama_cube_map.png"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-23",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 2,
                                    "outlettype": [ "jit_gl_texture", "" ],
                                    "patching_rect": [ 10.0, 680.0, 129.0, 22.0 ],
                                    "text": "jit.gl.camera @tripod 1"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-17",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 2,
                                    "outlettype": [ "", "" ],
                                    "patching_rect": [ 360.0, 210.0, 71.0, 22.0 ],
                                    "text": "jit.gl.skybox"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-9",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 2,
                                    "outlettype": [ "jit_matrix", "" ],
                                    "patching_rect": [ 10.0, 210.0, 53.0, 22.0 ],
                                    "text": "jit.matrix"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-8",
                                    "maxclass": "toggle",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "int" ],
                                    "parameter_enable": 0,
                                    "patching_rect": [ 10.0, 80.0, 24.0, 24.0 ]
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-4",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 3,
                                    "outlettype": [ "jit_matrix", "bang", "" ],
                                    "patching_rect": [ 10.0, 170.0, 254.0, 22.0 ],
                                    "text": "jit.world @fps 30 @output_matrix 1 @visible 0"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-6",
                                    "maxclass": "jit.pwindow",
                                    "numinlets": 1,
                                    "numoutlets": 2,
                                    "outlettype": [ "jit_matrix", "" ],
                                    "patching_rect": [ 41.0, 260.0, 160.0, 120.0 ],
                                    "sync": 1
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-2",
                                    "maxclass": "newobj",
                                    "numinlets": 3,
                                    "numoutlets": 3,
                                    "outlettype": [ "", "", "" ],
                                    "patching_rect": [ 10.0, 480.0, 149.0, 22.0 ],
                                    "text": "route ptz_pantilt ptz_zoom"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-1",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 10.0, 440.0, 226.0, 22.0 ],
                                    "text": "jit.ndi.send~ MaxNDIPTZ @ptz_enable 1",
                                    "varname": "ndi_ptz"
                                }
                            },
                            {
                                "box": {
                                    "border": 0,
                                    "filename": "helpname.js",
                                    "id": "obj-5",
                                    "ignoreclick": 1,
                                    "jsarguments": [ "jit.ndi.send~" ],
                                    "maxclass": "jsui",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "parameter_enable": 0,
                                    "patching_rect": [ 10.0, 10.0, 260.7200012207031, 57.599853515625 ]
                                }
                            },
                            {
                                "box": {
                                    "background": 1,
                                    "bgcolor": [ 1.0, 0.788235, 0.470588, 1.0 ],
                                    "fontface": 1,
                                    "hint": "",
                                    "id": "obj-21",
                                    "ignoreclick": 1,
                                    "legacytextcolor": 1,
                                    "maxclass": "textbutton",
                                    "numinlets": 1,
                                    "numoutlets": 3,
                                    "outlettype": [ "", "", "int" ],
                                    "parameter_enable": 0,
                                    "patching_rect": [ 40.0, 80.0, 20.0, 20.0 ],
                                    "rounded": 60.0,
                                    "text": "1",
                                    "textcolor": [ 0.34902, 0.34902, 0.34902, 1.0 ]
                                }
                            }
                        ],
                        "lines": [
                            {
                                "patchline": {
                                    "destination": [ "obj-2", 0 ],
                                    "source": [ "obj-1", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-11", 0 ],
                                    "midpoints": [ 61.5, 556.0, 129.5, 556.0 ],
                                    "source": [ "obj-10", 1 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-7", 0 ],
                                    "source": [ "obj-10", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-14", 1 ],
                                    "midpoints": [ 129.5, 602.0, 35.5, 602.0 ],
                                    "source": [ "obj-11", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-26", 0 ],
                                    "source": [ "obj-12", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-23", 0 ],
                                    "source": [ "obj-13", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-13", 0 ],
                                    "source": [ "obj-14", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-1", 0 ],
                                    "hidden": 1,
                                    "midpoints": [ 241.5, 396.0, 19.5, 396.0 ],
                                    "source": [ "obj-15", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-29", 0 ],
                                    "source": [ "obj-16", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-33", 0 ],
                                    "midpoints": [ 559.0, 605.0, 599.5, 605.0 ],
                                    "source": [ "obj-16", 1 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-56", 0 ],
                                    "hidden": 1,
                                    "source": [ "obj-18", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-10", 0 ],
                                    "source": [ "obj-2", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-16", 0 ],
                                    "midpoints": [ 149.5, 549.0, 479.5, 549.0 ],
                                    "source": [ "obj-2", 2 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-36", 0 ],
                                    "midpoints": [ 84.5, 523.0, 239.5, 523.0 ],
                                    "source": [ "obj-2", 1 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-17", 0 ],
                                    "source": [ "obj-26", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-66", 1 ],
                                    "source": [ "obj-29", 1 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-66", 0 ],
                                    "source": [ "obj-29", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-1", 0 ],
                                    "hidden": 1,
                                    "midpoints": [ 241.5, 397.0, 19.5, 397.0 ],
                                    "source": [ "obj-3", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-49", 0 ],
                                    "midpoints": [ 599.5, 759.0, 479.5, 759.0 ],
                                    "source": [ "obj-33", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-23", 0 ],
                                    "midpoints": [ 239.5, 670.0, 19.5, 670.0 ],
                                    "source": [ "obj-35", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-35", 0 ],
                                    "source": [ "obj-36", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-1", 0 ],
                                    "hidden": 1,
                                    "midpoints": [ 499.5, 396.0, 19.5, 396.0 ],
                                    "source": [ "obj-37", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-1", 0 ],
                                    "hidden": 1,
                                    "midpoints": [ 499.5, 396.0, 19.5, 396.0 ],
                                    "source": [ "obj-38", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-9", 0 ],
                                    "source": [ "obj-4", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-66", 2 ],
                                    "midpoints": [ 549.5, 713.0, 574.5, 713.0 ],
                                    "source": [ "obj-56", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-49", 0 ],
                                    "source": [ "obj-66", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-14", 0 ],
                                    "source": [ "obj-7", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-4", 0 ],
                                    "source": [ "obj-8", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-1", 0 ],
                                    "order": 1,
                                    "source": [ "obj-9", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-6", 0 ],
                                    "midpoints": [ 19.5, 245.0, 50.5, 245.0 ],
                                    "order": 0,
                                    "source": [ "obj-9", 0 ]
                                }
                            }
                        ],
                        "styles": [
                            {
                                "name": "AudioStatus_Menu",
                                "default": {
                                    "bgfillcolor": {
                                        "angle": 270.0,
                                        "autogradient": 0,
                                        "color": [ 0.294118, 0.313726, 0.337255, 1 ],
                                        "color1": [ 0.454902, 0.462745, 0.482353, 0.0 ],
                                        "color2": [ 0.290196, 0.309804, 0.301961, 1.0 ],
                                        "proportion": 0.39,
                                        "type": "color"
                                    }
                                },
                                "parentstyle": "",
                                "multi": 0
                            }
                        ]
                    },
                    "patching_rect": [ 50.0, 160.0, 35.0, 22.0 ],
                    "text": "p ptz",
                    "varname": "ptz"
                }
            },
            {
                "box": {
                    "id": "obj-7",
                    "maxclass": "newobj",
                    "numinlets": 0,
                    "numoutlets": 0,
                    "patcher": {
                        "fileversion": 1,
                        "appversion": {
                            "major": 9,
                            "minor": 1,
                            "revision": 2,
                            "architecture": "x64",
                            "modernui": 1
                        },
                        "classnamespace": "box",
                        "rect": [ 0.0, 26.0, 730.0, 809.0 ],
                        "gridonopen": 2,
                        "gridsize": [ 10.0, 10.0 ],
                        "gridsnaponopen": 2,
                        "showontab": 1,
                        "boxes": [
                            {
                                "box": {
                                    "bubble": 1,
                                    "bubbleside": 0,
                                    "fontname": "Arial",
                                    "fontsize": 13.0,
                                    "id": "obj-10",
                                    "maxclass": "comment",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 520.0, 440.0, 60.0, 40.0 ],
                                    "text": "UYVY",
                                    "textjustification": 1
                                }
                            },
                            {
                                "box": {
                                    "bubble": 1,
                                    "bubbleside": 0,
                                    "fontname": "Arial",
                                    "fontsize": 13.0,
                                    "id": "obj-51",
                                    "maxclass": "comment",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 350.0, 440.0, 60.0, 40.0 ],
                                    "text": "ARGB",
                                    "textjustification": 1
                                }
                            },
                            {
                                "box": {
                                    "colormode": "uyvy",
                                    "id": "obj-8",
                                    "maxclass": "jit.pwindow",
                                    "numinlets": 1,
                                    "numoutlets": 2,
                                    "outlettype": [ "jit_matrix", "" ],
                                    "patching_rect": [ 470.0, 310.0, 160.0, 120.0 ],
                                    "sync": 1
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-6",
                                    "maxclass": "jit.pwindow",
                                    "numinlets": 1,
                                    "numoutlets": 2,
                                    "outlettype": [ "jit_matrix", "" ],
                                    "patching_rect": [ 300.0, 310.0, 160.0, 120.0 ],
                                    "sync": 1
                                }
                            },
                            {
                                "box": {
                                    "border": 0,
                                    "filename": "helpname.js",
                                    "id": "obj-5",
                                    "ignoreclick": 1,
                                    "jsarguments": [ "jit.ndi.send~" ],
                                    "maxclass": "jsui",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "parameter_enable": 0,
                                    "patching_rect": [ 10.0, 10.0, 260.7200012207031, 57.599853515625 ]
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-9",
                                    "linecount": 5,
                                    "maxclass": "comment",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 280.0, 100.0, 358.0, 74.0 ],
                                    "style": "helpfile_label",
                                    "text": "NDI video is sent over the network in the UYVY colorspace for reasons of efficiency. ARGB matrces will be internally converted, however if using UYVY in a patch this conversion can be avoided (and performance improved) by setting correct colormode on jit.ndi.send~."
                                }
                            },
                            {
                                "box": {
                                    "attr": "colormode",
                                    "id": "obj-4",
                                    "lock": 1,
                                    "maxclass": "attrui",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "parameter_enable": 0,
                                    "patching_rect": [ 70.0, 350.0, 180.0, 22.0 ]
                                }
                            },
                            {
                                "box": {
                                    "attr": "colormode",
                                    "id": "obj-3",
                                    "lock": 1,
                                    "maxclass": "attrui",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "parameter_enable": 0,
                                    "patching_rect": [ 70.0, 210.0, 180.0, 22.0 ]
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-1",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 20.0, 400.0, 180.0, 22.0 ],
                                    "text": "jit.ndi.send~ MaxNDIColorspace"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-18",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 40.0, 160.0, 95.0, 22.0 ],
                                    "text": "read wheel.mov"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-16",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 140.0, 160.0, 35.0, 22.0 ],
                                    "text": "read"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-14",
                                    "maxclass": "toggle",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "int" ],
                                    "parameter_enable": 0,
                                    "patching_rect": [ 20.0, 80.0, 24.0, 24.0 ]
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-12",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "bang" ],
                                    "patching_rect": [ 20.0, 120.0, 81.0, 22.0 ],
                                    "text": "qmetro 30 hz"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-11",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 2,
                                    "outlettype": [ "jit_matrix", "" ],
                                    "patching_rect": [ 20.0, 250.0, 55.0, 22.0 ],
                                    "text": "jit.movie"
                                }
                            },
                            {
                                "box": {
                                    "background": 1,
                                    "bgcolor": [ 1.0, 0.788235, 0.470588, 1.0 ],
                                    "fontface": 1,
                                    "hint": "",
                                    "id": "obj-50",
                                    "ignoreclick": 1,
                                    "legacytextcolor": 1,
                                    "maxclass": "textbutton",
                                    "numinlets": 1,
                                    "numoutlets": 3,
                                    "outlettype": [ "", "", "int" ],
                                    "parameter_enable": 0,
                                    "patching_rect": [ 50.5, 80.0, 20.0, 20.0 ],
                                    "rounded": 60.0,
                                    "text": "2",
                                    "textcolor": [ 0.34902, 0.34902, 0.34902, 1.0 ]
                                }
                            },
                            {
                                "box": {
                                    "background": 1,
                                    "bgcolor": [ 1.0, 0.788235, 0.470588, 1.0 ],
                                    "fontface": 1,
                                    "hint": "",
                                    "id": "obj-21",
                                    "ignoreclick": 1,
                                    "legacytextcolor": 1,
                                    "maxclass": "textbutton",
                                    "numinlets": 1,
                                    "numoutlets": 3,
                                    "outlettype": [ "", "", "int" ],
                                    "parameter_enable": 0,
                                    "patching_rect": [ 190.0, 161.0, 20.0, 20.0 ],
                                    "rounded": 60.0,
                                    "text": "1",
                                    "textcolor": [ 0.34902, 0.34902, 0.34902, 1.0 ]
                                }
                            }
                        ],
                        "lines": [
                            {
                                "patchline": {
                                    "destination": [ "obj-1", 0 ],
                                    "order": 2,
                                    "source": [ "obj-11", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-6", 0 ],
                                    "midpoints": [ 29.5, 289.0, 309.5, 289.0 ],
                                    "order": 1,
                                    "source": [ "obj-11", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-8", 0 ],
                                    "midpoints": [ 29.5, 289.0, 479.5, 289.0 ],
                                    "order": 0,
                                    "source": [ "obj-11", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-11", 0 ],
                                    "source": [ "obj-12", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-12", 0 ],
                                    "source": [ "obj-14", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-11", 0 ],
                                    "midpoints": [ 149.5, 193.0, 29.5, 193.0 ],
                                    "source": [ "obj-16", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-11", 0 ],
                                    "midpoints": [ 49.5, 193.0, 29.5, 193.0 ],
                                    "source": [ "obj-18", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-11", 0 ],
                                    "source": [ "obj-3", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-1", 0 ],
                                    "source": [ "obj-4", 0 ]
                                }
                            }
                        ],
                        "styles": [
                            {
                                "name": "AudioStatus_Menu",
                                "default": {
                                    "bgfillcolor": {
                                        "angle": 270.0,
                                        "autogradient": 0,
                                        "color": [ 0.294118, 0.313726, 0.337255, 1 ],
                                        "color1": [ 0.454902, 0.462745, 0.482353, 0.0 ],
                                        "color2": [ 0.290196, 0.309804, 0.301961, 1.0 ],
                                        "proportion": 0.39,
                                        "type": "color"
                                    }
                                },
                                "parentstyle": "",
                                "multi": 0
                            }
                        ]
                    },
                    "patching_rect": [ 20.0, 110.0, 79.0, 22.0 ],
                    "text": "p colorspace"
                }
            },
            {
                "box": {
                    "fontname": "Arial",
                    "fontsize": 12.0,
                    "id": "obj-1",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 120.0, 120.0, 158.0, 22.0 ],
                    "saved_object_attributes": {
                        "filename": "helpstarter.js",
                        "parameter_enable": 0
                    },
                    "text": "js helpstarter.js jit.ndi.send~"
                }
            },
            {
                "box": {
                    "border": 0,
                    "filename": "helpname.js",
                    "id": "obj-5",
                    "ignoreclick": 1,
                    "jsarguments": [ "jit.ndi.send~" ],
                    "maxclass": "jsui",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 10.0, 10.0, 260.7200012207031, 57.599853515625 ]
                }
            },
            {
                "box": {
                    "id": "obj-4",
                    "maxclass": "newobj",
                    "numinlets": 0,
                    "numoutlets": 0,
                    "patcher": {
                        "fileversion": 1,
                        "appversion": {
                            "major": 9,
                            "minor": 1,
                            "revision": 2,
                            "architecture": "x64",
                            "modernui": 1
                        },
                        "classnamespace": "box",
                        "rect": [ 1543.0, 390.0, 730.0, 809.0 ],
                        "gridonopen": 2,
                        "gridsize": [ 10.0, 10.0 ],
                        "gridsnaponopen": 2,
                        "objectsnaponopen": 0,
                        "showontab": 1,
                        "boxes": [
                            {
                                "box": {
                                    "autofit": 1,
                                    "data": [ 8258, "png", "IBkSG0fBZn....PCIgDQRA..A.D...PbHX.....oAqmE....DLmPIQEBHf.B7g.YHB..ejeRDEDU3wY6ctFibcdde+2yYFRJJUqcFKQIG2ZyUxvMnsIgi.cJkURpFaH0lTDfcHon5EIJMKR.UKPKxJfJQ1uTuDEAgTx.ZEfa.jBJ3vav.lhb2EHwAEhnZV+AEwTSncabiqahX20NUNz5xrirMon3rmm9gyYImcNumYdOy8c46O.BQcly08v4+9b+Eb3vgCGNb3vgCGNb33VBjA8MPujeL+AillziViZK9Kv+wEGz2ONb3X3hzC5af1kJ7RYpQsbJZNAFEjbflAjcz39llzGFXx99MoCGNFpYci.Xff2J4U7KHPtZTaG.HqwH1MzFz5vgitLC0Bf+X9CFMEoJHHEpQsGFZTvygCGNZeFJE.eO95ETzhBL1f9dwgCGabYnQ.LLldSnnEAc6N67b3vQulAtNyME9XBAFocNGah2gzrTEgO5i1D+HOgq3Cfvmbao3it2510E.VN7uuLv7.KBrn.ka+mBGNbrdjAp.3OgWXBPlLoBeJ5RDHXMufL+cyyUBX6cgaoEHPTrLvLxMEKc3vwFPFHBfuGuXdEsjfj.QKcAEJsBqLSi0zmFHX8vc0ax.V.nDAhgK17c0gCGq2nuJ.F3t60mDjeOa1eEcIAoTMpUpYExrFTieestycYrLGPIIPPzgCGa.nuI.lPq9lCjo1F+GlwlysBEANVGcCZOKQfH3TNWjc3X8M8EAv2iWbRryBs4.lba7bkSx4Wgb.uc3+aUBhi2pLOABUiF9mUoScYtJvT3DBc3XcK8TAvJ7RYtN0J0p54KzU2hIU3asmCx2NYxUg7DHflif+dRSlxR.S5bM1gi0ezyD.CFDAolwTu41.Gda7bS1qtORJZfUhEHPLLIEh8b.EcIKwgi0OzSD.uLuPNAobyKuEcgZrRgVMkVBERmPQJpnSbu77k5t2swSchgSfcVFVk.qAmpWde4vgitCccAP6D+ZsUeuGuXdBxt6MhUmBydO7bE5F2mIE8lBg1D6v4.J3hMnCGC2zUE.ak3mBUEnPyh0W3L7qDwHzjlzYyxyFqvhBYHHddqRNB11hbS2SWVVahRrlvXFNYb2e0wRDHB1VWGGNbz6oqI.1ZK+zE7gh2KOuQAAaqQPE8YuGd9oB96jg.Ao7DHzkzL6tDAhhkAJmjjnDV5MSQyszsJAs3WoDde4vgi9.cEAPaD+RylxGmkagS+kR1zRbo3m78yxK9pDH.0pDrzNLKvLXQqvEJ.OIPqJr6wchfNbL7QGK.FZ4V4ljs24RS5BlD+RRmgrY9drUdiezl3G945vaYaoJABgS0J2XCiOXIZt.9y5RNhCGCWzwBfuGuXYhw0ylkzBaKSlsvac06f+jOwiOtslTLcIlifr6VNtcHLiwyPysJ0IB5vwPDdcxA+d7BSQrwcSWXSjtnoO4x7B4RQ54al3mvUIK+9u+mhyt0Ar3GD7L9FZSbiUfEoB4YZdmlXG3KEF6PGNbLDPaOPTCKSkXbcM9X9cYdghBxTsHdeysB21DoX4lHvFgUaAtxr1L9R31aLyviRxSbxhM8S8nLeU9B7+jp7ayH7WXbuNlB3hInCGCdZKWfCawsEMIhoP0UnVNSE37k4EJ5gzzgVPCY4s9d70DckwUU30oHPA97rc9gF2sk.xEWhQzkoDBO8M1vmvU4qxViQDzkTDGNFBnsbANr+dMZAm.F6tiVI9onK4i9.qJ9EdtlG3kaXWqBbXf6SBDjlpSa+LAlWfInBE3u.3M4x7zb0F1sIiU7qJSrFwO.1Lak+6bU9kibuuam3mCGCGjXK.eO95E.cZSeV8VuUOcRYxn2rHlWld7PGHhUbKSU9Owl437mKA0Zn4iqJKRbsJ2xTkeEFgpTkfA1fqvnc3XHgDI.F3560mOlY52baimKeiaLXosL87w2cH5wuGd9hM65F5h5h85VKSqxxX597pbA1B+ajrlEuzJjAOJSbY.9Gyk4jrK42mk5h2tNb3nCIQBfwU5JwE2uVUif1H9kDpazVMJqMoGMRYIn.lu4w9QT.EiV1VGGVFYsG2MN9VIBpbbIicY.VqvnHLEJSIYcKVSNbzqnsRBRiKlQw456OgWnjf7zQOCcGwuP2iKD9mDsFBKM7rqKyLHVbNTlCkBR1nVi1RQPXbYj3cgO73mfUGdrJyIYh20aGNbzYz1EB8M6hCxuMd9HVa0rXERLtKCAIKAflM1qBK53IIP3qcpQv4ZLldghOEwtQeUU7IuIWhCOOyGy4nJ9jSxFMoMgVfVhnOOMUzzgCGsO8j4AXyJSlVUif2LSwxtabMAIA8daq3kk.gNinUsbPGDuHXtPKAid7wXUmVM1E1okjQVyn72gCGcI5nNAINtNW2XgNqPUenXqE+.Eszk4ExU2wVffrA2ohePKJaFYDJgOihFoDbpmQvixZknwZLTTzr.qvCqUM7Y9LEXLIIaW+HFHy.QGN1nSW2BvvND4ML8YMoLYLVifJ5R+c3O8g2JuwgALFKwlvBXNqwiRvnqurMmDsB4wiYHdqAi2RvFKql0dLi1XbDCs7LZsR5hEnCG8D5EBfkwb6kYLteWlWHmGhwt8P3pjgW7cSwO8yZwkdIt4Xrpr82wsFKRtwRgw1asBZMOdfFynbr0TnO2moXG5vgi1mtpKvgV+EQ7Sgp0nVwF2dEdoLBRYSmqTTgL7RenEheGG3qHvnRvvG034qSPxxx3SdTlMlcY6HDYMLVxxxHwFqwulVwXr8JY9lH9XV5vgi1itcL.mzzFEXJSsGWbsTmvU4N4O78SQkOcStVyA7.RBbmsSPxxxRFJfxbl2Ad3vDYr1MemLSSNl3hEno8sn82sNb3vF5ZBfMy5uzj1Xb+ha8BdD9CubJV9ti4RUkf4p2fosxTJPP7EMgYq5zXSHRQsBYVylxxxnbbC68HtjgLXQUMqp5ATU+VppeW8l7gpputp5qD94YGz2qNriDK.tq8dx76ZOmnzCsuSslrepnEMs+BLUiY8Mz02XFLn5Bo4u82DyhLKQfv2.anhdC2gCDhMrCQcgUxx7wIpEV6gqEuntSC.9sm.n14r5WvOhp595hW2Wut8cmgWGa39S3y+iX4486pFDuz.guWA3CAdEf8Ary51kr.OBvAB+72QU8fcoeF0J5Uua5Dd8t705cz5dF0t3ufIwIAYW64DkDIn6NTzk.ozuweyGetCdgkiHXoP0MQ5QaT.783EmDC07V86eXM+MC2zpxEHP7anXolLL6vFy1M97UZrE1Zx9ufLRzRoIljgTUFYsVLZ08ppZROlVvk.NpHxq1gW2yKh7n0s+GD3HVb8Wyw0JTUeG.aDM+RhHWrgiceDHp0Neo6h.OSimyFN+Cqua5DZ78Z29ZUA3UI34rRmbhRrEfB2zJDAY6B709L+rUJade0Rlr9SioF4TzIVc+kfktx7DjjiUs7anP7C.IKkisNA8LZEXYLaU6NLUKgnFiq4HF229O2OvqnAtB189swhbTfyawt9HppGvlyYnnpMheG0f32A.9VzdhePfUhutlPKV6P5IuaFxHKvAIvRaq92AwQhD.20dOYdDIRRK9m+NWYES6eMVIhqp0n1DwLYXlyT6uIACpzgJwuafxjX1U3sqULV2d1mfi3bC1anJNf6ifuf2M+h1yPvuguUbjVccCEdrwUzKAbzFN1UcmsSIKAhn8a5EuaF1HKAh8ssHXhD.EzHe46NttOa6iWwPBKzELk423r9iXxfbv0c3r92Bq6uIM+gFyvqYQMIpnlbmwru5PWAQuS5NBE.fHRDwnXHqEW2ifcVu8L06JUnvYW6YBXmpkwDrKSW8cyPLssHXBcAVx23V909QWqwImL.XZADJLyuFs9aa7bkS18xvAxHLElrBTXrFyHbXFdMUKgaOlrGGs7YjgBWfaj80othTOIvU38op9Hl9fvsaSRAdUQjFuV8BQiCNfrFqq9tYHlizNgZHow.LRmP7fu6UeeS63JrRzBCFIN22lLg2GCaX10VStqZnfoC227F12xF1yQho.pGzzssvwVWgekXDVrQDqBvgpeCpp6jfL51sIK1IH2KXPX8Y+lUiKXhv5UEtcs2Sl2z1+hUpkpwsonKYx8WS08mhtz8vyW116igNN1XY9kl6i9Y+w+pWfQu8qz3mVjFEG8orwesSfqskVy1DlGS4OKUvDxtsteMykHHqZlXmX2WbueU08IhbltwMjHxkTUOJsNqv2OAkexMbaNAI93YLjEQaD+pDd8dUQjJghlGjV+yoGg3+4bbLnd2TgfrX2NjziqYOif8OmGPU8PIIyvVK.J9jyzWby7I9lZUsxMtgvBkN54kXrHZXmSOVAvqHvX+u9oY3+7e8u36+e8W4saLVn6PqPl56QXIKKpUYIZrDWL4Z6JLeLhk4n69ysKE51oQB+B9qSqim1i.zUD.g.WgCcksUhRGQU87hHWLAI937wHHXi.3iWuaygYO9wUU+Vz7un1NVVNnd2bwjTpQcHM8YDtQHMrIi7I54zZWfUun0e1cbce.NrByBZ8k3goNzHuoyq+5wUHsSWXQvaZpyh1y9t+ciXIbH1VhKQBuPrC+.s+5Bb3WvOTK2Q6r5JoXsqvg+WaR7QkvyqI1YLaeUtjgXFtJsJ4MY61wAb.+touQ3OysI4XI54z9X.ZH6i+7zR0swyM48vyUXa7741FOm3i9.ahMUxvYHxwqP06kmec3pjVzA3P0ZaJ6hW41itqlis2hlNqwTielpcvQa5sWuAa9spc8XmkfrBuSMnaMrwUoiFddMQqDnh63VUL57s3O8BgnAx6lA.1D9fD8bZsKvlPQhHdEmflFrF9tFV2tDQp9kQ7hLm+l+iFgQu8qTEk4CSfwh3avZuf3.ZZ5OGsKOTVNR+5HIuaP5TBi0U+9xt501VWgsIamWrUta0B1opZ13hyTezsw5ulCr2M8S5EOmVaAnfFcxGmfhSNlxeorsG+PEoLeeu6u6CdXYDxHYHuLBSJiPoDMC+7LZAnoeIQbykvdF84tYvD15JrMmmlQqBfeVrnHr6mLD7touPu3m416BrgN.QE6rfq9Qa+ZNdzgut6vF9WM6hw7IiZyg2jk5xnV1ICMc.iMtVZSs60Vj.WgaFGpY8kaHw5hacb.BZCqiDlDhAMCz2M8Q55OmcjKv1hGhQW1DCtPutAk4PZX7e0mSNQ+hP2OsYHEXi3QaSBbE1DsLSigbdr6KZqV2YGTUsBAwgKtLK2ynG9t49aytW4hMIIQsMgV4ZyyYh7RnuH.5Xnml8O1ssFrf9iUFOCv2kjOfBZkqu.fHxqlf5HbUxRfUgGHTL7F0HXBuGMwf5cisBNMxgZmqUKDaW8mu17NOQ0fXWW.LrfoyW+19FW5Ji9u6s+nt8kZ8AeywFEeuhMt4Eux+MSEN8fh18erWOWpeX8SBJP554nIzpjCQ6O.CxRv81AUUOZGlvEXcz6lNftwyHDX84fU.jfI2xZxv469otE1PyZLpoL9t3Uu8gIAvtAIsCG5zqksegYUKxrFQjyDJx1IsP1pIK49EQrx5ydH8y2MCRR7uromrt.63VNNeWvRmjPRGVAIN6ghHGBKcatEbfv5SbPQ+9cyfh1J9q8EAve9lLO3oUCkVy5FZLAHAaKZFaMzAMav3h.Od+5hENglSxPEvlwlkQBmpxeIZ+dhcUNv.ZbX0We2L.oseNSPmfnQF4ShFst07TMRlcuTlMY7TJwjc3gd9liMZLehgrZ6YTjO2cZbIEIp.pNTKfdFfGsKEr+VRXcf0NhYOR6J.IhbQQjuDAeAqSRxS+djT0We2L.oidNsuWfMTxJpg5VyWDi0sVMOVctANmhdbE8YqQsR1d8GpvOtYxmuox5YTS6YlMccSmWSGussGW+jKQvjT4w6yeA6fz9im9C1IELrHxYB6xiu.AwZpcJqj9gH3f5cS+lKRvPonidN6nrSXp6PtsZ0l+ZoidZ+c9M21w+1e6h+a6jq2vCdlmqgdFDvTFswVY6ytkqdYf60vYvthdVGHEG84I3ezcwAQFECq2sNMoDuBPG0pZgEj8g.NTn63qtZvYC8phltW7tIQK7TcHUv9ew1qRPIF0ogk.HQcBhgtWvP2gL2riurI2k+faK0+.atLO7XGKSbydvgFznKM.ftjwNDwPrBe2qs02Be9J.OKJub3jetpj0f.poXM18Wh.NuzZdTQjCMfD+Z6330.ssqvlHzpvmg.qBs4KjsiEnC0ua5RbQrOS06raI9AIoWf8Ma0gYwpnSKEw7WjuAe48bhB6ZOmnz0Rmth.uwtF6XiZ68VekSMVQSB+ldl4jikOlyx7RVJKivTRFlHr2giDNgXm7ywLMY1.isElrMtB0QtBahPqBeTZsawaDlHK8JND1EVgt55qRRlGfFaaMwP7vhqGg+x64DQrbZW68j4ev8bhkUQlVBWugAfzoKZ68V+knE0b.9QGPoRLtJ66W1pKUpXh0nk8f8FApaZK2JNC1kIvlZMY3Bvcy9iw6kv3PcqR8100I7me1V1QGIt0Bljh0BfW3r6urwOPhNu6R4IFmVw9XXMxnVsEMYQkn5DO7XGa3JCnmbr7lcIUWhmXVCBfFbUV0pr+YKa00yPV1AfUtkxBPqWaORvPyrYtBu5ZBRb+YPstdrgmD79Cftx5dbRqCPCYeTy23Vdyy7jyarrYLH.dgYGeQiqTZhLxGmJk4EanAEdRIyefgsepwxAx1itqFbUNNhYIvzXrB2.RnHkMINn9AbpsYnMNWgaU7k1YXxOVCgeYrUICYivDYoWisu+5Jq2xILKvZYPV6rnSjQdn8cpbu4Ydx07kRElQfmtw8cW64DEuv4dpRqYeElxzBljHxS+k2yIl4O6bO0fecC4z6dRZbc7.Brn65ZTgZwy75erZvU43vj0llVpL2.Rnqu1ztaqY.mFNzLeFBVmLZFwkU3KRqiU2qDJdV+hhzQn0worqE799.s6zfYUZqoBSBd+AgVx2Ic5RhD.EkxpvuWia222uHMrfmmJk2T99ZjolrHxDzv5.xEN69K+f64jyhXZUiiR6Zrik6ByN9hI4dsqxoGq.XbBNChLEiOyZSPzwFKCpV.og5eQ0pbc6VLizJwr.nadoxbiH11quQhajHx4srWdM8EHaDoVcfGbjDNghWOkk1Nc.EzNSEFfD89CpaAwpctVIxE3+ry8TyXx0V0fqsu4Ydx4UzkLbZ1goLGqqTaBSmaDYDIc5YF3wCzz8F5B7DSOYjMuYuILloXQlgwmMpX4wFyzfPMlDnrwW.LzxCaBxcyFvoskqvgkRRuXtF11eI8VTNJ1awbaGOv1nWfMThKHa2X4vnlWvyECKj3AwBTLt+.63ZoSWdfIB9DyNSPrNaPPW0hQ12.q+hy82ntJuYuIXydU3z6tTnklAXV.rZSllzaHHAKqkMcsjMAYUzTVg6ECO.aV41bDRByJbaasZhE.UTytvYPL31VYEiVLBricsmSDY+eqo2+TZ7w3ZGWKc5xCr5C7Imcd9DMWcK+mGlmb1nIiXydSYz5Ok4Lt+biet8zf2zbpBKO549mcZLFuw0oqgxIiWA65J.SKp4qgvXPY0JIV8w6JbHHzMcW0lQwuiFPreI+DBF3DItUCSr.3EN2SUxXFdE4oaTbZtYGeYUDiYxUfoLYQ2ssRsBDeuttCIUp4MUOg8EFe1k4Sz7n9iaz02fBeNRbOA.0O59e5wJDISwhLxmYKe7ugwyg2FaAvv+ArMt9dlDDf8CQ6UfzOCcmjV7p2hLNp5ID9yNaeObjjVj6s03vRIluHZn3kusZ0lxXr.EYjqkJcoF27byN9xddRwXrbDDYDUjoev8bxYFHVCN9rKySNaoHa+XikI1xjQYNi09mZNSw+Ne9ktaCatpbmabE.Cigisq4CVOm9ZWWgCOtGkNyRvCIC9gg5FAr8mgItzXZu4A3JqLooMap3kC5MXywBDgwL4J7adlmbduTd4iUDL7Xkzo++tq8bhRCEsM2l8lxXc+APJ+hQ1VLEU8Houdke2O+haMx9uw28Wac88nIc5eDlXCqV7vavU3JhHONAcXRRRLx4A9BNK+5NjPWg2YRF.slmToVvt1yIKap+dU3vW3r6eRa2e.77jGnw5HDfGZemJmuuVBKVGbUk4DkY7RKkMct5HltRFVg77XYMKBcpwJh3crXN5Cazc4Ss6xlD.O38+Cpdj+g+kQignOOvsJE.8vJg0629Hn3r2I2TvtBAtocdBbOumt534n6Q6K.t2SlWf2vzmo0pceMV2d6ZriMpjJ07lSPfV0KkWdSBWO7XGKy0RktjoZDLNTk4tv41eda2+lxzUxgu+Lfrc7jGfcmcs2imdrBf2zwbmr.OwLQamsXDL2rrxUu7+z+zsFYVApLmjIl5BzgCGsMs8Hw+Bmc+kiMisFhs2Elc7E0FJV5afHi36qkLkTj4lc7keqys+B3yy1TWhq+zY6b0qUb1OXR7029Ft15qkY5JidiO+TikCMt39oUisLYvbhgd166u9SLNnTk0V33Nb3n6PGslfjJkXTPSDdXSYp8Bm6oJopd7XNc63ZoSW9g12oLN..dqo2+T5JqjqIG+MHtoQi07ZUJvY+fEAowt+XDVweFltRlfL9JkMOZr.PmvXYurIuIMcLawy+iOzW7uxz4ZIYDm.nCG8BZeAvoqj4M+W9aUnxm8d9Ql9XELZQ2EN2SUjlTlK9q3GqH3Elc7Euv4dphZsZ2WKDBK2h6dy7ZUJxY+fEQzoiMgFhrCp8C+iwy6MhU7S4kMlo3fDeDoUBA328ys3zY1z0MYg6j1d66vgijQ6I.9ZUJfu+7f70dmGJ2my2StZj8QjQ93ToMlzfsTqVdhSDLvc329A28IM6tLqUH7u4W5K9NW61256ulcnVsEs54X5JYBs1qDm8CWFQOVrBeqh9AeHW+a7q0j8337jSG8d+XikAw7XBCk49u7quv+Z7IGJ0Kr6r9ygidHIKIHSWYTVwuDhrlrW9Y99W5iG8s+92loCItrB+vicrLWKc5xzrL7pL6VVoVw4lcbywza5J4BhQGj9StN24O4C3S8ie+kV5W8eTYfEQ8VDstYmmG4.+L.ihRNDokYWdMrx248o1YtazXWPyONOwzEM9Iwj0W.P8ef5cWVqPdDlDkI2n25aNbLHIoBfYvWWDHhqe+xe6uy6eGK+SMU.uFyJLXqHnVUgIZbDZA.m8CJAh4Nunahdkpb8uwH3+CZ1dEu32o2cIhqCQhqLYb3vQOmj4B7tytLp4De78eju7cuh38wMtcU0wiaTVM2riu7VpUKueJu+OwdMEYDQia8CV50sDWUTYbt1+9xss32oFqHw1dbLmS7ygiAGIOFfOV1RnZjxeo1l2D+fu5+3a5FrpU87jGvnka0wbEKL5e9+heq68C968Y9PSethtzaM89iV1HuVkBXvRztC5Rnx33IixiksDd9wFOxv9BtnwOqYEHspU459CldZ1gCG.saRPR4UDHRFK+n68tXoc7KVQE46oqrRjoDcDBbotLvH+U+S14m9G7quyqDMgJRQy2CrHnG2z8Q6gtDnGGe4qvduq.gucmMH1iAK2kGNx9GD6tRFOcMu6PBVZMab1.5vgi9JscmfvqUoPP4hX.UWfTd4ug.hIltRFVwubiIhXK+7qxe+49e792wx+z615N53LUxime9vEQnQsJ4FpNWvxKo273Q4Hc3Qibrwxvlk4AY6n7xbc+IiU.qkhe9iGqvoCGN5az9BfPKRBgdb16cUrIG6TfXrl3.H6O7u8JWeqa4O5mcue5IapPZy3LUxul++zrbKE5ZFA0w2xlmqegbpcOUb05WHtjd3vwPBcl.H.u1GLe7Vb0DQvoqjKrjZZk0ZUAcJ77lpsEB6Gbrwxvl8JggE2o5H9jk3vgi9Nct.XSJMl.ZpHXlPQPaFzAUAsTnP3hs2MaOhSMVtfhbtoEQsS7ygigL5bAPX0BRtLwIBp5rjxqXrVvEDOwRwd7QOeKf3UxpX2kDBhkXAfBndSD63updBVtLMuhwsJJurwtCwgCGCT5NBfvZ5JCizpDijLqAq+DuDJyiv736UlzrnUVHNckbrBih3mCk7HRNVi.bKhg4IGKevDftUsNmKgGNbLrR2S.DBFl.hFe1Ogp3I4apUamoRdD+Iarc6ZCphpQuN1edqhmLZDA6u4XixJdkhss1VkfwgUAiiBeGNbLTP2U.DVUDbJZp6rxyxdyZbl3cC5dBgsOpLNOV1R.gV74Uj3aos5OvEvSKDV+fNb3XHktu.Hz5XBBA0gWJuBsLytAwkqXeomeiv0+1b0CbFDYBv5AmfqLWb3XcB8FAPvNQPnJHS1RqACNeYXEJ.9ERdbBSJ0tJ9+ueWp8c9Ev+h2tcGit.95DNWdc3X8C8NAPH1t8HBpNGp2jrurks+7RdD+7gIvHYi0Ji2Cu6+OV46kF+4u2VL3CZ33zpHxTNq9b3X8G8VAvUoEc8wMHnbYlnspyu5ypKPXawEcJxHrHDNi.88JSsu9WB++xWLwWufqQyaINGNbLTS+Q.DRVs9o5rndSYsEgcBmZrbHdwW9NMhpUAoDo7mxkjCGNVeS+S.DRds9o5Bf2TjhY5osA2o2sZwMyR3KSQM+RNK9b3XiA8WAvU40pT.wepVVDw0ipyBdyzSDCOcg4MmkWcITYFvuTSG.BNb3XcICFAPHrGh8m.jIHoC1TUW.gxndkIEy2w8F7o28L.iElPix3SYD+xNQOGN1XyfS.bUltxn36OYGWmeASo5kY00DX0adzvEH8V0dbeywFE.WL8b33VKF7BfqRfPXw1xhvVhdX16cMY28b5vgi06z9KL5ca1c1EYu20j3IihJiGj.DGNb3n2wvi.3pr6rKyiksDO1ckCO49.8kCVuNb3vgitKoGz2.Mkf31MAvDAtHSAT+7HRd5YqHbNb33VEFtE.qm.wvoB+SPLCWgbgyyuft9XPN4Xb3vw5NFdRBR2joqjgZj6F++1NjTc3vgCGNb3vgCGNb3vgCGN13w+eGsXs9AznM0E.....IUjSD4pPfIH" ],
                                    "embed": 1,
                                    "forceaspect": 1,
                                    "id": "obj-34",
                                    "maxclass": "fpic",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "jit_matrix" ],
                                    "patching_rect": [ 10.0, 740.0, 145.45454545454547, 51.363636363636374 ],
                                    "pic": "Macintosh HD:/Users/david/Desktop/PixsperLogo.png"
                                }
                            },
                            {
                                "box": {
                                    "align": 0,
                                    "bgcolor": [ 0.290196, 0.309804, 0.301961, 0.0 ],
                                    "id": "obj-35",
                                    "maxclass": "textbutton",
                                    "numinlets": 1,
                                    "numoutlets": 3,
                                    "outlettype": [ "", "", "int" ],
                                    "parameter_enable": 0,
                                    "patching_rect": [ 169.0, 770.0, 81.0, 20.0 ],
                                    "text": "pixsper.com",
                                    "textjustification": 0,
                                    "textoncolor": [ 0.011765, 0.396078, 0.752941, 1.0 ],
                                    "underline": 1
                                }
                            },
                            {
                                "box": {
                                    "fontface": 1,
                                    "id": "obj-36",
                                    "maxclass": "comment",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 169.0, 750.0, 310.0, 20.0 ],
                                    "style": "helpfile_label",
                                    "text": "jit.ndi v0.3.3 by David Butler / Pixsper Ltd.",
                                    "textcolor": [ 0.85, 0.85, 0.85, 1.0 ]
                                }
                            },
                            {
                                "box": {
                                    "hidden": 1,
                                    "id": "obj-37",
                                    "linecount": 3,
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 580.0, 110.0, 116.0, 49.0 ],
                                    "text": ";\rmax launchbrowser https://ndi.video/"
                                }
                            },
                            {
                                "box": {
                                    "align": 0,
                                    "bgcolor": [ 0.290196, 0.309804, 0.301961, 0.0 ],
                                    "id": "obj-38",
                                    "maxclass": "textbutton",
                                    "numinlets": 1,
                                    "numoutlets": 3,
                                    "outlettype": [ "", "", "int" ],
                                    "parameter_enable": 0,
                                    "patching_rect": [ 580.0, 57.0, 110.0, 16.0 ],
                                    "text": "ndi.video",
                                    "textjustification": 0,
                                    "textoncolor": [ 0.011765, 0.396078, 0.752941, 1.0 ],
                                    "underline": 1
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-20",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "multichannelsignal" ],
                                    "patching_rect": [ 40.0, 510.0, 70.0, 22.0 ],
                                    "text": "mc.pack~ 2"
                                }
                            },
                            {
                                "box": {
                                    "bubble": 1,
                                    "bubbleside": 0,
                                    "fontname": "Arial",
                                    "fontsize": 13.0,
                                    "id": "obj-22",
                                    "linecount": 4,
                                    "maxclass": "comment",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 510.0, 640.0, 117.0, 84.0 ],
                                    "text": "This bpatcher shows the tally state over a video source"
                                }
                            },
                            {
                                "box": {
                                    "bgmode": 0,
                                    "border": 0,
                                    "clickthrough": 0,
                                    "embed": 1,
                                    "enablehscroll": 0,
                                    "enablevscroll": 0,
                                    "id": "obj-15",
                                    "lockeddragscroll": 0,
                                    "lockedsize": 0,
                                    "maxclass": "bpatcher",
                                    "numinlets": 2,
                                    "numoutlets": 0,
                                    "offset": [ 0.0, 0.0 ],
                                    "patcher": {
                                        "fileversion": 1,
                                        "appversion": {
                                            "major": 9,
                                            "minor": 1,
                                            "revision": 2,
                                            "architecture": "x64",
                                            "modernui": 1
                                        },
                                        "classnamespace": "box",
                                        "rect": [ 722.0, 408.0, 738.0, 473.0 ],
                                        "openinpresentation": 1,
                                        "gridonopen": 2,
                                        "gridsize": [ 10.0, 10.0 ],
                                        "gridsnaponopen": 2,
                                        "objectsnaponopen": 0,
                                        "boxes": [
                                            {
                                                "box": {
                                                    "comment": "Tally Messages",
                                                    "id": "obj-47",
                                                    "index": 2,
                                                    "maxclass": "inlet",
                                                    "numinlets": 0,
                                                    "numoutlets": 1,
                                                    "outlettype": [ "" ],
                                                    "patching_rect": [ 110.0, 10.0, 30.0, 30.0 ]
                                                }
                                            },
                                            {
                                                "box": {
                                                    "id": "obj-15",
                                                    "maxclass": "newobj",
                                                    "numinlets": 1,
                                                    "numoutlets": 2,
                                                    "outlettype": [ "bang", "int" ],
                                                    "patching_rect": [ 560.0, 140.0, 30.0, 22.0 ],
                                                    "text": "t b i"
                                                }
                                            },
                                            {
                                                "box": {
                                                    "id": "obj-14",
                                                    "maxclass": "newobj",
                                                    "numinlets": 2,
                                                    "numoutlets": 1,
                                                    "outlettype": [ "int" ],
                                                    "patching_rect": [ 540.0, 230.0, 35.0, 22.0 ],
                                                    "text": "== 0"
                                                }
                                            },
                                            {
                                                "box": {
                                                    "id": "obj-13",
                                                    "maxclass": "newobj",
                                                    "numinlets": 2,
                                                    "numoutlets": 1,
                                                    "outlettype": [ "int" ],
                                                    "patching_rect": [ 360.0, 230.0, 35.0, 22.0 ],
                                                    "text": "== 0"
                                                }
                                            },
                                            {
                                                "box": {
                                                    "id": "obj-12",
                                                    "maxclass": "newobj",
                                                    "numinlets": 2,
                                                    "numoutlets": 1,
                                                    "outlettype": [ "int" ],
                                                    "patching_rect": [ 180.0, 230.0, 35.0, 22.0 ],
                                                    "text": "== 0"
                                                }
                                            },
                                            {
                                                "box": {
                                                    "id": "obj-28",
                                                    "maxclass": "newobj",
                                                    "numinlets": 1,
                                                    "numoutlets": 2,
                                                    "outlettype": [ "bang", "int" ],
                                                    "patching_rect": [ 200.0, 140.0, 39.0, 22.0 ],
                                                    "text": "t b i"
                                                }
                                            },
                                            {
                                                "box": {
                                                    "id": "obj-29",
                                                    "maxclass": "newobj",
                                                    "numinlets": 2,
                                                    "numoutlets": 1,
                                                    "outlettype": [ "int" ],
                                                    "patching_rect": [ 220.0, 170.0, 35.0, 22.0 ],
                                                    "text": "== 0"
                                                }
                                            },
                                            {
                                                "box": {
                                                    "id": "obj-30",
                                                    "maxclass": "newobj",
                                                    "numinlets": 2,
                                                    "numoutlets": 1,
                                                    "outlettype": [ "int" ],
                                                    "patching_rect": [ 180.0, 200.0, 59.0, 22.0 ],
                                                    "text": "&& 1"
                                                }
                                            },
                                            {
                                                "box": {
                                                    "id": "obj-25",
                                                    "maxclass": "newobj",
                                                    "numinlets": 1,
                                                    "numoutlets": 2,
                                                    "outlettype": [ "bang", "int" ],
                                                    "patching_rect": [ 380.0, 140.0, 39.0, 22.0 ],
                                                    "text": "t b i"
                                                }
                                            },
                                            {
                                                "box": {
                                                    "id": "obj-22",
                                                    "maxclass": "newobj",
                                                    "numinlets": 2,
                                                    "numoutlets": 1,
                                                    "outlettype": [ "int" ],
                                                    "patching_rect": [ 400.0, 170.0, 35.0, 22.0 ],
                                                    "text": "== 0"
                                                }
                                            },
                                            {
                                                "box": {
                                                    "id": "obj-20",
                                                    "maxclass": "newobj",
                                                    "numinlets": 1,
                                                    "numoutlets": 1,
                                                    "outlettype": [ "" ],
                                                    "patching_rect": [ 180.0, 260.0, 94.0, 22.0 ],
                                                    "text": "prepend hidden"
                                                }
                                            },
                                            {
                                                "box": {
                                                    "id": "obj-18",
                                                    "maxclass": "newobj",
                                                    "numinlets": 1,
                                                    "numoutlets": 1,
                                                    "outlettype": [ "" ],
                                                    "patching_rect": [ 360.0, 260.0, 94.0, 22.0 ],
                                                    "text": "prepend hidden"
                                                }
                                            },
                                            {
                                                "box": {
                                                    "id": "obj-19",
                                                    "maxclass": "newobj",
                                                    "numinlets": 2,
                                                    "numoutlets": 1,
                                                    "outlettype": [ "int" ],
                                                    "patching_rect": [ 360.0, 200.0, 59.0, 22.0 ],
                                                    "text": "&& 1"
                                                }
                                            },
                                            {
                                                "box": {
                                                    "id": "obj-17",
                                                    "maxclass": "newobj",
                                                    "numinlets": 1,
                                                    "numoutlets": 1,
                                                    "outlettype": [ "" ],
                                                    "patching_rect": [ 540.0, 260.0, 94.0, 22.0 ],
                                                    "text": "prepend hidden"
                                                }
                                            },
                                            {
                                                "box": {
                                                    "id": "obj-11",
                                                    "maxclass": "newobj",
                                                    "numinlets": 2,
                                                    "numoutlets": 1,
                                                    "outlettype": [ "int" ],
                                                    "patching_rect": [ 540.0, 200.0, 59.0, 22.0 ],
                                                    "text": "&& 0"
                                                }
                                            },
                                            {
                                                "box": {
                                                    "angle": 270.0,
                                                    "bgcolor": [ 0.290196, 0.309804, 0.301961, 0.0 ],
                                                    "border": 5,
                                                    "bordercolor": [ 0.439216, 0.74902, 0.254902, 0.701961 ],
                                                    "hidden": 1,
                                                    "id": "obj-8",
                                                    "maxclass": "panel",
                                                    "mode": 0,
                                                    "numinlets": 1,
                                                    "numoutlets": 0,
                                                    "patching_rect": [ 545.0, 335.0, 150.0, 110.0 ],
                                                    "presentation": 1,
                                                    "presentation_rect": [ 5.0, 5.0, 150.0, 110.0 ],
                                                    "proportion": 0.39,
                                                    "rounded": 0
                                                }
                                            },
                                            {
                                                "box": {
                                                    "id": "obj-6",
                                                    "maxclass": "newobj",
                                                    "numinlets": 3,
                                                    "numoutlets": 3,
                                                    "outlettype": [ "", "", "" ],
                                                    "patching_rect": [ 120.0, 60.0, 213.0, 22.0 ],
                                                    "text": "route tally_onpreview tally_onprogram"
                                                }
                                            },
                                            {
                                                "box": {
                                                    "comment": "Matrix",
                                                    "id": "obj-5",
                                                    "index": 1,
                                                    "maxclass": "inlet",
                                                    "numinlets": 0,
                                                    "numoutlets": 1,
                                                    "outlettype": [ "jit_matrix" ],
                                                    "patching_rect": [ 10.0, 10.0, 30.0, 30.0 ]
                                                }
                                            },
                                            {
                                                "box": {
                                                    "angle": 270.0,
                                                    "bgcolor": [ 0.290196, 0.309804, 0.301961, 0.0 ],
                                                    "border": 5,
                                                    "bordercolor": [ 0.784314, 0.145098, 0.023529, 0.7 ],
                                                    "hidden": 1,
                                                    "id": "obj-2",
                                                    "maxclass": "panel",
                                                    "mode": 0,
                                                    "numinlets": 1,
                                                    "numoutlets": 0,
                                                    "patching_rect": [ 180.0, 330.0, 160.0, 120.0 ],
                                                    "presentation": 1,
                                                    "presentation_rect": [ 0.0, 0.0, 160.0, 120.0 ],
                                                    "proportion": 0.39,
                                                    "rounded": 0
                                                }
                                            },
                                            {
                                                "box": {
                                                    "angle": 270.0,
                                                    "bgcolor": [ 0.290196, 0.309804, 0.301961, 0.0 ],
                                                    "border": 5,
                                                    "bordercolor": [ 0.439216, 0.74902, 0.254902, 0.701961 ],
                                                    "hidden": 1,
                                                    "id": "obj-4",
                                                    "maxclass": "panel",
                                                    "mode": 0,
                                                    "numinlets": 1,
                                                    "numoutlets": 0,
                                                    "patching_rect": [ 360.0, 330.0, 160.0, 120.0 ],
                                                    "presentation": 1,
                                                    "presentation_rect": [ 0.0, 0.0, 160.0, 120.0 ],
                                                    "proportion": 0.39,
                                                    "rounded": 0
                                                }
                                            },
                                            {
                                                "box": {
                                                    "angle": 270.0,
                                                    "bgcolor": [ 0.290196, 0.309804, 0.301961, 0.0 ],
                                                    "border": 10,
                                                    "bordercolor": [ 0.439216, 0.74902, 0.254902, 0.701961 ],
                                                    "id": "obj-3",
                                                    "maxclass": "panel",
                                                    "mode": 0,
                                                    "numinlets": 1,
                                                    "numoutlets": 0,
                                                    "patching_rect": [ 0.0, 0.0, 4.0, 4.0 ],
                                                    "proportion": 0.39,
                                                    "rounded": 0
                                                }
                                            },
                                            {
                                                "box": {
                                                    "angle": 270.0,
                                                    "bgcolor": [ 0.290196, 0.309804, 0.301961, 0.0 ],
                                                    "border": 5,
                                                    "bordercolor": [ 0.784314, 0.145098, 0.023529, 0.7 ],
                                                    "hidden": 1,
                                                    "id": "obj-9",
                                                    "maxclass": "panel",
                                                    "mode": 0,
                                                    "numinlets": 1,
                                                    "numoutlets": 0,
                                                    "patching_rect": [ 540.0, 330.0, 160.0, 120.0 ],
                                                    "presentation": 1,
                                                    "presentation_rect": [ 0.0, 0.0, 160.0, 120.0 ],
                                                    "proportion": 0.39,
                                                    "rounded": 0
                                                }
                                            },
                                            {
                                                "box": {
                                                    "id": "obj-1",
                                                    "maxclass": "jit.pwindow",
                                                    "numinlets": 1,
                                                    "numoutlets": 2,
                                                    "outlettype": [ "jit_matrix", "" ],
                                                    "patching_rect": [ 10.0, 330.0, 160.0, 120.0 ],
                                                    "presentation": 1,
                                                    "presentation_rect": [ 0.0, 0.0, 160.0, 120.0 ],
                                                    "sync": 1
                                                }
                                            }
                                        ],
                                        "lines": [
                                            {
                                                "patchline": {
                                                    "destination": [ "obj-14", 0 ],
                                                    "source": [ "obj-11", 0 ]
                                                }
                                            },
                                            {
                                                "patchline": {
                                                    "destination": [ "obj-20", 0 ],
                                                    "source": [ "obj-12", 0 ]
                                                }
                                            },
                                            {
                                                "patchline": {
                                                    "destination": [ "obj-18", 0 ],
                                                    "source": [ "obj-13", 0 ]
                                                }
                                            },
                                            {
                                                "patchline": {
                                                    "destination": [ "obj-17", 0 ],
                                                    "source": [ "obj-14", 0 ]
                                                }
                                            },
                                            {
                                                "patchline": {
                                                    "destination": [ "obj-11", 1 ],
                                                    "source": [ "obj-15", 1 ]
                                                }
                                            },
                                            {
                                                "patchline": {
                                                    "destination": [ "obj-11", 0 ],
                                                    "source": [ "obj-15", 0 ]
                                                }
                                            },
                                            {
                                                "patchline": {
                                                    "destination": [ "obj-8", 0 ],
                                                    "order": 0,
                                                    "source": [ "obj-17", 0 ]
                                                }
                                            },
                                            {
                                                "patchline": {
                                                    "destination": [ "obj-9", 0 ],
                                                    "order": 1,
                                                    "source": [ "obj-17", 0 ]
                                                }
                                            },
                                            {
                                                "patchline": {
                                                    "destination": [ "obj-4", 0 ],
                                                    "source": [ "obj-18", 0 ]
                                                }
                                            },
                                            {
                                                "patchline": {
                                                    "destination": [ "obj-13", 0 ],
                                                    "source": [ "obj-19", 0 ]
                                                }
                                            },
                                            {
                                                "patchline": {
                                                    "destination": [ "obj-2", 0 ],
                                                    "source": [ "obj-20", 0 ]
                                                }
                                            },
                                            {
                                                "patchline": {
                                                    "destination": [ "obj-19", 1 ],
                                                    "source": [ "obj-22", 0 ]
                                                }
                                            },
                                            {
                                                "patchline": {
                                                    "destination": [ "obj-19", 0 ],
                                                    "source": [ "obj-25", 0 ]
                                                }
                                            },
                                            {
                                                "patchline": {
                                                    "destination": [ "obj-22", 0 ],
                                                    "source": [ "obj-25", 1 ]
                                                }
                                            },
                                            {
                                                "patchline": {
                                                    "destination": [ "obj-29", 0 ],
                                                    "source": [ "obj-28", 1 ]
                                                }
                                            },
                                            {
                                                "patchline": {
                                                    "destination": [ "obj-30", 0 ],
                                                    "source": [ "obj-28", 0 ]
                                                }
                                            },
                                            {
                                                "patchline": {
                                                    "destination": [ "obj-30", 1 ],
                                                    "source": [ "obj-29", 0 ]
                                                }
                                            },
                                            {
                                                "patchline": {
                                                    "destination": [ "obj-12", 0 ],
                                                    "source": [ "obj-30", 0 ]
                                                }
                                            },
                                            {
                                                "patchline": {
                                                    "destination": [ "obj-6", 0 ],
                                                    "source": [ "obj-47", 0 ]
                                                }
                                            },
                                            {
                                                "patchline": {
                                                    "destination": [ "obj-1", 0 ],
                                                    "source": [ "obj-5", 0 ]
                                                }
                                            },
                                            {
                                                "patchline": {
                                                    "destination": [ "obj-11", 0 ],
                                                    "midpoints": [ 129.5, 104.0, 549.5, 104.0 ],
                                                    "order": 0,
                                                    "source": [ "obj-6", 0 ]
                                                }
                                            },
                                            {
                                                "patchline": {
                                                    "destination": [ "obj-15", 0 ],
                                                    "midpoints": [ 226.5, 93.0, 569.5, 93.0 ],
                                                    "order": 0,
                                                    "source": [ "obj-6", 1 ]
                                                }
                                            },
                                            {
                                                "patchline": {
                                                    "destination": [ "obj-19", 0 ],
                                                    "midpoints": [ 129.5, 104.0, 369.5, 104.0 ],
                                                    "order": 1,
                                                    "source": [ "obj-6", 0 ]
                                                }
                                            },
                                            {
                                                "patchline": {
                                                    "destination": [ "obj-25", 0 ],
                                                    "midpoints": [ 226.5, 94.0, 389.5, 94.0 ],
                                                    "order": 1,
                                                    "source": [ "obj-6", 1 ]
                                                }
                                            },
                                            {
                                                "patchline": {
                                                    "destination": [ "obj-28", 0 ],
                                                    "midpoints": [ 129.5, 103.0, 209.5, 103.0 ],
                                                    "order": 2,
                                                    "source": [ "obj-6", 0 ]
                                                }
                                            },
                                            {
                                                "patchline": {
                                                    "destination": [ "obj-30", 0 ],
                                                    "midpoints": [ 226.5, 92.0, 189.5, 92.0 ],
                                                    "order": 2,
                                                    "source": [ "obj-6", 1 ]
                                                }
                                            }
                                        ]
                                    },
                                    "patching_rect": [ 480.0, 510.0, 160.0, 120.0 ],
                                    "viewvisibility": 1
                                }
                            },
                            {
                                "box": {
                                    "hidden": 1,
                                    "id": "obj-30",
                                    "linecount": 3,
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 560.0, 660.0, 110.0, 49.0 ],
                                    "text": ";\rmax launchbrowser $1"
                                }
                            },
                            {
                                "box": {
                                    "hidden": 1,
                                    "id": "obj-32",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 2,
                                    "outlettype": [ "", "" ],
                                    "patching_rect": [ 560.0, 630.0, 95.0, 22.0 ],
                                    "text": "route runtimeurl"
                                }
                            },
                            {
                                "box": {
                                    "hidden": 1,
                                    "id": "obj-19",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 340.0, 40.0, 81.0, 22.0 ],
                                    "text": "getruntimeurl"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-33",
                                    "linecount": 2,
                                    "maxclass": "comment",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 20.0, 254.0, 540.0, 33.0 ],
                                    "style": "helpfile_label",
                                    "text": "This object requires NDI Runtime or NDI Tools to be installed in order to function. Please download from the link in the top right."
                                }
                            },
                            {
                                "box": {
                                    "angle": 270.0,
                                    "bgcolor": [ 0.784314, 0.145098, 0.023529, 0.36 ],
                                    "id": "obj-10",
                                    "maxclass": "panel",
                                    "mode": 0,
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 10.0, 250.0, 560.0, 40.0 ],
                                    "proportion": 0.39,
                                    "rounded": 20
                                }
                            },
                            {
                                "box": {
                                    "align": 0,
                                    "bgcolor": [ 0.290196, 0.309804, 0.301961, 0.0 ],
                                    "id": "obj-31",
                                    "maxclass": "textbutton",
                                    "numinlets": 1,
                                    "numoutlets": 3,
                                    "outlettype": [ "", "", "int" ],
                                    "parameter_enable": 0,
                                    "patching_rect": [ 580.0, 10.0, 140.0, 20.0 ],
                                    "text": "Download NDI Runtime",
                                    "textjustification": 0,
                                    "textoncolor": [ 0.011765, 0.396078, 0.752941, 1.0 ],
                                    "underline": 1
                                }
                            },
                            {
                                "box": {
                                    "align": 0,
                                    "bgcolor": [ 0.290196, 0.309804, 0.301961, 0.0 ],
                                    "id": "obj-29",
                                    "maxclass": "textbutton",
                                    "numinlets": 1,
                                    "numoutlets": 3,
                                    "outlettype": [ "", "", "int" ],
                                    "parameter_enable": 0,
                                    "patching_rect": [ 580.0, 34.0, 110.0, 16.0 ],
                                    "text": "NDI Tools",
                                    "textjustification": 0,
                                    "textoncolor": [ 0.011765, 0.396078, 0.752941, 1.0 ],
                                    "underline": 1
                                }
                            },
                            {
                                "box": {
                                    "hidden": 1,
                                    "id": "obj-28",
                                    "linecount": 2,
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 340.0, 80.0, 232.0, 35.0 ],
                                    "text": ";\rmax launchbrowser https://ndi.video/tools/"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-5",
                                    "linecount": 3,
                                    "maxclass": "comment",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 396.0, 350.0, 279.0, 47.0 ],
                                    "style": "helpfile_label",
                                    "text": "Open an NDI receiver on the local network (Studio Monitor is available as part of Newtek NDI Tools) and browse for the source name. "
                                }
                            },
                            {
                                "box": {
                                    "bubble": 1,
                                    "fontname": "Arial",
                                    "fontsize": 13.0,
                                    "id": "obj-17",
                                    "linecount": 3,
                                    "maxclass": "comment",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 325.0, 652.0, 160.0, 54.0 ],
                                    "text": "Tally status attributes are output via dump outlet when changed"
                                }
                            },
                            {
                                "box": {
                                    "bubble": 1,
                                    "fontname": "Arial",
                                    "fontsize": 13.0,
                                    "id": "obj-13",
                                    "linecount": 6,
                                    "maxclass": "comment",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 295.0, 470.0, 153.0, 98.0 ],
                                    "text": "Video is sent at a fixed framerate which is not connected to the rate at which matrix messages are sent to the object."
                                }
                            },
                            {
                                "box": {
                                    "attr": "framerate",
                                    "id": "obj-8",
                                    "lock": 1,
                                    "maxclass": "attrui",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "parameter_enable": 0,
                                    "patching_rect": [ 130.0, 510.0, 160.0, 22.0 ]
                                }
                            },
                            {
                                "box": {
                                    "border": 0,
                                    "filename": "helpargs.js",
                                    "id": "obj-4",
                                    "ignoreclick": 1,
                                    "jsarguments": [ "jit.ndi.send~" ],
                                    "maxclass": "jsui",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "parameter_enable": 0,
                                    "patching_rect": [ 200.0, 580.0, 170.31349182128906, 39.0 ]
                                }
                            },
                            {
                                "box": {
                                    "bubble": 1,
                                    "fontname": "Arial",
                                    "fontsize": 13.0,
                                    "id": "obj-27",
                                    "maxclass": "comment",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 190.0, 700.0, 100.0, 25.0 ],
                                    "text": "On Program"
                                }
                            },
                            {
                                "box": {
                                    "bubble": 1,
                                    "fontname": "Arial",
                                    "fontsize": 13.0,
                                    "id": "obj-51",
                                    "maxclass": "comment",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 50.0, 700.0, 100.0, 25.0 ],
                                    "text": "On Preview"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-26",
                                    "linecount": 2,
                                    "maxclass": "comment",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 396.0, 304.0, 210.0, 33.0 ],
                                    "style": "helpfile_label",
                                    "text": "Switch audio processing on to send audio."
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-25",
                                    "maxclass": "comment",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 76.0, 310.0, 210.0, 20.0 ],
                                    "style": "helpfile_label",
                                    "text": "Toggle on qmetro"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-56",
                                    "linecount": 2,
                                    "maxclass": "comment",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 210.0, 380.0, 126.0, 33.0 ],
                                    "style": "helpfile_label",
                                    "text": "Start a movie playing as a test source"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-23",
                                    "maxclass": "ezdac~",
                                    "numinlets": 2,
                                    "numoutlets": 0,
                                    "patching_rect": [ 310.0, 310.0, 45.0, 45.0 ]
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-18",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 40.0, 390.0, 89.0, 22.0 ],
                                    "text": "read bball.mov"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-16",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 140.0, 390.0, 35.0, 22.0 ],
                                    "text": "read"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-14",
                                    "maxclass": "toggle",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "int" ],
                                    "parameter_enable": 0,
                                    "patching_rect": [ 20.0, 310.0, 24.0, 24.0 ]
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-12",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "bang" ],
                                    "patching_rect": [ 20.0, 350.0, 81.0, 22.0 ],
                                    "text": "qmetro 30 hz"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-11",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 4,
                                    "outlettype": [ "signal", "signal", "jit_matrix", "" ],
                                    "patching_rect": [ 20.0, 430.0, 62.0, 22.0 ],
                                    "text": "jit.movie~"
                                }
                            },
                            {
                                "box": {
                                    "checkedcolor": [ 0.784314, 0.145098, 0.023529, 1.0 ],
                                    "id": "obj-7",
                                    "ignoreclick": 1,
                                    "maxclass": "toggle",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "int" ],
                                    "parameter_enable": 0,
                                    "patching_rect": [ 160.0, 700.0, 24.0, 24.0 ]
                                }
                            },
                            {
                                "box": {
                                    "checkedcolor": [ 0.439216, 0.74902, 0.254902, 1.0 ],
                                    "id": "obj-6",
                                    "ignoreclick": 1,
                                    "maxclass": "toggle",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "int" ],
                                    "parameter_enable": 0,
                                    "patching_rect": [ 20.0, 700.0, 24.0, 24.0 ]
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-3",
                                    "maxclass": "newobj",
                                    "numinlets": 3,
                                    "numoutlets": 3,
                                    "outlettype": [ "", "", "" ],
                                    "patching_rect": [ 20.0, 670.0, 298.0, 22.0 ],
                                    "text": "route tally_onpreview tally_onprogram"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-1",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 20.0, 580.0, 158.0, 22.0 ],
                                    "text": "jit.ndi.send~ MaxNDISender"
                                }
                            },
                            {
                                "box": {
                                    "border": 0,
                                    "filename": "helpdetails.js",
                                    "id": "obj-2",
                                    "ignoreclick": 1,
                                    "jsarguments": [ "jit.ndi.send~", 87 ],
                                    "maxclass": "jsui",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "parameter_enable": 0,
                                    "patching_rect": [ 10.0, 10.0, 560.0, 230.0 ]
                                }
                            },
                            {
                                "box": {
                                    "background": 1,
                                    "bgcolor": [ 1.0, 0.788235, 0.470588, 1.0 ],
                                    "fontface": 1,
                                    "hint": "",
                                    "id": "obj-24",
                                    "ignoreclick": 1,
                                    "legacytextcolor": 1,
                                    "maxclass": "textbutton",
                                    "numinlets": 1,
                                    "numoutlets": 3,
                                    "outlettype": [ "", "", "int" ],
                                    "parameter_enable": 0,
                                    "patching_rect": [ 376.0, 310.0, 20.0, 20.0 ],
                                    "rounded": 60.0,
                                    "text": "3",
                                    "textcolor": [ 0.34902, 0.34902, 0.34902, 1.0 ]
                                }
                            },
                            {
                                "box": {
                                    "background": 1,
                                    "bgcolor": [ 1.0, 0.788235, 0.470588, 1.0 ],
                                    "fontface": 1,
                                    "hint": "",
                                    "id": "obj-9",
                                    "ignoreclick": 1,
                                    "legacytextcolor": 1,
                                    "maxclass": "textbutton",
                                    "numinlets": 1,
                                    "numoutlets": 3,
                                    "outlettype": [ "", "", "int" ],
                                    "parameter_enable": 0,
                                    "patching_rect": [ 376.0, 360.0, 20.0, 20.0 ],
                                    "rounded": 60.0,
                                    "text": "4",
                                    "textcolor": [ 0.34902, 0.34902, 0.34902, 1.0 ]
                                }
                            },
                            {
                                "box": {
                                    "background": 1,
                                    "bgcolor": [ 1.0, 0.788235, 0.470588, 1.0 ],
                                    "fontface": 1,
                                    "hint": "",
                                    "id": "obj-21",
                                    "ignoreclick": 1,
                                    "legacytextcolor": 1,
                                    "maxclass": "textbutton",
                                    "numinlets": 1,
                                    "numoutlets": 3,
                                    "outlettype": [ "", "", "int" ],
                                    "parameter_enable": 0,
                                    "patching_rect": [ 190.0, 390.0, 20.0, 20.0 ],
                                    "rounded": 60.0,
                                    "text": "1",
                                    "textcolor": [ 0.34902, 0.34902, 0.34902, 1.0 ]
                                }
                            },
                            {
                                "box": {
                                    "background": 1,
                                    "bgcolor": [ 1.0, 0.788235, 0.470588, 1.0 ],
                                    "fontface": 1,
                                    "hint": "",
                                    "id": "obj-50",
                                    "ignoreclick": 1,
                                    "legacytextcolor": 1,
                                    "maxclass": "textbutton",
                                    "numinlets": 1,
                                    "numoutlets": 3,
                                    "outlettype": [ "", "", "int" ],
                                    "parameter_enable": 0,
                                    "patching_rect": [ 56.0, 310.0, 20.0, 20.0 ],
                                    "rounded": 60.0,
                                    "text": "2",
                                    "textcolor": [ 0.34902, 0.34902, 0.34902, 1.0 ]
                                }
                            }
                        ],
                        "lines": [
                            {
                                "patchline": {
                                    "destination": [ "obj-15", 1 ],
                                    "midpoints": [ 29.5, 642.0, 453.0, 642.0, 453.0, 482.0, 630.5, 482.0 ],
                                    "order": 1,
                                    "source": [ "obj-1", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-3", 0 ],
                                    "order": 2,
                                    "source": [ "obj-1", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-32", 0 ],
                                    "hidden": 1,
                                    "order": 0,
                                    "source": [ "obj-1", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-1", 0 ],
                                    "midpoints": [ 58.16666666666667, 496.0, 29.5, 496.0 ],
                                    "order": 0,
                                    "source": [ "obj-11", 2 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-15", 0 ],
                                    "midpoints": [ 58.16666666666667, 459.0, 489.5, 459.0 ],
                                    "order": 1,
                                    "source": [ "obj-11", 2 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-20", 1 ],
                                    "midpoints": [ 43.833333333333336, 472.0, 100.5, 472.0 ],
                                    "source": [ "obj-11", 1 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-20", 0 ],
                                    "midpoints": [ 29.5, 483.0, 49.5, 483.0 ],
                                    "source": [ "obj-11", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-11", 0 ],
                                    "source": [ "obj-12", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-12", 0 ],
                                    "source": [ "obj-14", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-11", 0 ],
                                    "midpoints": [ 149.5, 423.0, 29.5, 423.0 ],
                                    "source": [ "obj-16", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-11", 0 ],
                                    "source": [ "obj-18", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-1", 0 ],
                                    "hidden": 1,
                                    "source": [ "obj-19", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-1", 0 ],
                                    "midpoints": [ 49.5, 550.0, 29.5, 550.0 ],
                                    "source": [ "obj-20", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-28", 0 ],
                                    "hidden": 1,
                                    "source": [ "obj-29", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-6", 0 ],
                                    "source": [ "obj-3", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-7", 0 ],
                                    "source": [ "obj-3", 1 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-19", 0 ],
                                    "hidden": 1,
                                    "source": [ "obj-31", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-30", 0 ],
                                    "hidden": 1,
                                    "source": [ "obj-32", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-37", 0 ],
                                    "hidden": 1,
                                    "source": [ "obj-38", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-1", 0 ],
                                    "midpoints": [ 139.5, 570.0, 29.5, 570.0 ],
                                    "source": [ "obj-8", 0 ]
                                }
                            }
                        ],
                        "styles": [
                            {
                                "name": "AudioStatus_Menu",
                                "default": {
                                    "bgfillcolor": {
                                        "angle": 270.0,
                                        "autogradient": 0,
                                        "color": [ 0.294118, 0.313726, 0.337255, 1 ],
                                        "color1": [ 0.454902, 0.462745, 0.482353, 0.0 ],
                                        "color2": [ 0.290196, 0.309804, 0.301961, 1.0 ],
                                        "proportion": 0.39,
                                        "type": "color"
                                    }
                                },
                                "parentstyle": "",
                                "multi": 0
                            }
                        ]
                    },
                    "patching_rect": [ 10.0, 80.0, 49.0, 22.0 ],
                    "text": "p basic",
                    "varname": "basic_tab"
                }
            },
            {
                "box": {
                    "border": 0,
                    "filename": "helpname.js",
                    "id": "obj-8",
                    "ignoreclick": 1,
                    "jsarguments": [ "jit.matrix" ],
                    "maxclass": "jsui",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 10.0, 10.0, 189.70399475097656, 57.599853515625 ]
                }
            },
            {
                "box": {
                    "id": "obj-9",
                    "maxclass": "newobj",
                    "numinlets": 0,
                    "numoutlets": 0,
                    "patcher": {
                        "fileversion": 1,
                        "appversion": {
                            "major": 9,
                            "minor": 1,
                            "revision": 2,
                            "architecture": "x64",
                            "modernui": 1
                        },
                        "classnamespace": "box",
                        "rect": [ 0.0, 26.0, 730.0, 809.0 ],
                        "showontab": 1,
                        "boxes": [],
                        "lines": []
                    },
                    "patching_rect": [ 205.0, 205.0, 50.0, 22.0 ],
                    "text": "p ?",
                    "varname": "q_tab"
                }
            },
            {
                "box": {
                    "border": 0,
                    "filename": "helpname.js",
                    "id": "obj-6",
                    "ignoreclick": 1,
                    "jsarguments": [ "jit.ndi.send~" ],
                    "maxclass": "jsui",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 10.0, 10.0, 260.7200012207031, 57.599853515625 ]
                }
            },
            {
                "box": {
                    "border": 0,
                    "filename": "helpname.js",
                    "id": "obj-10",
                    "ignoreclick": 1,
                    "jsarguments": [ "jit.ndi.send~" ],
                    "maxclass": "jsui",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 10.0, 10.0, 260.7200012207031, 57.599853515625 ]
                }
            }
        ],
        "lines": [],
        "autosave": 0,
        "styles": [
            {
                "name": "AudioStatus_Menu",
                "default": {
                    "bgfillcolor": {
                        "angle": 270.0,
                        "autogradient": 0,
                        "color": [ 0.294118, 0.313726, 0.337255, 1 ],
                        "color1": [ 0.454902, 0.462745, 0.482353, 0.0 ],
                        "color2": [ 0.290196, 0.309804, 0.301961, 1.0 ],
                        "proportion": 0.39,
                        "type": "color"
                    }
                },
                "parentstyle": "",
                "multi": 0
            }
        ]
    }
}