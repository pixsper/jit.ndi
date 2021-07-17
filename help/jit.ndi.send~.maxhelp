{
	"patcher" : 	{
		"fileversion" : 1,
		"appversion" : 		{
			"major" : 8,
			"minor" : 1,
			"revision" : 11,
			"architecture" : "x64",
			"modernui" : 1
		}
,
		"classnamespace" : "box",
		"rect" : [ 1188.0, 337.0, 687.0, 835.0 ],
		"bglocked" : 0,
		"openinpresentation" : 0,
		"default_fontsize" : 12.0,
		"default_fontface" : 0,
		"default_fontname" : "Arial",
		"gridonopen" : 2,
		"gridsize" : [ 10.0, 10.0 ],
		"gridsnaponopen" : 2,
		"objectsnaponopen" : 0,
		"statusbarvisible" : 2,
		"toolbarvisible" : 1,
		"lefttoolbarpinned" : 0,
		"toptoolbarpinned" : 0,
		"righttoolbarpinned" : 0,
		"bottomtoolbarpinned" : 0,
		"toolbars_unpinned_last_save" : 0,
		"tallnewobj" : 0,
		"boxanimatetime" : 200,
		"enablehscroll" : 1,
		"enablevscroll" : 1,
		"devicewidth" : 0.0,
		"description" : "",
		"digest" : "",
		"tags" : "",
		"style" : "",
		"subpatcher_template" : "",
		"showrootpatcherontab" : 0,
		"showontab" : 0,
		"assistshowspatchername" : 0,
		"boxes" : [ 			{
				"box" : 				{
					"id" : "obj-3",
					"maxclass" : "newobj",
					"numinlets" : 0,
					"numoutlets" : 0,
					"patcher" : 					{
						"fileversion" : 1,
						"appversion" : 						{
							"major" : 8,
							"minor" : 1,
							"revision" : 11,
							"architecture" : "x64",
							"modernui" : 1
						}
,
						"classnamespace" : "box",
						"rect" : [ 0.0, 26.0, 687.0, 809.0 ],
						"bglocked" : 0,
						"openinpresentation" : 0,
						"default_fontsize" : 12.0,
						"default_fontface" : 0,
						"default_fontname" : "Arial",
						"gridonopen" : 2,
						"gridsize" : [ 10.0, 10.0 ],
						"gridsnaponopen" : 2,
						"objectsnaponopen" : 0,
						"statusbarvisible" : 2,
						"toolbarvisible" : 1,
						"lefttoolbarpinned" : 0,
						"toptoolbarpinned" : 0,
						"righttoolbarpinned" : 0,
						"bottomtoolbarpinned" : 0,
						"toolbars_unpinned_last_save" : 0,
						"tallnewobj" : 0,
						"boxanimatetime" : 200,
						"enablehscroll" : 1,
						"enablevscroll" : 1,
						"devicewidth" : 0.0,
						"description" : "",
						"digest" : "",
						"tags" : "",
						"style" : "",
						"subpatcher_template" : "",
						"showontab" : 1,
						"assistshowspatchername" : 0,
						"boxes" : [ 							{
								"box" : 								{
									"id" : "obj-2",
									"maxclass" : "newobj",
									"numinlets" : 4,
									"numoutlets" : 4,
									"outlettype" : [ "", "", "", "" ],
									"patching_rect" : [ 40.0, 550.0, 291.0, 22.0 ],
									"text" : "route kvm_mousestate kvm_mouse_x kvm_mouse_y"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-14",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 40.0, 600.0, 98.0, 22.0 ],
									"text" : "touch 0 $1 $2 $3"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-6",
									"maxclass" : "jit.pwindow",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "jit_matrix", "" ],
									"patching_rect" : [ 80.0, 360.0, 160.0, 120.0 ]
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-11",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "jit_matrix", "" ],
									"patching_rect" : [ 40.0, 310.0, 53.0, 22.0 ],
									"text" : "jit.matrix"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-9",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "jit_gl_texture", "" ],
									"patching_rect" : [ 350.0, 130.0, 180.0, 22.0 ],
									"text" : "jit.gl.camera @position 0 0 15"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-8",
									"maxclass" : "toggle",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "int" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 40.0, 115.5, 24.0, 24.0 ]
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-4",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 3,
									"outlettype" : [ "jit_matrix", "bang", "" ],
									"patching_rect" : [ 40.0, 200.0, 254.0, 22.0 ],
									"text" : "jit.world @fps 30 @output_matrix 1 @visible 0"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-20",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"patching_rect" : [ 80.0, 160.0, 127.0, 22.0 ],
									"text" : "jit.gl.handle @radius 3"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-17",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"patching_rect" : [ 350.0, 280.0, 93.0, 22.0 ],
									"text" : "jit.phys.body"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-16",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"patching_rect" : [ 350.0, 250.0, 93.0, 22.0 ],
									"text" : "jit.phys.body"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-15",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"patching_rect" : [ 350.0, 220.0, 93.0, 22.0 ],
									"text" : "jit.phys.body"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-23",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"patching_rect" : [ 40.0, 640.0, 157.0, 22.0 ],
									"text" : "jit.phys.picker @dynamics 1"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-12",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 350.0, 160.0, 146.0, 22.0 ],
									"text" : "jit.gl.physdraw @enable 1"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-10",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"patching_rect" : [ 350.0, 190.0, 93.0, 22.0 ],
									"text" : "jit.phys.body"
								}

							}
, 							{
								"box" : 								{
									"border" : 0,
									"filename" : "helpname.js",
									"id" : "obj-5",
									"ignoreclick" : 1,
									"jsarguments" : [ "jit.ndi.send~" ],
									"maxclass" : "jsui",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 10.0, 10.0, 260.720001220703125, 57.600002288818359 ]
								}

							}
, 							{
								"box" : 								{
									"background" : 1,
									"bgcolor" : [ 1.0, 0.788235, 0.470588, 1.0 ],
									"bgoncolor" : [ 0.55, 0.55, 0.55, 1.0 ],
									"fontname" : "Arial Bold",
									"hint" : "",
									"id" : "obj-93",
									"ignoreclick" : 1,
									"legacytextcolor" : 1,
									"maxclass" : "textbutton",
									"numinlets" : 1,
									"numoutlets" : 3,
									"outlettype" : [ "", "", "int" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 66.0, 119.5, 20.0, 20.0 ],
									"rounded" : 60.0,
									"text" : "1",
									"textcolor" : [ 0.34902, 0.34902, 0.34902, 1.0 ],
									"textoncolor" : [ 1.0, 1.0, 1.0, 1.0 ],
									"textovercolor" : [ 0.2, 0.2, 0.2, 1.0 ],
									"usebgoncolor" : 1,
									"usetextovercolor" : 1
								}

							}
 ],
						"lines" : [ 							{
								"patchline" : 								{
									"destination" : [ "obj-6", 0 ],
									"midpoints" : [ 49.5, 344.0, 89.5, 344.0 ],
									"source" : [ "obj-11", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-23", 0 ],
									"source" : [ "obj-14", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-4", 0 ],
									"source" : [ "obj-20", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-11", 0 ],
									"source" : [ "obj-4", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-4", 0 ],
									"source" : [ "obj-8", 0 ]
								}

							}
 ],
						"styles" : [ 							{
								"name" : "AudioStatus_Menu",
								"default" : 								{
									"bgfillcolor" : 									{
										"type" : "color",
										"color" : [ 0.294118, 0.313726, 0.337255, 1 ],
										"color1" : [ 0.454902, 0.462745, 0.482353, 0.0 ],
										"color2" : [ 0.290196, 0.309804, 0.301961, 1.0 ],
										"angle" : 270.0,
										"proportion" : 0.39,
										"autogradient" : 0
									}

								}
,
								"parentstyle" : "",
								"multi" : 0
							}
 ]
					}
,
					"patching_rect" : [ 70.0, 200.0, 41.0, 22.0 ],
					"saved_object_attributes" : 					{
						"description" : "",
						"digest" : "",
						"globalpatchername" : "",
						"tags" : ""
					}
,
					"text" : "p kvm",
					"varname" : "ptz[1]"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-2",
					"maxclass" : "newobj",
					"numinlets" : 0,
					"numoutlets" : 0,
					"patcher" : 					{
						"fileversion" : 1,
						"appversion" : 						{
							"major" : 8,
							"minor" : 1,
							"revision" : 11,
							"architecture" : "x64",
							"modernui" : 1
						}
,
						"classnamespace" : "box",
						"rect" : [ 0.0, 26.0, 687.0, 809.0 ],
						"bglocked" : 0,
						"openinpresentation" : 0,
						"default_fontsize" : 12.0,
						"default_fontface" : 0,
						"default_fontname" : "Arial",
						"gridonopen" : 2,
						"gridsize" : [ 10.0, 10.0 ],
						"gridsnaponopen" : 2,
						"objectsnaponopen" : 0,
						"statusbarvisible" : 2,
						"toolbarvisible" : 1,
						"lefttoolbarpinned" : 0,
						"toptoolbarpinned" : 0,
						"righttoolbarpinned" : 0,
						"bottomtoolbarpinned" : 0,
						"toolbars_unpinned_last_save" : 0,
						"tallnewobj" : 0,
						"boxanimatetime" : 200,
						"enablehscroll" : 1,
						"enablevscroll" : 1,
						"devicewidth" : 0.0,
						"description" : "",
						"digest" : "",
						"tags" : "",
						"style" : "",
						"subpatcher_template" : "",
						"showontab" : 1,
						"assistshowspatchername" : 0,
						"boxes" : [ 							{
								"box" : 								{
									"id" : "obj-12",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 360.0, 150.0, 60.0, 22.0 ],
									"text" : "loadmess"
								}

							}
, 							{
								"box" : 								{
									"hidden" : 1,
									"id" : "obj-18",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 550.0, 610.0, 90.0, 22.0 ],
									"text" : "loadmess 5000"
								}

							}
, 							{
								"box" : 								{
									"bubble" : 1,
									"bubbleside" : 3,
									"fontname" : "Arial",
									"fontsize" : 13.0,
									"id" : "obj-68",
									"linecount" : 2,
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 406.0, 670.0, 130.0, 40.0 ],
									"text" : "Fade time multiplier (ms)"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-66",
									"maxclass" : "newobj",
									"numinlets" : 3,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patcher" : 									{
										"fileversion" : 1,
										"appversion" : 										{
											"major" : 8,
											"minor" : 1,
											"revision" : 11,
											"architecture" : "x64",
											"modernui" : 1
										}
,
										"classnamespace" : "box",
										"rect" : [ 646.0, 382.0, 640.0, 676.0 ],
										"bglocked" : 0,
										"openinpresentation" : 0,
										"default_fontsize" : 12.0,
										"default_fontface" : 0,
										"default_fontname" : "Arial",
										"gridonopen" : 2,
										"gridsize" : [ 10.0, 10.0 ],
										"gridsnaponopen" : 2,
										"objectsnaponopen" : 0,
										"statusbarvisible" : 2,
										"toolbarvisible" : 1,
										"lefttoolbarpinned" : 0,
										"toptoolbarpinned" : 0,
										"righttoolbarpinned" : 0,
										"bottomtoolbarpinned" : 0,
										"toolbars_unpinned_last_save" : 0,
										"tallnewobj" : 0,
										"boxanimatetime" : 200,
										"enablehscroll" : 1,
										"enablevscroll" : 1,
										"devicewidth" : 0.0,
										"description" : "",
										"digest" : "",
										"tags" : "",
										"style" : "",
										"subpatcher_template" : "",
										"assistshowspatchername" : 0,
										"boxes" : [ 											{
												"box" : 												{
													"id" : "obj-7",
													"maxclass" : "newobj",
													"numinlets" : 2,
													"numoutlets" : 1,
													"outlettype" : [ "float" ],
													"patching_rect" : [ 210.0, 220.0, 29.5, 22.0 ],
													"text" : "!- 1."
												}

											}
, 											{
												"box" : 												{
													"id" : "obj-50",
													"maxclass" : "newobj",
													"numinlets" : 2,
													"numoutlets" : 1,
													"outlettype" : [ "int" ],
													"patching_rect" : [ 90.0, 130.0, 29.5, 22.0 ],
													"text" : "+ 1"
												}

											}
, 											{
												"box" : 												{
													"id" : "obj-49",
													"maxclass" : "newobj",
													"numinlets" : 3,
													"numoutlets" : 1,
													"outlettype" : [ "" ],
													"patching_rect" : [ 20.0, 560.0, 62.0, 22.0 ],
													"text" : "switch 2 1"
												}

											}
, 											{
												"box" : 												{
													"id" : "obj-46",
													"maxclass" : "newobj",
													"numinlets" : 1,
													"numoutlets" : 1,
													"outlettype" : [ "" ],
													"patching_rect" : [ 330.0, 510.0, 85.0, 22.0 ],
													"text" : "prepend recall"
												}

											}
, 											{
												"box" : 												{
													"id" : "obj-45",
													"maxclass" : "newobj",
													"numinlets" : 2,
													"numoutlets" : 1,
													"outlettype" : [ "int" ],
													"patching_rect" : [ 90.0, 100.0, 36.0, 22.0 ],
													"text" : ">= 1."
												}

											}
, 											{
												"box" : 												{
													"id" : "obj-39",
													"maxclass" : "newobj",
													"numinlets" : 2,
													"numoutlets" : 1,
													"outlettype" : [ "" ],
													"patching_rect" : [ 210.0, 190.0, 42.0, 22.0 ],
													"text" : "gate 1"
												}

											}
, 											{
												"box" : 												{
													"id" : "obj-33",
													"maxclass" : "newobj",
													"numinlets" : 1,
													"numoutlets" : 2,
													"outlettype" : [ "float", "float" ],
													"patching_rect" : [ 170.0, 60.0, 29.5, 22.0 ],
													"text" : "t f f"
												}

											}
, 											{
												"box" : 												{
													"id" : "obj-32",
													"maxclass" : "newobj",
													"numinlets" : 2,
													"numoutlets" : 1,
													"outlettype" : [ "int" ],
													"patching_rect" : [ 190.0, 100.0, 29.5, 22.0 ],
													"text" : "< 1."
												}

											}
, 											{
												"box" : 												{
													"id" : "obj-25",
													"maxclass" : "newobj",
													"numinlets" : 2,
													"numoutlets" : 1,
													"outlettype" : [ "float" ],
													"patching_rect" : [ 210.0, 310.0, 29.5, 22.0 ],
													"text" : "f"
												}

											}
, 											{
												"box" : 												{
													"id" : "obj-24",
													"maxclass" : "newobj",
													"numinlets" : 1,
													"numoutlets" : 2,
													"outlettype" : [ "", "int" ],
													"patching_rect" : [ 210.0, 390.0, 29.5, 22.0 ],
													"text" : "t l 0"
												}

											}
, 											{
												"box" : 												{
													"id" : "obj-23",
													"maxclass" : "newobj",
													"numinlets" : 1,
													"numoutlets" : 1,
													"outlettype" : [ "" ],
													"patching_rect" : [ 210.0, 350.0, 63.0, 22.0 ],
													"text" : "prepend 1"
												}

											}
, 											{
												"box" : 												{
													"id" : "obj-14",
													"maxclass" : "newobj",
													"numinlets" : 2,
													"numoutlets" : 1,
													"outlettype" : [ "float" ],
													"patching_rect" : [ 210.0, 250.0, 59.0, 22.0 ],
													"text" : "* 0."
												}

											}
, 											{
												"box" : 												{
													"id" : "obj-13",
													"maxclass" : "newobj",
													"numinlets" : 1,
													"numoutlets" : 4,
													"outlettype" : [ "bang", "int", "int", "bang" ],
													"patching_rect" : [ 40.0, 240.0, 50.5, 22.0 ],
													"text" : "t b i i b"
												}

											}
, 											{
												"box" : 												{
													"id" : "obj-12",
													"maxclass" : "newobj",
													"numinlets" : 2,
													"numoutlets" : 1,
													"outlettype" : [ "int" ],
													"patching_rect" : [ 120.0, 390.0, 29.5, 22.0 ],
													"text" : "i"
												}

											}
, 											{
												"box" : 												{
													"id" : "obj-9",
													"maxclass" : "newobj",
													"numinlets" : 3,
													"numoutlets" : 1,
													"outlettype" : [ "" ],
													"patching_rect" : [ 40.0, 470.0, 190.0, 22.0 ],
													"text" : "join 3 @triggers 2"
												}

											}
, 											{
												"box" : 												{
													"id" : "obj-6",
													"maxclass" : "newobj",
													"numinlets" : 3,
													"numoutlets" : 1,
													"outlettype" : [ "" ],
													"patching_rect" : [ 40.0, 510.0, 137.0, 22.0 ],
													"text" : "sprintf recall %ld %ld %f"
												}

											}
, 											{
												"box" : 												{
													"id" : "obj-5",
													"maxclass" : "newobj",
													"numinlets" : 3,
													"numoutlets" : 2,
													"outlettype" : [ "", "bang" ],
													"patching_rect" : [ 210.0, 430.0, 41.0, 22.0 ],
													"text" : "line 0."
												}

											}
, 											{
												"box" : 												{
													"comment" : "",
													"id" : "obj-4",
													"index" : 3,
													"maxclass" : "inlet",
													"numinlets" : 0,
													"numoutlets" : 1,
													"outlettype" : [ "" ],
													"patching_rect" : [ 250.0, 10.0, 30.0, 30.0 ]
												}

											}
, 											{
												"box" : 												{
													"comment" : "",
													"id" : "obj-3",
													"index" : 1,
													"maxclass" : "outlet",
													"numinlets" : 1,
													"numoutlets" : 0,
													"patching_rect" : [ 20.0, 610.0, 30.0, 30.0 ]
												}

											}
, 											{
												"box" : 												{
													"comment" : "",
													"id" : "obj-2",
													"index" : 2,
													"maxclass" : "inlet",
													"numinlets" : 0,
													"numoutlets" : 1,
													"outlettype" : [ "float" ],
													"patching_rect" : [ 170.0, 10.0, 30.0, 30.0 ]
												}

											}
, 											{
												"box" : 												{
													"comment" : "",
													"id" : "obj-1",
													"index" : 1,
													"maxclass" : "inlet",
													"numinlets" : 0,
													"numoutlets" : 1,
													"outlettype" : [ "int" ],
													"patching_rect" : [ 40.0, 10.0, 30.0, 30.0 ]
												}

											}
 ],
										"lines" : [ 											{
												"patchline" : 												{
													"destination" : [ "obj-13", 0 ],
													"source" : [ "obj-1", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-9", 1 ],
													"source" : [ "obj-12", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-12", 0 ],
													"midpoints" : [ 81.0, 305.0, 129.5, 305.0 ],
													"source" : [ "obj-13", 3 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-12", 1 ],
													"midpoints" : [ 70.5, 316.0, 140.0, 316.0 ],
													"source" : [ "obj-13", 2 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-25", 0 ],
													"midpoints" : [ 49.5, 291.0, 219.5, 291.0 ],
													"source" : [ "obj-13", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-46", 0 ],
													"midpoints" : [ 60.0, 276.0, 339.5, 276.0 ],
													"order" : 0,
													"source" : [ "obj-13", 1 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-9", 0 ],
													"order" : 1,
													"source" : [ "obj-13", 1 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-25", 1 ],
													"source" : [ "obj-14", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-33", 0 ],
													"midpoints" : [ 179.5, 50.0, 179.5, 50.0 ],
													"source" : [ "obj-2", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-24", 0 ],
													"source" : [ "obj-23", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-5", 0 ],
													"midpoints" : [ 230.0, 422.0, 219.5, 422.0 ],
													"source" : [ "obj-24", 1 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-5", 0 ],
													"source" : [ "obj-24", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-23", 0 ],
													"source" : [ "obj-25", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-39", 0 ],
													"midpoints" : [ 199.5, 141.0, 219.5, 141.0 ],
													"source" : [ "obj-32", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-32", 0 ],
													"order" : 0,
													"source" : [ "obj-33", 1 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-39", 1 ],
													"midpoints" : [ 179.5, 167.0, 242.5, 167.0 ],
													"source" : [ "obj-33", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-45", 0 ],
													"midpoints" : [ 190.0, 89.0, 99.5, 89.0 ],
													"order" : 1,
													"source" : [ "obj-33", 1 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-7", 0 ],
													"source" : [ "obj-39", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-14", 1 ],
													"source" : [ "obj-4", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-50", 0 ],
													"source" : [ "obj-45", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-49", 2 ],
													"midpoints" : [ 339.5, 541.0, 72.5, 541.0 ],
													"source" : [ "obj-46", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-3", 0 ],
													"source" : [ "obj-49", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-9", 2 ],
													"source" : [ "obj-5", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-49", 0 ],
													"midpoints" : [ 99.5, 166.0, 29.5, 166.0 ],
													"source" : [ "obj-50", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-49", 1 ],
													"source" : [ "obj-6", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-14", 0 ],
													"source" : [ "obj-7", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-6", 0 ],
													"source" : [ "obj-9", 0 ]
												}

											}
 ]
									}
,
									"patching_rect" : [ 470.0, 720.0, 114.0, 22.0 ],
									"saved_object_attributes" : 									{
										"description" : "",
										"digest" : "",
										"globalpatchername" : "",
										"tags" : ""
									}
,
									"text" : "p recall_interpolator"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-56",
									"maxclass" : "number",
									"maximum" : 5000,
									"minimum" : 0,
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "", "bang" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 540.0, 680.0, 50.0, 22.0 ]
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-54",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 3,
									"outlettype" : [ "", "", "" ],
									"patching_rect" : [ 190.0, 770.0, 214.0, 22.0 ],
									"restore" : [ 0.5 ],
									"saved_object_attributes" : 									{
										"parameter_enable" : 0,
										"parameter_mappable" : 0
									}
,
									"text" : "pattr zoom @bindto ndi_ptz::ptz_zoom",
									"varname" : "zoom"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-53",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 3,
									"outlettype" : [ "", "", "" ],
									"patching_rect" : [ 190.0, 740.0, 220.0, 22.0 ],
									"restore" : [ 0.0, 0.0 ],
									"saved_object_attributes" : 									{
										"parameter_enable" : 0,
										"parameter_mappable" : 0
									}
,
									"text" : "pattr pantilt @bindto ndi_ptz::ptz_pantilt",
									"varname" : "pantilt"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-49",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 470.0, 770.0, 153.0, 22.0 ],
									"saved_object_attributes" : 									{
										"client_rect" : [ 1570, 212, 2178, 642 ],
										"parameter_enable" : 0,
										"parameter_mappable" : 0,
										"storage_rect" : [ 583, 69, 1034, 197 ]
									}
,
									"text" : "pattrstorage @savemode 0",
									"varname" : "u742000520"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-33",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 590.0, 640.0, 83.0, 22.0 ],
									"text" : "prepend store"
								}

							}
, 							{
								"box" : 								{
									"bubble" : 1,
									"bubbleside" : 3,
									"fontname" : "Arial",
									"fontsize" : 13.0,
									"id" : "obj-30",
									"linecount" : 6,
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 360.0, 560.0, 100.0, 100.0 ],
									"text" : "Preset number followed by desired recall speed (0-1)"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-29",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "int", "float" ],
									"patching_rect" : [ 470.0, 600.0, 67.0, 22.0 ],
									"text" : "unpack i f"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-22",
									"linecount" : 5,
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 440.0, 460.0, 232.0, 75.0 ],
									"style" : "helpfile_label",
									"text" : "The object has no internal mechanism for storing presets, however it will report any requests to recall/store presets via the below messages, and can be hooked up to Max's pattr system."
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-16",
									"maxclass" : "newobj",
									"numinlets" : 3,
									"numoutlets" : 3,
									"outlettype" : [ "", "", "" ],
									"patching_rect" : [ 470.0, 560.0, 178.0, 22.0 ],
									"text" : "route preset_recall preset_store"
								}

							}
, 							{
								"box" : 								{
									"attr" : "ptz_zoom",
									"id" : "obj-15",
									"lock" : 1,
									"maxclass" : "attrui",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 232.0, 330.0, 248.0, 22.0 ]
								}

							}
, 							{
								"box" : 								{
									"attr" : "ptz_pantilt",
									"id" : "obj-3",
									"lock" : 1,
									"maxclass" : "attrui",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 232.0, 300.0, 248.0, 22.0 ]
								}

							}
, 							{
								"box" : 								{
									"attr" : "ptz_autofocus",
									"id" : "obj-38",
									"lock" : 1,
									"maxclass" : "attrui",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 490.0, 330.0, 170.0, 22.0 ]
								}

							}
, 							{
								"box" : 								{
									"attr" : "ptz_focus",
									"id" : "obj-37",
									"lock" : 1,
									"maxclass" : "attrui",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 490.0, 300.0, 170.0, 22.0 ]
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-34",
									"linecount" : 3,
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 250.0, 370.0, 412.0, 48.0 ],
									"style" : "helpfile_label",
									"text" : "PTZ attributes can be set locally, but will be overriden by values sent from a NDI receiver. They are automatically sent from the dump outlet upon change. All attributes are of normalized range (either 0 to 1 or -1 to 1)."
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-32",
									"linecount" : 2,
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 255.0, 250.0, 375.0, 34.0 ],
									"style" : "helpfile_label",
									"text" : "This example shows a 'virtual PTZ' implementation by hooking up the pan, tilt and zoom attributes of jit.ndi.send~ to jit.gl.camera."
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-27",
									"linecount" : 4,
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 99.0, 80.0, 514.0, 62.0 ],
									"style" : "helpfile_label",
									"text" : "NDI sources can advertise themselves as PTZ devices to allow control data to be received from NDI receivers. Whilst this capability would usually be implemented by a hardware camera which has PTZ capability, jit.ndi.send~ can optionally receive this data into read-only ptz attributes to allow custom functionality to be implemented in a Max patch."
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-14",
									"maxclass" : "newobj",
									"numinlets" : 3,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 10.0, 610.0, 51.0, 22.0 ],
									"text" : "pak f f 0"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-13",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 10.0, 640.0, 88.0, 22.0 ],
									"text" : "prepend lookat"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-11",
									"maxclass" : "newobj",
									"numinlets" : 6,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 120.0, 570.0, 98.0, 22.0 ],
									"text" : "scale -1. 1. -3. 3."
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-10",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "float", "float" ],
									"patching_rect" : [ 10.0, 520.0, 61.0, 22.0 ],
									"text" : "unpack f f"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-7",
									"maxclass" : "newobj",
									"numinlets" : 6,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 10.0, 570.0, 98.0, 22.0 ],
									"text" : "scale -1. 1. 6. -6."
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-36",
									"maxclass" : "newobj",
									"numinlets" : 6,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 230.0, 570.0, 103.0, 22.0 ],
									"text" : "scale 0. 1. 80. 20."
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-35",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 230.0, 640.0, 114.0, 22.0 ],
									"text" : "prepend lens_angle"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-26",
									"maxclass" : "newobj",
									"numinlets" : 6,
									"numoutlets" : 2,
									"outlettype" : [ "jit_gl_texture", "" ],
									"patching_rect" : [ 360.0, 180.0, 257.0, 22.0 ],
									"text" : "jit.gl.cubemap @file panorama_cube_map.png"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-23",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "jit_gl_texture", "" ],
									"patching_rect" : [ 10.0, 680.0, 129.0, 22.0 ],
									"text" : "jit.gl.camera @tripod 1"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-17",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "jit_matrix", "" ],
									"patching_rect" : [ 360.0, 210.0, 71.0, 22.0 ],
									"text" : "jit.gl.skybox"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-9",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "jit_matrix", "" ],
									"patching_rect" : [ 10.0, 210.0, 53.0, 22.0 ],
									"text" : "jit.matrix"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-8",
									"maxclass" : "toggle",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "int" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 10.0, 80.0, 24.0, 24.0 ]
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-4",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 3,
									"outlettype" : [ "jit_matrix", "bang", "" ],
									"patching_rect" : [ 10.0, 170.0, 254.0, 22.0 ],
									"text" : "jit.world @fps 30 @output_matrix 1 @visible 0"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-6",
									"maxclass" : "jit.pwindow",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "jit_matrix", "" ],
									"patching_rect" : [ 41.0, 260.0, 160.0, 120.0 ]
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-2",
									"maxclass" : "newobj",
									"numinlets" : 3,
									"numoutlets" : 3,
									"outlettype" : [ "", "", "" ],
									"patching_rect" : [ 10.0, 480.0, 149.0, 22.0 ],
									"text" : "route ptz_pantilt ptz_zoom"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-1",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 10.0, 440.0, 226.0, 22.0 ],
									"text" : "jit.ndi.send~ MaxNDIPTZ @ptz_enable 1",
									"varname" : "ndi_ptz"
								}

							}
, 							{
								"box" : 								{
									"border" : 0,
									"filename" : "helpname.js",
									"id" : "obj-5",
									"ignoreclick" : 1,
									"jsarguments" : [ "jit.ndi.send~" ],
									"maxclass" : "jsui",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 10.0, 10.0, 260.720001220703125, 57.600002288818359 ]
								}

							}
, 							{
								"box" : 								{
									"background" : 1,
									"bgcolor" : [ 1.0, 0.788235, 0.470588, 1.0 ],
									"fontface" : 1,
									"hint" : "",
									"id" : "obj-21",
									"ignoreclick" : 1,
									"legacytextcolor" : 1,
									"maxclass" : "textbutton",
									"numinlets" : 1,
									"numoutlets" : 3,
									"outlettype" : [ "", "", "int" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 40.0, 80.0, 20.0, 20.0 ],
									"rounded" : 60.0,
									"text" : "1",
									"textcolor" : [ 0.34902, 0.34902, 0.34902, 1.0 ]
								}

							}
 ],
						"lines" : [ 							{
								"patchline" : 								{
									"destination" : [ "obj-2", 0 ],
									"source" : [ "obj-1", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-11", 0 ],
									"midpoints" : [ 61.5, 556.0, 129.5, 556.0 ],
									"source" : [ "obj-10", 1 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-7", 0 ],
									"source" : [ "obj-10", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-14", 1 ],
									"midpoints" : [ 129.5, 602.0, 35.5, 602.0 ],
									"source" : [ "obj-11", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-26", 0 ],
									"source" : [ "obj-12", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-23", 0 ],
									"source" : [ "obj-13", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-13", 0 ],
									"source" : [ "obj-14", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-1", 0 ],
									"hidden" : 1,
									"midpoints" : [ 241.5, 396.0, 19.5, 396.0 ],
									"source" : [ "obj-15", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-29", 0 ],
									"source" : [ "obj-16", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-33", 0 ],
									"midpoints" : [ 559.0, 605.0, 599.5, 605.0 ],
									"source" : [ "obj-16", 1 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-56", 0 ],
									"hidden" : 1,
									"source" : [ "obj-18", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-10", 0 ],
									"source" : [ "obj-2", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-16", 0 ],
									"midpoints" : [ 149.5, 549.0, 479.5, 549.0 ],
									"source" : [ "obj-2", 2 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-36", 0 ],
									"midpoints" : [ 84.5, 523.0, 239.5, 523.0 ],
									"source" : [ "obj-2", 1 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-17", 0 ],
									"source" : [ "obj-26", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-66", 1 ],
									"source" : [ "obj-29", 1 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-66", 0 ],
									"source" : [ "obj-29", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-1", 0 ],
									"hidden" : 1,
									"midpoints" : [ 241.5, 397.0, 19.5, 397.0 ],
									"source" : [ "obj-3", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-49", 0 ],
									"midpoints" : [ 599.5, 759.0, 479.5, 759.0 ],
									"source" : [ "obj-33", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-23", 0 ],
									"midpoints" : [ 239.5, 670.0, 19.5, 670.0 ],
									"source" : [ "obj-35", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-35", 0 ],
									"source" : [ "obj-36", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-1", 0 ],
									"hidden" : 1,
									"midpoints" : [ 499.5, 396.0, 19.5, 396.0 ],
									"source" : [ "obj-37", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-1", 0 ],
									"hidden" : 1,
									"midpoints" : [ 499.5, 396.0, 19.5, 396.0 ],
									"source" : [ "obj-38", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-9", 0 ],
									"source" : [ "obj-4", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-66", 2 ],
									"midpoints" : [ 549.5, 713.0, 574.5, 713.0 ],
									"source" : [ "obj-56", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-49", 0 ],
									"source" : [ "obj-66", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-14", 0 ],
									"source" : [ "obj-7", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-4", 0 ],
									"source" : [ "obj-8", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-1", 0 ],
									"order" : 1,
									"source" : [ "obj-9", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-6", 0 ],
									"midpoints" : [ 19.5, 245.0, 50.5, 245.0 ],
									"order" : 0,
									"source" : [ "obj-9", 0 ]
								}

							}
 ],
						"styles" : [ 							{
								"name" : "AudioStatus_Menu",
								"default" : 								{
									"bgfillcolor" : 									{
										"type" : "color",
										"color" : [ 0.294118, 0.313726, 0.337255, 1 ],
										"color1" : [ 0.454902, 0.462745, 0.482353, 0.0 ],
										"color2" : [ 0.290196, 0.309804, 0.301961, 1.0 ],
										"angle" : 270.0,
										"proportion" : 0.39,
										"autogradient" : 0
									}

								}
,
								"parentstyle" : "",
								"multi" : 0
							}
 ]
					}
,
					"patching_rect" : [ 50.0, 160.0, 35.0, 22.0 ],
					"saved_object_attributes" : 					{
						"description" : "",
						"digest" : "",
						"globalpatchername" : "",
						"tags" : ""
					}
,
					"text" : "p ptz",
					"varname" : "ptz"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-7",
					"maxclass" : "newobj",
					"numinlets" : 0,
					"numoutlets" : 0,
					"patcher" : 					{
						"fileversion" : 1,
						"appversion" : 						{
							"major" : 8,
							"minor" : 1,
							"revision" : 11,
							"architecture" : "x64",
							"modernui" : 1
						}
,
						"classnamespace" : "box",
						"rect" : [ 0.0, 26.0, 687.0, 809.0 ],
						"bglocked" : 0,
						"openinpresentation" : 0,
						"default_fontsize" : 12.0,
						"default_fontface" : 0,
						"default_fontname" : "Arial",
						"gridonopen" : 2,
						"gridsize" : [ 10.0, 10.0 ],
						"gridsnaponopen" : 2,
						"objectsnaponopen" : 1,
						"statusbarvisible" : 2,
						"toolbarvisible" : 1,
						"lefttoolbarpinned" : 0,
						"toptoolbarpinned" : 0,
						"righttoolbarpinned" : 0,
						"bottomtoolbarpinned" : 0,
						"toolbars_unpinned_last_save" : 0,
						"tallnewobj" : 0,
						"boxanimatetime" : 200,
						"enablehscroll" : 1,
						"enablevscroll" : 1,
						"devicewidth" : 0.0,
						"description" : "",
						"digest" : "",
						"tags" : "",
						"style" : "",
						"subpatcher_template" : "",
						"showontab" : 1,
						"assistshowspatchername" : 0,
						"boxes" : [ 							{
								"box" : 								{
									"bubble" : 1,
									"bubbleside" : 0,
									"fontname" : "Arial",
									"fontsize" : 13.0,
									"id" : "obj-10",
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 520.0, 440.0, 60.0, 40.0 ],
									"text" : "UYVY",
									"textjustification" : 1
								}

							}
, 							{
								"box" : 								{
									"bubble" : 1,
									"bubbleside" : 0,
									"fontname" : "Arial",
									"fontsize" : 13.0,
									"id" : "obj-51",
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 350.0, 440.0, 60.0, 40.0 ],
									"text" : "ARGB",
									"textjustification" : 1
								}

							}
, 							{
								"box" : 								{
									"colormode" : "uyvy",
									"id" : "obj-8",
									"maxclass" : "jit.pwindow",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "jit_matrix", "" ],
									"patching_rect" : [ 470.0, 310.0, 160.0, 120.0 ]
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-6",
									"maxclass" : "jit.pwindow",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "jit_matrix", "" ],
									"patching_rect" : [ 300.0, 310.0, 160.0, 120.0 ]
								}

							}
, 							{
								"box" : 								{
									"border" : 0,
									"filename" : "helpname.js",
									"id" : "obj-5",
									"ignoreclick" : 1,
									"jsarguments" : [ "jit.ndi.send~" ],
									"maxclass" : "jsui",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 10.0, 10.0, 260.720001220703125, 57.600002288818359 ]
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-9",
									"linecount" : 5,
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 280.0, 100.0, 358.0, 75.0 ],
									"style" : "helpfile_label",
									"text" : "NDI video is sent over the network in the UYVY colorspace for reasons of efficiency. ARGB matrces will be internally converted, however if using UYVY in a patch this conversion can be avoided (and performance improved) by setting correct colormode on jit.ndi.send~."
								}

							}
, 							{
								"box" : 								{
									"attr" : "colormode",
									"id" : "obj-4",
									"lock" : 1,
									"maxclass" : "attrui",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 70.0, 350.0, 180.0, 22.0 ]
								}

							}
, 							{
								"box" : 								{
									"attr" : "colormode",
									"id" : "obj-3",
									"lock" : 1,
									"maxclass" : "attrui",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 70.0, 210.0, 180.0, 22.0 ]
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-1",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 20.0, 400.0, 180.0, 22.0 ],
									"text" : "jit.ndi.send~ MaxNDIColorspace"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-18",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 40.0, 160.0, 95.0, 22.0 ],
									"text" : "read wheel.mov"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-16",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 140.0, 160.0, 35.0, 22.0 ],
									"text" : "read"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-14",
									"maxclass" : "toggle",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "int" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 20.0, 80.0, 24.0, 24.0 ]
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-12",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "bang" ],
									"patching_rect" : [ 20.0, 120.0, 81.0, 22.0 ],
									"text" : "qmetro 30 hz"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-11",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "jit_matrix", "" ],
									"patching_rect" : [ 20.0, 250.0, 55.0, 22.0 ],
									"text" : "jit.movie"
								}

							}
, 							{
								"box" : 								{
									"background" : 1,
									"bgcolor" : [ 1.0, 0.788235, 0.470588, 1.0 ],
									"fontface" : 1,
									"hint" : "",
									"id" : "obj-50",
									"ignoreclick" : 1,
									"legacytextcolor" : 1,
									"maxclass" : "textbutton",
									"numinlets" : 1,
									"numoutlets" : 3,
									"outlettype" : [ "", "", "int" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 50.5, 80.0, 20.0, 20.0 ],
									"rounded" : 60.0,
									"text" : "2",
									"textcolor" : [ 0.34902, 0.34902, 0.34902, 1.0 ]
								}

							}
, 							{
								"box" : 								{
									"background" : 1,
									"bgcolor" : [ 1.0, 0.788235, 0.470588, 1.0 ],
									"fontface" : 1,
									"hint" : "",
									"id" : "obj-21",
									"ignoreclick" : 1,
									"legacytextcolor" : 1,
									"maxclass" : "textbutton",
									"numinlets" : 1,
									"numoutlets" : 3,
									"outlettype" : [ "", "", "int" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 190.0, 161.0, 20.0, 20.0 ],
									"rounded" : 60.0,
									"text" : "1",
									"textcolor" : [ 0.34902, 0.34902, 0.34902, 1.0 ]
								}

							}
 ],
						"lines" : [ 							{
								"patchline" : 								{
									"destination" : [ "obj-1", 0 ],
									"order" : 2,
									"source" : [ "obj-11", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-6", 0 ],
									"midpoints" : [ 29.5, 289.0, 309.5, 289.0 ],
									"order" : 1,
									"source" : [ "obj-11", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-8", 0 ],
									"midpoints" : [ 29.5, 289.0, 479.5, 289.0 ],
									"order" : 0,
									"source" : [ "obj-11", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-11", 0 ],
									"source" : [ "obj-12", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-12", 0 ],
									"source" : [ "obj-14", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-11", 0 ],
									"midpoints" : [ 149.5, 193.0, 29.5, 193.0 ],
									"source" : [ "obj-16", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-11", 0 ],
									"midpoints" : [ 49.5, 193.0, 29.5, 193.0 ],
									"source" : [ "obj-18", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-11", 0 ],
									"source" : [ "obj-3", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-1", 0 ],
									"source" : [ "obj-4", 0 ]
								}

							}
 ],
						"styles" : [ 							{
								"name" : "AudioStatus_Menu",
								"default" : 								{
									"bgfillcolor" : 									{
										"type" : "color",
										"color" : [ 0.294118, 0.313726, 0.337255, 1 ],
										"color1" : [ 0.454902, 0.462745, 0.482353, 0.0 ],
										"color2" : [ 0.290196, 0.309804, 0.301961, 1.0 ],
										"angle" : 270.0,
										"proportion" : 0.39,
										"autogradient" : 0
									}

								}
,
								"parentstyle" : "",
								"multi" : 0
							}
 ]
					}
,
					"patching_rect" : [ 20.0, 110.0, 79.0, 22.0 ],
					"saved_object_attributes" : 					{
						"description" : "",
						"digest" : "",
						"globalpatchername" : "",
						"tags" : ""
					}
,
					"text" : "p colorspace"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-1",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 120.0, 120.0, 158.0, 22.0 ],
					"saved_object_attributes" : 					{
						"filename" : "helpstarter.js",
						"parameter_enable" : 0
					}
,
					"text" : "js helpstarter.js jit.ndi.send~"
				}

			}
, 			{
				"box" : 				{
					"border" : 0,
					"filename" : "helpname.js",
					"id" : "obj-5",
					"ignoreclick" : 1,
					"jsarguments" : [ "jit.ndi.send~" ],
					"maxclass" : "jsui",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 10.0, 10.0, 260.720001220703125, 57.600002288818359 ]
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-4",
					"maxclass" : "newobj",
					"numinlets" : 0,
					"numoutlets" : 0,
					"patcher" : 					{
						"fileversion" : 1,
						"appversion" : 						{
							"major" : 8,
							"minor" : 1,
							"revision" : 11,
							"architecture" : "x64",
							"modernui" : 1
						}
,
						"classnamespace" : "box",
						"rect" : [ 1188.0, 363.0, 687.0, 809.0 ],
						"bglocked" : 0,
						"openinpresentation" : 0,
						"default_fontsize" : 12.0,
						"default_fontface" : 0,
						"default_fontname" : "Arial",
						"gridonopen" : 2,
						"gridsize" : [ 10.0, 10.0 ],
						"gridsnaponopen" : 2,
						"objectsnaponopen" : 0,
						"statusbarvisible" : 2,
						"toolbarvisible" : 1,
						"lefttoolbarpinned" : 0,
						"toptoolbarpinned" : 0,
						"righttoolbarpinned" : 0,
						"bottomtoolbarpinned" : 0,
						"toolbars_unpinned_last_save" : 0,
						"tallnewobj" : 0,
						"boxanimatetime" : 200,
						"enablehscroll" : 1,
						"enablevscroll" : 1,
						"devicewidth" : 0.0,
						"description" : "",
						"digest" : "",
						"tags" : "",
						"style" : "",
						"subpatcher_template" : "",
						"showontab" : 1,
						"assistshowspatchername" : 0,
						"boxes" : [ 							{
								"box" : 								{
									"autofit" : 1,
									"data" : [ 7987, "png", "IBkSG0fBZn....PCIgDQRA..A.D....gHX....P3dJOu....DLmPIQEBHf.B7g.YHB..dndRDEDU3wY6c98iajccm+ysXKOiGu1lzimYVicRbo0HAHYWGQs.1ZxK6vF6i9A1slLAHaFMh7u.08CdF3m5tABvfQ9gVBXARdJr0O7ZXKMiXuXCVr6BilJFAPi8fUTwahi8Faw4GH15WnomMdlIRj2adnHawl08V7Rxh+nUNe.Z.oh2ppawh025btmy8bAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAgYOpYcGXRyc3aVn2++BrP8brZyYT2QPPXNhEl0cfzfawoyCjGTGAL4UPnBUns11hVKBTa506DDDlW4.o.3s3z4UPACTL.Ug8+oOxaTqffPJwAFAvHq7TmTgYotV2IRcBBBiCy0Bf6xlYuOOXIElSoPkOZqhrmffP5vbo.Xjv28W497fSEfJ63J5o3iXA9G.fCwOJuIZyMUP8wsuJHHbvk4Jyo5J7ApNBeCGZLM+jbMdbtQ1dE8F79QShDCa.7NAQAIotJZ6BBBOhxbi.3s4zqXf0FFgOClFfolA0U0zt1WfuQi1vNAPgznOoiDEqE.WUAUSiioffv7CybAv6v2rfA8lJBx6S6MXZXPUELm6Y3Uh4BaaX8.Xszte1wJwpAv1hXnfviFLSE.uEeyMCfU7osFzaoH3bOEe8ZI2NJATIE5dNQG4p74BfyHtIKHbvkYh.XTd7YpLHq9zXZBpszz5reA9FM74Xahb+cmTnaNP5XU3VAvYUQhhBBBGfXpK.dKNcIfMGzX8YPu0g3Sr5nLs0ZGI.1fn.ZzfjEmxqgr.GAHL.7xU7doiP3YEKBEDNXwTU.zGWd0XpoocYes3aRfAJnirjr3vHHpglAvpJXqIVmSPPH0XpH.tKal8Ab+MUDTxUazXZZvT9eMu5.Cvvs3zkBP0XPiGXZfABAVRCmzWwPcTjiKKtEKHLeyDW.ri32NIMdeZL09DbnkSxc2eAuVX.Ak5lifFz0eZd0iNQ5zNv.g5nHLuTPjayNQrFTPX9mIp.nOheFLq9z7JmY.GCqVO1hVGdV3prAxpibk+TdHDtUFn7TpqIHHLDLwD.Gj3mFSy.TKmjar2hWe8jlUHZ3LOCe8U6cacbYMuNxc0iPj.U19cesmY+A.0Cf2gnY+gy9S+zQHbyfnTuwI5ni+hR.RDDluXhI.dad8q6R7yfttAUYaIxLzM4nMUbUS+d3wwz3o3UNJQAsnHPgfHAvwBcjH3UCfp9LegMQBtURZLB0Pi.XYY9GKHL+vDQ.7175UbEvCC55GhOwhtFuOeSN5CwOiGm2lGi2dL6sISGgqyBr0frfaPyBkNiK3hhHnfv7Aot.3s30WOf.qh.II98K30ByPvUFTxQ+37173788tPGjlniR54MRJ5tcRglq3ZrAEQPAg4GRUAveIu9RYH3J19rjD+5TR62Ioji9P7y3Sy2g.1ME6wiFcDBW0kEgFHq9E45A+uHjek08WDAEDlCH0D.iRSkLW2lHlASiCwgNpCwuRAnRbt6ZvTMG+IMVfOvq4MbW5LVdMAtgil7YIZb6BGlwNri.1QcYInYWJQ.U3GA70fDDAcdLDDDl7jZED0.xTwl3Wz74Eq432fD+5M4n6Dw0RIk1I5np0xUApMrVWYhNtEzvySTd9ElPycN2eM6RdB5TLF9x.+EXUDLny0Cv5CS+TPPH8HUr.Low8qM5ksM6N7P7KVxQaqRuzIESNKQQrM0Ryj1+cTI3mQI9V.+W224qQGK2hctL6RnVw0CT8IRawRPMrQFQ7SPXlxXK.9K30BWfEtosOSidimgWc8929fD+Ln25o4Usl7vcK3ocltYaLL4s2vP6lby.UGq.eWfWitBgkcM6NZ2jJAJG4DXGQP8uRlgHBByKL1Bf2hSuS7klxnfdXappMn.dnwT9Y3U1x04yDMlcYmTBe.X1kBDXojZ8t.OKKpxY+ba1krZE6DnbjOf+E.+m4nRvODDlOXrFCvnY6wCB6e6ZLM0nW1V6uOOXjE+.vWwiNioWd8CKO9OeeMoAQkKq58Wgm0JNYfsC5uI.rS6lTMvPYUt86FrJGMM6xhZbHB90.cSNIY87ZHxk50xjUlJcBBSBFaK.6tPF06X.5Z985xZQvOwuAQmYjwIIZFg3ckaICrXuaqcS1M1330+9YnQfgkU4hKlMPKA0rrJm6xpem8es.UmDBWSYUNwkYAgzFqF5LLjiUa9L7pq2hVG1foZjqu1D+d80cI9YvrpMwucYyr2hu4lCpOXfRsgaBb8.XkgrnlFS.KvPYsIYWrCTDpUriY23i4mJGMCLrn1X2ROshJlcsKvZ1kUzJt4dheQsO0WiSDDDlR0CvawoyGf5519LWA7n2hofq1XfRZXswb9+5LnFlcoPGKwJj3QvgEZlcIeGKAimdPFplIKwFlf1MYGqmOwJPAgTmw1BPOwpUbcBTRhhe.nHnzs4zq7v8ivNk89JoPwOngqOPkiZYxxhnYQsIgDVNfJNrDrdfw932EnXIytrTrsaXUasWrBTPH8YhaAnqTdIJPIsOZ+0yujJiVsQu7yvq1sDT485Gr185BR9LPNeNFcFWtMcllKQmHqVo0tIa1qKs60bCMxjkCao81SmFwJPAgTkIt.3s4z2zVYsxUfRRpRx7o463U0eoifW20v2ZCWONYL6xJDX2h1Nm7i1efQ5Hdd88xqvdatlMxja+IDsYWBIfX4Vo1zwhTAAgTgIp.XBV+U6Y3Uh8f7s4zqnPYUbwGwuNEofyMIyQPnm45qs9fglAFNb+oHiqbKzU6SXr.OrJmL+gEDRClniAnxQswK.0F8usn0J3QS7qSQOXwLQAzn1n0a8GUN1Bsyw1KqVQrJhiJG0zl3o9RfZuxq+92tgyZ63qUbpQoOKjpjmn7KsvrsaHLtLwr.zk0ethnqqJH8iyay+J9NIcpVUANWSQljjjkf1FutDbs00XAdy9ca1Ua8fBiv9zkdW9.FFBYvAop1PzVXvqyy1HO9Mlw0w97IOD3TD8cnsTrpIQWGai+SwwBd1NaLIueLpzfGdeYbOO8drlnL1Bfe0ie9kTJyIwn19ia2t5M1tbSvsflsExHWt91oRxr3SyqTf9hj77RM0yU.KRv0VuCvgqfmXabF8.yP1dazfnGzOK98895jPExtCc+MXVhxkyAIT0D3v3eguHrywcPTEhkVRgD86tXQqOAZBrJCVHbd89wnxF7vh6QZcdZvCewx.WtbGEFaWfCTlhJBVRoTUd7LYt4y8BmqxexQ9yVwl3mASUaQ8033KKErwyvqTuiEdk6rPFM2H9APlrT1VBOmfqswb+G.shhVZ64bz1SNJ80TfPhpHOWmnzPJLEO1MwuUOurLbObkXslLgycIhtNGFwOHp+Uwyy63RHSt6GyCDRz02UH5kXkR6SvXK.ZLp89AhRoxBAk9B+Zs0wxSgJ13ZEMM5rVGAq0aThUQA3XwNkip4Bwut3JW+Pwo5eFenxQCayxjN4EXXessti7Orvn1WSQJPzCdkRwiYU76M8qfeeGrjmsaC1uEkkHR.y6TsxBcOFSKJP5e+XdhPh99bGFu6K6iwR.7q7hWLejn29449G93XsMZEby1Rfox5f5qocLQEETOCb34IwOXOgps5e6IXEnUK6vt0F1BbRdWSktoLcs1oPJdLKiet2NnoHYVOZCD4hUuigbAROgqR3wB7UJxj39w7FEHEEAGKAvfVsi8.6+1ls3o+v1wZqAkqhhpkRnudqYwBd93PfgU0FKO3ZwcUUN1xVa0pXUrFBLbUGmxBiP2bRwUH8b+pIwGKNajmjKnrqfe8odeQaWAjzj0HEsXwSRy6GyijGhmoEiBik.nRoh8.6+96deGs1XypGqikUazVGmr4Y5DrCaVqEZaJu4nswZmqpFid3J3CSZF1wkaPTC+hr+ZX+A8P7q+rA6OZi9JZNLjkouaoo88i4QJPJ7853MFfp3U2ku7chK.Zvzn+EA8nEQIaER03AJ4fBCY.NrZYmY23V1YspxXwZwYLkHcEO5WbxE1rXyGq3pSbKH8M3RUIp+cF7qONKBZUIdz1JPHED4GYAvuxKdQqVfXS.DL0hehyTv19qsao37OWnXA0+8kVaie5uisO0KK.APa20Vai4Yn28M+XChRIk9+KWmOyGF1HllD9FU3BreKA7MvG8WzIxyf+NsIvQIxE806bLNLCNkW7MOD6kY08iEGw+1ZHOO1t1592gwOO.BYL8DZjqHzp15PT6OMBe5OrMepGni0VCpXV6nHtUQZLMss.JM2x2tXHsUmBTKQmDVdq2+2j09s+w6qYAJxZ1k78l6dpbzrcSZDa9Aq3H8eZBLbi9yXSayq3IDMI5g8lL3fJTjzMozq043Mn.IrIO7EJ9D3iyP7YLjOOHUF6uLpLQhtgIru4sbNGElz2OpM7coTmFD8xkeEC1JukXLBJ5HaAnxXh8Cla+DYnEsNbazKqQuQ2BjpiNXr8eZLM1RUZwRnTqPOhQM9vmf5evm0VqKXYa0rrsPKay5MXatKOA4LL3nyFNANu93Jb2H95yX30.6VPMn8CRNEcFzKtS6wrcVc+XZhOWieww4DL5V.FD+DaLl5cF+tFjvOH1kMy1hVgV9HWQ7b9DkcA6Z26yS9Oy9WHf01bAxv6XwxNaOnzXD6goM0IY2KCm.myttBGeQpZ+Txyi2pL5KepYSXeOKQyXAWzXDOmIwr39wzjlLguFG8ffXTwNwJO+gUKZY8sgJTyU422.4k1tNVRmk+p694Zp0rAZVFMGU8YQ0eIuBf.2V1EK4oczCBG9N8XwrJ2CqQ53ZcRIZ83l6gMHpe55uFdb7GVlGxEzCzjpUCFim9hqwDZa61ST54cLwtlu7u7eS8L4XcUNpNf4rqqG57xcI8zU.LjA2uZLAO+9FUXWLnfp3yucKw7yrsHjY68ioAYYvAzZrLZZjcA1Ds1712FM+Jas0xdGNkVNRl7XLWMd5.oB8bua36oQarDvjoK9DbgIoE795JrKFjqu0773jmGNWeqQjau0X5O6jlT2OJLB6SClLhs9LKZ7TywNi9X.pTo5f51IXIOZfmBUpbzv2WYPzOv753Nh7Ew9O9yxCKETChI8X3VC+hJrs8aKOZ2VLbV2UfG98RCfygeCbuOLqteLJufo2JASZPdhhtqO44Wsw4DMVKL5oIFTowOZDFcJw36Z2VicuXvrAQObD5Y68MeB68XOJisVHQOvdJhBHx5ivwnWJwAi6GiJoQ4.qIy6BfO2wO+N86h324G+Oxeze6+3j9TOewEJVfffXucs1899T3Iu6rnGk1jVV9LHZRjPkuyY2yh+tm0fHwxwYdl1cZnUjnDDdV8h8o08iYIVqZ5CCSqkEyAhBiDQqCtz.+mcBoACyxBPsg7XWE+sXLIxieE30IAMX5d+XVPCRgLCXLRCl3SuMqMyyAh0VAT8.KIsFB2GYOzC7sogiRWYJPShlZXSKqMVmgKohGk552VDMk2F2wkNKoTUKYHXZe+XVPpcMlpV.ZK4nsEY3a8DYRyS6rEKUDGvzHd6rKf0eBS6hYbDfcQchbyaZE.qPF9I.+nrOPz0zQIxZvFiv92kBL8Ralo88iYAMHEuFSWWfsjbzFKpz2tOAPClFFLU+E7Zw1+4erDMbaV.ZFJALut4FL6xyqtiC2z9gsQsV8sBid8SbKhlb9Gsy+dTr5XRuR9MqteLMo60XZXY9dLN4AXcUe+nxXwUCUPPrN6OO6g3u9IWXieu60p1AyjetCWrXdT1buxbiXaRohUjCbE7CKqovgN5AMFXeL8ndmyW2EnlosKViiHFDIddTF89cchrFrLQQJtH9Gw37DYIZiQ7b6p+zfz+9w7VB5VmnfcLQ9M23LFfw7cyZtA1pUi92zu9PJ9F+G+bMOPK9AfwwCjVmivw+t41+SOVMslMzFp0cs+vZs+a5L9etJ+Rc+qaYfZKl9hegL909sz3XzktAJ4v3evFBGxyw778izf9KGYtHKSvW3N5BfAA0rs49qSfu01kaXLlXc9ff3k8od4XuvEJ7buv4pbrie9cO1wOeoQteNIQED20FCM3k1d+hXe6hg1FCv+1O3SsclbrdlrrXlrbXzjywBrj84NctCXUOmQmwcAJpKiqUj8SShBJiOkv+z779n.mA+hPeHSvEWpQW.zhkc.DzVG+gUU7HF26pIWubrie9Metie9apfcffRJkJqZdr7deghErGXCS7Iaeam+3eeBkpbzz1bGVaoFA5X0h6QQVB+DOVD+dfxkXZIhlEDt9Kon4VkGcG6sIIkwOK6VhIzhK0HK.5xxNkxDKpnFc7ojiRoxZqpRqTlrnTg8swv4Nq.UJGhx1pn0pXE+ULzjSrcMOOa1r.rgm66AYxheu8uq0D97.UH1egZHObpsY6uAMdeGDcCcVSC7OmK2jIv5fy3snHY6sdl3qyGJsNtUQ.Yzsi4Bog.KBHfBV6HEqLejrzWrXIaqGJXL0h49akhYQYyZW+xiRvQMBz8pE2iR3iquciNH3eB.ayU3ZdretJ.A4sb75GeN9+KQpheqEzP5MTH6wXI.ZLl3ODpTgGqXkvd2TGqEiIVZLpk5WT6sdiSTyZRVqTgOdlLydWgqTLKD33AAKV+sfqb.yjTwy7gsx9JJmyZI3iPrD9slVzuUe9N1R8+vjOeeVhHWg69Bor7PWmGDGTtes9X7W3HdN8MWKyieUAGuYrlKv5ExTMi1DSTxDDrD8MMULFy45OJwJkJ6imIyRz2j11nTazeJ1zo8q7UO94u5O3MeYeeiQ5ygTWwZpuDY82Vw1t8.kzjG32a8zJddGukplO6+ATxh+Kp419dbUhpaeIQHQtB2MZjMIRjZPtY4qvbuLKRanQkwwHiZLZCMSS7uTmUhGl5OiMikEf+vK8R0sONfp3KF3NbC1V.Ndq23D0L3r8UbshzMwoRwrXbXBtwD20qKVrj0.kXLUo7199.QrG1zFp2etB9HFtVue6ktOzXi5LZtBO1StdGLoNtOJQM7et8VgTJ0vF6YBhREOpmJkJuM2fA8VVN.VCvwG2RW1g3Z1f15clIhfk2tIsLKh1r091twbF6AzHv9aSUl3OPbgkpvEW9lbwk1jucwP.L6RdGSANKmqGYn.9EwuAUkWVG+b6rWWg2xy8YXnJOZe+JMYU766+rjRyw5wV.TaT1GKqLY7N.G.a1+XAdisK2z33M7cEAO1KbgBCY2c7o71M4DUKiwD81JsoNuT03I04EJthCq+bGnDEgnTqfN3lbgkt9Z+zeGqtAFXv02iGzw2n9VG+p2d9DgwP1uWH9lZF9P2YOhf+362W4IEJBqis.3O3Me4pXrL4+gR9FfiNiEXLqk9Au4KW0n0VckoS9AtywV9bqOZ87wjWp5pfdYVvDOIXqTLKJGV+YyU4EnTrwULPkO2ic+B82TsgFCXcF4fLqfet136rHXTbEtNoSc7KsNN+KMpi+2eWiwLAySkhgfwDO5mJkJ6iEDTp+s2NSf0KNkRshMK5dqqbx0s55b28KHXsic7ye8Yh0f+waWk+nsaDa6GRUwYfRr4prs.k.T5YeWaad1E.nIK4wuAf22n71k0Y3cEtq30n9hlpHheiCCy83qvXjZLoSEgVq2hf3V7DnTmh9FXye3kdo5G63m+LJkJ937XLW4HEqb3arc488Cmq8Fmr7y8BmCHtfJr2bPdmi8BmqJDb125MNQsQ+hYL4BEWwdd+AjwD27dGAJozuw6ZsVAFXF4ATu1.97Fi3wcPGyAcd6xI8ns8lyeCCkwunJ2aFITmn4aaI7KnLPT+eC76ZdPsogGGigkFdbdGG59baZbdJi+SAtUXDcGN0p7CO2KbtJ1DnLZ8FQVw8PNRwJYe7LYtoRohobaLl5u0a9xG0143XG+7aZU3L9AogAphRscpKFd46VhLYpxx4h+1cGk8d.Pq2fSr856aaUJlkCEbcaBf27+z+SB+je39ODFpkIKKN5cdgwftI67Wj8mpL0AtASt09WgIHol.3wJVITsvB2r+saLlleb61wrp6qd7yuTfR4HRN5st1abRqCFZmHFuoMwSqXL0t1a9xiunwU1MKszUHPsDZSUdwmb+i82EKlGB1wpquZScNQ03h5Wn351rbtvSdW142+6GuOnorJ2b8BcifvAJRsBhpqzbQoTY+jKDelSDkLytFaufRQVTZ477lu7Vzt8Q8sj7ixZ.ZFNtzcJP61WmfNt1FnVhKeuGdMkj3mglnr3562tXnqw9ay+c+0w1Vmfer0ndIHHHDmTshPaZYOhsPPIaAo3iZoW01Tjq693TDb6xMt1a9xKZLlxNh.8C6SZdmj60IvktSAt781gfL6fJHbeelRsBW9tkRT7C.zqFKsW.ns8.kT523csVl7CLOxuH2HHL0I8p9qWY2PZo27Y+a96W5Y+Q+z3etwz3iZ29n86JbRiGXm8q1G0t8x8ue8xwN94Kof0hUEY.LvhC83.d46rDDbJqE7f8wGBe7qzD9HW88y3LGACrLehMz7686+Wd1BO48NUPOhiZCMxjkCOTWCBBBCjwW.LZrwVgfnxC0B2+A7k+e784w90eTrlZPW8sdiSFKu49Ju3EyGzVuSBhfMZmIX4e3kdoDSKgO8e5e+0ex26Wl+yb66wSr6G..eTqV4RR7ry0PHsakGSPQTlkPEL3wWzbW3A+W.86Y+y0ls3DUsE02DFqvn.kX1krZEqEn5LiHjw9SPXhv3I.dkcyR61Wue2C+bu+s329u7sstKZsd0evUNYr472.EAwdDk2iu6t4IiYuI.+B2+A7DM+.9fmJWcPEMQ2MzqukGIRDxj2KAudo8+an0+Mv7g1+bWheID0WaAJwrKgZEqkIqLaBDDlDL9V.d46siMWE+RW6F7T+72OVySJMW7QDDiow0dyWNt6fW9dahOoHy3f4tvC9yA8OwcabI9AvEWx52UQGa8QsNVgBBBSLF+ffjIv5C6uy+geW9vbel8sMC5peb61NSIke3kdo5u+W92Z492u8gkxqemi9vVhh7GitAFcY9++0yQ6eha2o05MbJ9cgkp3T7S6HPIBBBSTRmffbo6sd2w.rW9T69A7698tFYt+CHob6aOhbodmEdP67eoqcCx892ZeerqbJjKcmBDjwmZI1vgwTCLmi+fO+V6sMa4tmglnzk4Oda6SSsKrTEBTkr9YIYwnffvDkzKJvNbE9o94uOe9e96swO9O8qs9.OFW5dWYubsC3K7StIO6O5+WGAT2ieXz4+NKAAOOXVJVJqLLXL0PY1lfLUY4bMr1lKt7M2ab7LlZjwT15bBFFj3WcZYVbHpMfBBBoHoaZvDEPDKICrtAYxbTqSert3XL7dre8GwW5Z2fOyu7t1G6OW8kVsBgfBn3yRRU4WCWk.SSzl57hOUMuN9eqhKgInBF8FbhscWDGSR7yPSdf9vh3mfvrizS.DhrBSkw9zaynqSlLKZUDLx02alTzXW39OfVKrvFrPvYRTHcZQkhYcJdUoXVVPsCAVVn3gHwOzKJi6mfvrkzU.DbNdf.CRDLj1suBpfjqzyFcSPsEYBNqSWTmkLnYFhH9IHL2P5K.BvktWBt9kfHHLboyh1TEkY68EjhzjtIH8evS4WM3yQwMXODwOAg4JlLBf.b46dcmVyYz0QmoL+g4rKDbo6T.kpxPELCsoJAlqR6L0bdbGDWY2rztUgNASo.pf7XzMISlCmna2WrXdLpJNc4EDwOAg4PlbBfcRokDDAahwrbhAd3R2acTlSMzyTCHJ5rFZ.cKFB58edTpPLpvn+MOOXBcJ3ZzksZkYzX8soSqc6hDsWAg4RlbBfvfEAA.8p7Bed2QR8J6lk150l3yxijn+5+WkhYYAVAUvobWEX1ae2hVlUEwOAg4OlrBffehfFSMxDrbhtY1snKLpVDNtDnNLebInkZsNqfaI2Ghb4cUqKV5BBByEL4E.gthWI6pnQ2DLk8JfCW9tkvnJ1aRSOQwbW3e5BMf+ug909AjbzBBByELcD.6hOQ3MxZvxdkhKQVWtDF0y6cYrxWLuGn+6f1+UtK4Uw1GwpOAgCRLcE.gHq2fMGnXk1rEKDrwPkqeOrt9kGeK2UFcCP0.CMP+8Jf9+SHl2ycotxY+UuAs3LxX8IHbvgou.HDU69BZWwqjd1npNzBgiJCJO95GCMwXpxBlMD2cEDN3wrQ.rKCWROuEnOm2yW2QgKVrDpfAuVjZnAF84DK9DDNXyrU.D5lzyaNPqA6RjKqUQGbtQNgmcQRqqucs1KvrsyxdkffvAJl8Bfc4Mt6JXXsgJPFFcCLpZnLWkLYpkJtI+sV1r2+VapihniuH5IH7HGyOBfv3mqeQEJg5r25+QOy9iEVntWUQlKTbcfZzh5h6sBBOZy7k.XWljI8rt8hSzwQTPP3.Co5Bidpwx4ZxK9jqSlLGFitLFsT.ADDDRclOs.zFe2cySf9jicIuWr.TPPnCGbD.6ku6t4IS6BXTEctRq4BQ.TPPnCGLE.6mnDqNOnNBP9DKsUh.nffPGdzP.LItzcJru+uuQCVPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPXJv+L.hA9eaIiCXSB....PRE4DQtJDXBB" ],
									"embed" : 1,
									"forceaspect" : 1,
									"id" : "obj-34",
									"maxclass" : "fpic",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "jit_matrix" ],
									"patching_rect" : [ 10.0, 730.0, 145.454545454545467, 60.0 ],
									"pic" : "C:/Users/David/Dropbox/Pixsper/Branding/Logo_Google.png"
								}

							}
, 							{
								"box" : 								{
									"align" : 0,
									"bgcolor" : [ 0.290196, 0.309804, 0.301961, 0.0 ],
									"id" : "obj-35",
									"maxclass" : "textbutton",
									"numinlets" : 1,
									"numoutlets" : 3,
									"outlettype" : [ "", "", "int" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 169.0, 760.0, 81.0, 20.0 ],
									"text" : "pixsper.com",
									"textjustification" : 0,
									"textoncolor" : [ 0.011765, 0.396078, 0.752941, 1.0 ],
									"underline" : 1
								}

							}
, 							{
								"box" : 								{
									"fontface" : 1,
									"id" : "obj-36",
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 169.0, 740.0, 310.0, 20.0 ],
									"style" : "helpfile_label",
									"text" : "jit.ndi v0.3.0 by David Butler / Pixsper Ltd.",
									"textcolor" : [ 0.0, 0.0, 0.0, 1.0 ]
								}

							}
, 							{
								"box" : 								{
									"hidden" : 1,
									"id" : "obj-37",
									"linecount" : 3,
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 500.0, 110.0, 116.0, 50.0 ],
									"text" : ";\r\nmax launchbrowser https://ndi.tv/"
								}

							}
, 							{
								"box" : 								{
									"align" : 0,
									"bgcolor" : [ 0.290196, 0.309804, 0.301961, 0.0 ],
									"id" : "obj-38",
									"maxclass" : "textbutton",
									"numinlets" : 1,
									"numoutlets" : 3,
									"outlettype" : [ "", "", "int" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 490.0, 57.0, 110.0, 16.0 ],
									"text" : "ndi.tv",
									"textjustification" : 0,
									"textoncolor" : [ 0.011765, 0.396078, 0.752941, 1.0 ],
									"underline" : 1
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-20",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "multichannelsignal" ],
									"patching_rect" : [ 40.0, 510.0, 70.0, 22.0 ],
									"text" : "mc.pack~ 2"
								}

							}
, 							{
								"box" : 								{
									"bubble" : 1,
									"bubbleside" : 0,
									"fontname" : "Arial",
									"fontsize" : 13.0,
									"id" : "obj-22",
									"linecount" : 4,
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 510.0, 640.0, 117.0, 85.0 ],
									"text" : "This bpatcher shows the tally state over a video source"
								}

							}
, 							{
								"box" : 								{
									"bgmode" : 0,
									"border" : 0,
									"clickthrough" : 0,
									"embed" : 1,
									"enablehscroll" : 0,
									"enablevscroll" : 0,
									"id" : "obj-15",
									"lockeddragscroll" : 0,
									"maxclass" : "bpatcher",
									"numinlets" : 2,
									"numoutlets" : 0,
									"offset" : [ 0.0, 0.0 ],
									"patcher" : 									{
										"fileversion" : 1,
										"appversion" : 										{
											"major" : 8,
											"minor" : 1,
											"revision" : 11,
											"architecture" : "x64",
											"modernui" : 1
										}
,
										"classnamespace" : "box",
										"rect" : [ 722.0, 408.0, 738.0, 473.0 ],
										"bglocked" : 0,
										"openinpresentation" : 1,
										"default_fontsize" : 12.0,
										"default_fontface" : 0,
										"default_fontname" : "Arial",
										"gridonopen" : 2,
										"gridsize" : [ 10.0, 10.0 ],
										"gridsnaponopen" : 2,
										"objectsnaponopen" : 0,
										"statusbarvisible" : 2,
										"toolbarvisible" : 1,
										"lefttoolbarpinned" : 0,
										"toptoolbarpinned" : 0,
										"righttoolbarpinned" : 0,
										"bottomtoolbarpinned" : 0,
										"toolbars_unpinned_last_save" : 0,
										"tallnewobj" : 0,
										"boxanimatetime" : 200,
										"enablehscroll" : 1,
										"enablevscroll" : 1,
										"devicewidth" : 0.0,
										"description" : "",
										"digest" : "",
										"tags" : "",
										"style" : "",
										"subpatcher_template" : "",
										"assistshowspatchername" : 0,
										"boxes" : [ 											{
												"box" : 												{
													"comment" : "Tally Messages",
													"id" : "obj-47",
													"index" : 2,
													"maxclass" : "inlet",
													"numinlets" : 0,
													"numoutlets" : 1,
													"outlettype" : [ "" ],
													"patching_rect" : [ 110.0, 10.0, 30.0, 30.0 ]
												}

											}
, 											{
												"box" : 												{
													"id" : "obj-15",
													"maxclass" : "newobj",
													"numinlets" : 1,
													"numoutlets" : 2,
													"outlettype" : [ "bang", "int" ],
													"patching_rect" : [ 560.0, 140.0, 30.0, 22.0 ],
													"text" : "t b i"
												}

											}
, 											{
												"box" : 												{
													"id" : "obj-14",
													"maxclass" : "newobj",
													"numinlets" : 2,
													"numoutlets" : 1,
													"outlettype" : [ "int" ],
													"patching_rect" : [ 540.0, 230.0, 35.0, 22.0 ],
													"text" : "== 0"
												}

											}
, 											{
												"box" : 												{
													"id" : "obj-13",
													"maxclass" : "newobj",
													"numinlets" : 2,
													"numoutlets" : 1,
													"outlettype" : [ "int" ],
													"patching_rect" : [ 360.0, 230.0, 35.0, 22.0 ],
													"text" : "== 0"
												}

											}
, 											{
												"box" : 												{
													"id" : "obj-12",
													"maxclass" : "newobj",
													"numinlets" : 2,
													"numoutlets" : 1,
													"outlettype" : [ "int" ],
													"patching_rect" : [ 180.0, 230.0, 35.0, 22.0 ],
													"text" : "== 0"
												}

											}
, 											{
												"box" : 												{
													"id" : "obj-28",
													"maxclass" : "newobj",
													"numinlets" : 1,
													"numoutlets" : 2,
													"outlettype" : [ "bang", "int" ],
													"patching_rect" : [ 200.0, 140.0, 39.0, 22.0 ],
													"text" : "t b i"
												}

											}
, 											{
												"box" : 												{
													"id" : "obj-29",
													"maxclass" : "newobj",
													"numinlets" : 2,
													"numoutlets" : 1,
													"outlettype" : [ "int" ],
													"patching_rect" : [ 220.0, 170.0, 35.0, 22.0 ],
													"text" : "== 0"
												}

											}
, 											{
												"box" : 												{
													"id" : "obj-30",
													"maxclass" : "newobj",
													"numinlets" : 2,
													"numoutlets" : 1,
													"outlettype" : [ "int" ],
													"patching_rect" : [ 180.0, 200.0, 59.0, 22.0 ],
													"text" : "&& 1"
												}

											}
, 											{
												"box" : 												{
													"id" : "obj-25",
													"maxclass" : "newobj",
													"numinlets" : 1,
													"numoutlets" : 2,
													"outlettype" : [ "bang", "int" ],
													"patching_rect" : [ 380.0, 140.0, 39.0, 22.0 ],
													"text" : "t b i"
												}

											}
, 											{
												"box" : 												{
													"id" : "obj-22",
													"maxclass" : "newobj",
													"numinlets" : 2,
													"numoutlets" : 1,
													"outlettype" : [ "int" ],
													"patching_rect" : [ 400.0, 170.0, 35.0, 22.0 ],
													"text" : "== 0"
												}

											}
, 											{
												"box" : 												{
													"id" : "obj-20",
													"maxclass" : "newobj",
													"numinlets" : 1,
													"numoutlets" : 1,
													"outlettype" : [ "" ],
													"patching_rect" : [ 180.0, 260.0, 94.0, 22.0 ],
													"text" : "prepend hidden"
												}

											}
, 											{
												"box" : 												{
													"id" : "obj-18",
													"maxclass" : "newobj",
													"numinlets" : 1,
													"numoutlets" : 1,
													"outlettype" : [ "" ],
													"patching_rect" : [ 360.0, 260.0, 94.0, 22.0 ],
													"text" : "prepend hidden"
												}

											}
, 											{
												"box" : 												{
													"id" : "obj-19",
													"maxclass" : "newobj",
													"numinlets" : 2,
													"numoutlets" : 1,
													"outlettype" : [ "int" ],
													"patching_rect" : [ 360.0, 200.0, 59.0, 22.0 ],
													"text" : "&& 1"
												}

											}
, 											{
												"box" : 												{
													"id" : "obj-17",
													"maxclass" : "newobj",
													"numinlets" : 1,
													"numoutlets" : 1,
													"outlettype" : [ "" ],
													"patching_rect" : [ 540.0, 260.0, 94.0, 22.0 ],
													"text" : "prepend hidden"
												}

											}
, 											{
												"box" : 												{
													"id" : "obj-11",
													"maxclass" : "newobj",
													"numinlets" : 2,
													"numoutlets" : 1,
													"outlettype" : [ "int" ],
													"patching_rect" : [ 540.0, 200.0, 59.0, 22.0 ],
													"text" : "&& 0"
												}

											}
, 											{
												"box" : 												{
													"angle" : 270.0,
													"bgcolor" : [ 0.290196, 0.309804, 0.301961, 0.0 ],
													"border" : 5,
													"bordercolor" : [ 0.439216, 0.74902, 0.254902, 0.701961 ],
													"hidden" : 1,
													"id" : "obj-8",
													"maxclass" : "panel",
													"mode" : 0,
													"numinlets" : 1,
													"numoutlets" : 0,
													"patching_rect" : [ 545.0, 335.0, 150.0, 110.0 ],
													"presentation" : 1,
													"presentation_rect" : [ 5.0, 5.0, 150.0, 110.0 ],
													"proportion" : 0.39,
													"rounded" : 0
												}

											}
, 											{
												"box" : 												{
													"id" : "obj-6",
													"maxclass" : "newobj",
													"numinlets" : 3,
													"numoutlets" : 3,
													"outlettype" : [ "", "", "" ],
													"patching_rect" : [ 120.0, 60.0, 213.0, 22.0 ],
													"text" : "route tally_onpreview tally_onprogram"
												}

											}
, 											{
												"box" : 												{
													"comment" : "Matrix",
													"id" : "obj-5",
													"index" : 1,
													"maxclass" : "inlet",
													"numinlets" : 0,
													"numoutlets" : 1,
													"outlettype" : [ "jit_matrix" ],
													"patching_rect" : [ 10.0, 10.0, 30.0, 30.0 ]
												}

											}
, 											{
												"box" : 												{
													"angle" : 270.0,
													"bgcolor" : [ 0.290196, 0.309804, 0.301961, 0.0 ],
													"border" : 5,
													"bordercolor" : [ 0.784314, 0.145098, 0.023529, 0.7 ],
													"hidden" : 1,
													"id" : "obj-2",
													"maxclass" : "panel",
													"mode" : 0,
													"numinlets" : 1,
													"numoutlets" : 0,
													"patching_rect" : [ 180.0, 330.0, 160.0, 120.0 ],
													"presentation" : 1,
													"presentation_rect" : [ 0.0, 0.0, 160.0, 120.0 ],
													"proportion" : 0.39,
													"rounded" : 0
												}

											}
, 											{
												"box" : 												{
													"angle" : 270.0,
													"bgcolor" : [ 0.290196, 0.309804, 0.301961, 0.0 ],
													"border" : 5,
													"bordercolor" : [ 0.439216, 0.74902, 0.254902, 0.701961 ],
													"hidden" : 1,
													"id" : "obj-4",
													"maxclass" : "panel",
													"mode" : 0,
													"numinlets" : 1,
													"numoutlets" : 0,
													"patching_rect" : [ 360.0, 330.0, 160.0, 120.0 ],
													"presentation" : 1,
													"presentation_rect" : [ 0.0, 0.0, 160.0, 120.0 ],
													"proportion" : 0.39,
													"rounded" : 0
												}

											}
, 											{
												"box" : 												{
													"angle" : 270.0,
													"bgcolor" : [ 0.290196, 0.309804, 0.301961, 0.0 ],
													"border" : 10,
													"bordercolor" : [ 0.439216, 0.74902, 0.254902, 0.701961 ],
													"id" : "obj-3",
													"maxclass" : "panel",
													"mode" : 0,
													"numinlets" : 1,
													"numoutlets" : 0,
													"patching_rect" : [ 0.0, 0.0, 4.0, 4.0 ],
													"proportion" : 0.39,
													"rounded" : 0
												}

											}
, 											{
												"box" : 												{
													"angle" : 270.0,
													"bgcolor" : [ 0.290196, 0.309804, 0.301961, 0.0 ],
													"border" : 5,
													"bordercolor" : [ 0.784314, 0.145098, 0.023529, 0.7 ],
													"hidden" : 1,
													"id" : "obj-9",
													"maxclass" : "panel",
													"mode" : 0,
													"numinlets" : 1,
													"numoutlets" : 0,
													"patching_rect" : [ 540.0, 330.0, 160.0, 120.0 ],
													"presentation" : 1,
													"presentation_rect" : [ 0.0, 0.0, 160.0, 120.0 ],
													"proportion" : 0.39,
													"rounded" : 0
												}

											}
, 											{
												"box" : 												{
													"id" : "obj-1",
													"maxclass" : "jit.pwindow",
													"numinlets" : 1,
													"numoutlets" : 2,
													"outlettype" : [ "jit_matrix", "" ],
													"patching_rect" : [ 10.0, 330.0, 160.0, 120.0 ],
													"presentation" : 1,
													"presentation_rect" : [ 0.0, 0.0, 160.0, 120.0 ]
												}

											}
 ],
										"lines" : [ 											{
												"patchline" : 												{
													"destination" : [ "obj-14", 0 ],
													"source" : [ "obj-11", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-20", 0 ],
													"source" : [ "obj-12", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-18", 0 ],
													"source" : [ "obj-13", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-17", 0 ],
													"source" : [ "obj-14", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-11", 1 ],
													"source" : [ "obj-15", 1 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-11", 0 ],
													"source" : [ "obj-15", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-8", 0 ],
													"order" : 0,
													"source" : [ "obj-17", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-9", 0 ],
													"order" : 1,
													"source" : [ "obj-17", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-4", 0 ],
													"source" : [ "obj-18", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-13", 0 ],
													"source" : [ "obj-19", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-2", 0 ],
													"source" : [ "obj-20", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-19", 1 ],
													"source" : [ "obj-22", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-19", 0 ],
													"source" : [ "obj-25", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-22", 0 ],
													"source" : [ "obj-25", 1 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-29", 0 ],
													"source" : [ "obj-28", 1 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-30", 0 ],
													"source" : [ "obj-28", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-30", 1 ],
													"source" : [ "obj-29", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-12", 0 ],
													"source" : [ "obj-30", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-6", 0 ],
													"source" : [ "obj-47", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-1", 0 ],
													"source" : [ "obj-5", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-11", 0 ],
													"midpoints" : [ 129.5, 104.0, 549.5, 104.0 ],
													"order" : 0,
													"source" : [ "obj-6", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-15", 0 ],
													"midpoints" : [ 226.5, 93.0, 569.5, 93.0 ],
													"order" : 0,
													"source" : [ "obj-6", 1 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-19", 0 ],
													"midpoints" : [ 129.5, 104.0, 369.5, 104.0 ],
													"order" : 1,
													"source" : [ "obj-6", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-25", 0 ],
													"midpoints" : [ 226.5, 94.0, 389.5, 94.0 ],
													"order" : 1,
													"source" : [ "obj-6", 1 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-28", 0 ],
													"midpoints" : [ 129.5, 103.0, 209.5, 103.0 ],
													"order" : 2,
													"source" : [ "obj-6", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-30", 0 ],
													"midpoints" : [ 226.5, 92.0, 189.5, 92.0 ],
													"order" : 2,
													"source" : [ "obj-6", 1 ]
												}

											}
 ]
									}
,
									"patching_rect" : [ 480.0, 510.0, 160.0, 120.0 ],
									"viewvisibility" : 1
								}

							}
, 							{
								"box" : 								{
									"hidden" : 1,
									"id" : "obj-30",
									"linecount" : 3,
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 560.0, 660.0, 110.0, 50.0 ],
									"text" : ";\r\nmax launchbrowser $1"
								}

							}
, 							{
								"box" : 								{
									"hidden" : 1,
									"id" : "obj-32",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"patching_rect" : [ 560.0, 630.0, 95.0, 22.0 ],
									"text" : "route runtimeurl"
								}

							}
, 							{
								"box" : 								{
									"hidden" : 1,
									"id" : "obj-19",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 340.0, 40.0, 81.0, 22.0 ],
									"text" : "getruntimeurl"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-33",
									"linecount" : 2,
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 20.0, 254.0, 560.0, 34.0 ],
									"style" : "helpfile_label",
									"text" : "This object requires Newtek NDI Runtime or Newtek NDI Tools to be installed in order to function. Please download from the link in the top right."
								}

							}
, 							{
								"box" : 								{
									"angle" : 270.0,
									"bgcolor" : [ 0.784314, 0.145098, 0.023529, 0.36 ],
									"id" : "obj-10",
									"maxclass" : "panel",
									"mode" : 0,
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 10.0, 250.0, 560.0, 40.0 ],
									"proportion" : 0.39,
									"rounded" : 20
								}

							}
, 							{
								"box" : 								{
									"align" : 0,
									"bgcolor" : [ 0.290196, 0.309804, 0.301961, 0.0 ],
									"id" : "obj-31",
									"maxclass" : "textbutton",
									"numinlets" : 1,
									"numoutlets" : 3,
									"outlettype" : [ "", "", "int" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 490.0, 10.0, 180.0, 20.0 ],
									"text" : "Download NewTek NDI Runtime",
									"textjustification" : 0,
									"textoncolor" : [ 0.011765, 0.396078, 0.752941, 1.0 ],
									"underline" : 1
								}

							}
, 							{
								"box" : 								{
									"align" : 0,
									"bgcolor" : [ 0.290196, 0.309804, 0.301961, 0.0 ],
									"id" : "obj-29",
									"maxclass" : "textbutton",
									"numinlets" : 1,
									"numoutlets" : 3,
									"outlettype" : [ "", "", "int" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 490.0, 34.0, 110.0, 16.0 ],
									"text" : "NewTek NDI Tools",
									"textjustification" : 0,
									"textoncolor" : [ 0.011765, 0.396078, 0.752941, 1.0 ],
									"underline" : 1
								}

							}
, 							{
								"box" : 								{
									"hidden" : 1,
									"id" : "obj-28",
									"linecount" : 2,
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 340.0, 80.0, 213.0, 36.0 ],
									"text" : ";\r\nmax launchbrowser https://ndi.tv/tools/"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-5",
									"linecount" : 3,
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 396.0, 350.0, 279.0, 48.0 ],
									"style" : "helpfile_label",
									"text" : "Open an NDI receiver on the local network (Studio Monitor is available as part of Newtek NDI Tools) and browse for the source name. "
								}

							}
, 							{
								"box" : 								{
									"bubble" : 1,
									"fontname" : "Arial",
									"fontsize" : 13.0,
									"id" : "obj-17",
									"linecount" : 3,
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 325.0, 652.0, 160.0, 55.0 ],
									"text" : "Tally status attributes are output via dump outlet when changed"
								}

							}
, 							{
								"box" : 								{
									"bubble" : 1,
									"fontname" : "Arial",
									"fontsize" : 13.0,
									"id" : "obj-13",
									"linecount" : 6,
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 295.0, 470.0, 153.0, 100.0 ],
									"text" : "Video is sent at a fixed framerate which is not connected to the rate at which matrix messages are sent to the object."
								}

							}
, 							{
								"box" : 								{
									"attr" : "framerate",
									"id" : "obj-8",
									"lock" : 1,
									"maxclass" : "attrui",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 130.0, 510.0, 160.0, 22.0 ]
								}

							}
, 							{
								"box" : 								{
									"border" : 0,
									"filename" : "helpargs.js",
									"id" : "obj-4",
									"ignoreclick" : 1,
									"jsarguments" : [ "jit.ndi.send~" ],
									"maxclass" : "jsui",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 200.0, 580.0, 171.6719970703125, 39.0 ]
								}

							}
, 							{
								"box" : 								{
									"bubble" : 1,
									"fontname" : "Arial",
									"fontsize" : 13.0,
									"id" : "obj-27",
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 190.0, 700.0, 100.0, 25.0 ],
									"text" : "On Program"
								}

							}
, 							{
								"box" : 								{
									"bubble" : 1,
									"fontname" : "Arial",
									"fontsize" : 13.0,
									"id" : "obj-51",
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 50.0, 700.0, 100.0, 25.0 ],
									"text" : "On Preview"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-26",
									"linecount" : 2,
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 396.0, 304.0, 210.0, 34.0 ],
									"style" : "helpfile_label",
									"text" : "Switch audio processing on to send audio."
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-25",
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 76.0, 310.0, 210.0, 20.0 ],
									"style" : "helpfile_label",
									"text" : "Toggle on qmetro"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-56",
									"linecount" : 2,
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 210.0, 380.0, 126.0, 34.0 ],
									"style" : "helpfile_label",
									"text" : "Start a movie playing as a test source"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-23",
									"maxclass" : "ezdac~",
									"numinlets" : 2,
									"numoutlets" : 0,
									"patching_rect" : [ 310.0, 310.0, 45.0, 45.0 ]
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-18",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 40.0, 390.0, 89.0, 22.0 ],
									"text" : "read bball.mov"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-16",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 140.0, 390.0, 35.0, 22.0 ],
									"text" : "read"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-14",
									"maxclass" : "toggle",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "int" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 20.0, 310.0, 24.0, 24.0 ]
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-12",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "bang" ],
									"patching_rect" : [ 20.0, 350.0, 81.0, 22.0 ],
									"text" : "qmetro 30 hz"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-11",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 4,
									"outlettype" : [ "signal", "signal", "jit_matrix", "" ],
									"patching_rect" : [ 20.0, 430.0, 62.0, 22.0 ],
									"text" : "jit.movie~"
								}

							}
, 							{
								"box" : 								{
									"checkedcolor" : [ 0.784314, 0.145098, 0.023529, 1.0 ],
									"id" : "obj-7",
									"ignoreclick" : 1,
									"maxclass" : "toggle",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "int" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 160.0, 700.0, 24.0, 24.0 ]
								}

							}
, 							{
								"box" : 								{
									"checkedcolor" : [ 0.439216, 0.74902, 0.254902, 1.0 ],
									"id" : "obj-6",
									"ignoreclick" : 1,
									"maxclass" : "toggle",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "int" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 20.0, 700.0, 24.0, 24.0 ]
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-3",
									"maxclass" : "newobj",
									"numinlets" : 3,
									"numoutlets" : 3,
									"outlettype" : [ "", "", "" ],
									"patching_rect" : [ 20.0, 670.0, 298.0, 22.0 ],
									"text" : "route tally_onpreview tally_onprogram"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-1",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 20.0, 580.0, 158.0, 22.0 ],
									"text" : "jit.ndi.send~ MaxNDISender"
								}

							}
, 							{
								"box" : 								{
									"border" : 0,
									"filename" : "helpdetails.js",
									"id" : "obj-2",
									"ignoreclick" : 1,
									"jsarguments" : [ "jit.ndi.send~", 87 ],
									"maxclass" : "jsui",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 10.0, 10.0, 560.0, 230.0 ]
								}

							}
, 							{
								"box" : 								{
									"background" : 1,
									"bgcolor" : [ 1.0, 0.788235, 0.470588, 1.0 ],
									"fontface" : 1,
									"hint" : "",
									"id" : "obj-24",
									"ignoreclick" : 1,
									"legacytextcolor" : 1,
									"maxclass" : "textbutton",
									"numinlets" : 1,
									"numoutlets" : 3,
									"outlettype" : [ "", "", "int" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 376.0, 310.0, 20.0, 20.0 ],
									"rounded" : 60.0,
									"text" : "3",
									"textcolor" : [ 0.34902, 0.34902, 0.34902, 1.0 ]
								}

							}
, 							{
								"box" : 								{
									"background" : 1,
									"bgcolor" : [ 1.0, 0.788235, 0.470588, 1.0 ],
									"fontface" : 1,
									"hint" : "",
									"id" : "obj-9",
									"ignoreclick" : 1,
									"legacytextcolor" : 1,
									"maxclass" : "textbutton",
									"numinlets" : 1,
									"numoutlets" : 3,
									"outlettype" : [ "", "", "int" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 376.0, 360.0, 20.0, 20.0 ],
									"rounded" : 60.0,
									"text" : "4",
									"textcolor" : [ 0.34902, 0.34902, 0.34902, 1.0 ]
								}

							}
, 							{
								"box" : 								{
									"background" : 1,
									"bgcolor" : [ 1.0, 0.788235, 0.470588, 1.0 ],
									"fontface" : 1,
									"hint" : "",
									"id" : "obj-21",
									"ignoreclick" : 1,
									"legacytextcolor" : 1,
									"maxclass" : "textbutton",
									"numinlets" : 1,
									"numoutlets" : 3,
									"outlettype" : [ "", "", "int" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 190.0, 390.0, 20.0, 20.0 ],
									"rounded" : 60.0,
									"text" : "1",
									"textcolor" : [ 0.34902, 0.34902, 0.34902, 1.0 ]
								}

							}
, 							{
								"box" : 								{
									"background" : 1,
									"bgcolor" : [ 1.0, 0.788235, 0.470588, 1.0 ],
									"fontface" : 1,
									"hint" : "",
									"id" : "obj-50",
									"ignoreclick" : 1,
									"legacytextcolor" : 1,
									"maxclass" : "textbutton",
									"numinlets" : 1,
									"numoutlets" : 3,
									"outlettype" : [ "", "", "int" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 56.0, 310.0, 20.0, 20.0 ],
									"rounded" : 60.0,
									"text" : "2",
									"textcolor" : [ 0.34902, 0.34902, 0.34902, 1.0 ]
								}

							}
 ],
						"lines" : [ 							{
								"patchline" : 								{
									"destination" : [ "obj-15", 1 ],
									"midpoints" : [ 29.5, 642.0, 453.0, 642.0, 453.0, 482.0, 630.5, 482.0 ],
									"order" : 1,
									"source" : [ "obj-1", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-3", 0 ],
									"order" : 2,
									"source" : [ "obj-1", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-32", 0 ],
									"hidden" : 1,
									"order" : 0,
									"source" : [ "obj-1", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-1", 0 ],
									"midpoints" : [ 58.166666666666671, 496.0, 29.5, 496.0 ],
									"order" : 0,
									"source" : [ "obj-11", 2 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-15", 0 ],
									"midpoints" : [ 58.166666666666671, 459.0, 489.5, 459.0 ],
									"order" : 1,
									"source" : [ "obj-11", 2 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-20", 1 ],
									"midpoints" : [ 43.833333333333336, 472.0, 100.5, 472.0 ],
									"source" : [ "obj-11", 1 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-20", 0 ],
									"midpoints" : [ 29.5, 483.0, 49.5, 483.0 ],
									"source" : [ "obj-11", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-11", 0 ],
									"source" : [ "obj-12", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-12", 0 ],
									"source" : [ "obj-14", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-11", 0 ],
									"midpoints" : [ 149.5, 423.0, 29.5, 423.0 ],
									"source" : [ "obj-16", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-11", 0 ],
									"source" : [ "obj-18", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-1", 0 ],
									"hidden" : 1,
									"source" : [ "obj-19", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-1", 0 ],
									"midpoints" : [ 49.5, 550.0, 29.5, 550.0 ],
									"source" : [ "obj-20", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-28", 0 ],
									"hidden" : 1,
									"source" : [ "obj-29", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-6", 0 ],
									"source" : [ "obj-3", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-7", 0 ],
									"source" : [ "obj-3", 1 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-19", 0 ],
									"hidden" : 1,
									"source" : [ "obj-31", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-30", 0 ],
									"hidden" : 1,
									"source" : [ "obj-32", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-37", 0 ],
									"hidden" : 1,
									"source" : [ "obj-38", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-1", 0 ],
									"midpoints" : [ 139.5, 570.0, 29.5, 570.0 ],
									"source" : [ "obj-8", 0 ]
								}

							}
 ],
						"styles" : [ 							{
								"name" : "AudioStatus_Menu",
								"default" : 								{
									"bgfillcolor" : 									{
										"type" : "color",
										"color" : [ 0.294118, 0.313726, 0.337255, 1 ],
										"color1" : [ 0.454902, 0.462745, 0.482353, 0.0 ],
										"color2" : [ 0.290196, 0.309804, 0.301961, 1.0 ],
										"angle" : 270.0,
										"proportion" : 0.39,
										"autogradient" : 0
									}

								}
,
								"parentstyle" : "",
								"multi" : 0
							}
 ]
					}
,
					"patching_rect" : [ 10.0, 80.0, 49.0, 22.0 ],
					"saved_object_attributes" : 					{
						"description" : "",
						"digest" : "",
						"globalpatchername" : "",
						"tags" : ""
					}
,
					"text" : "p basic",
					"varname" : "basic_tab"
				}

			}
, 			{
				"box" : 				{
					"border" : 0,
					"filename" : "helpname.js",
					"id" : "obj-8",
					"ignoreclick" : 1,
					"jsarguments" : [ "jit.matrix" ],
					"maxclass" : "jsui",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 10.0, 10.0, 190.016006469726563, 57.600002288818359 ]
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-9",
					"maxclass" : "newobj",
					"numinlets" : 0,
					"numoutlets" : 0,
					"patcher" : 					{
						"fileversion" : 1,
						"appversion" : 						{
							"major" : 8,
							"minor" : 1,
							"revision" : 11,
							"architecture" : "x64",
							"modernui" : 1
						}
,
						"classnamespace" : "box",
						"rect" : [ 0.0, 26.0, 687.0, 809.0 ],
						"bglocked" : 0,
						"openinpresentation" : 0,
						"default_fontsize" : 12.0,
						"default_fontface" : 0,
						"default_fontname" : "Arial",
						"gridonopen" : 1,
						"gridsize" : [ 15.0, 15.0 ],
						"gridsnaponopen" : 1,
						"objectsnaponopen" : 1,
						"statusbarvisible" : 2,
						"toolbarvisible" : 1,
						"lefttoolbarpinned" : 0,
						"toptoolbarpinned" : 0,
						"righttoolbarpinned" : 0,
						"bottomtoolbarpinned" : 0,
						"toolbars_unpinned_last_save" : 0,
						"tallnewobj" : 0,
						"boxanimatetime" : 200,
						"enablehscroll" : 1,
						"enablevscroll" : 1,
						"devicewidth" : 0.0,
						"description" : "",
						"digest" : "",
						"tags" : "",
						"style" : "",
						"subpatcher_template" : "",
						"showontab" : 1,
						"assistshowspatchername" : 0,
						"boxes" : [  ],
						"lines" : [  ]
					}
,
					"patching_rect" : [ 205.0, 205.0, 50.0, 22.0 ],
					"saved_object_attributes" : 					{
						"description" : "",
						"digest" : "",
						"globalpatchername" : "",
						"tags" : ""
					}
,
					"text" : "p ?",
					"varname" : "q_tab"
				}

			}
, 			{
				"box" : 				{
					"border" : 0,
					"filename" : "helpname.js",
					"id" : "obj-6",
					"ignoreclick" : 1,
					"jsarguments" : [ "jit.ndi.send~" ],
					"maxclass" : "jsui",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 10.0, 10.0, 260.720001220703125, 57.600002288818359 ]
				}

			}
, 			{
				"box" : 				{
					"border" : 0,
					"filename" : "helpname.js",
					"id" : "obj-10",
					"ignoreclick" : 1,
					"jsarguments" : [ "jit.ndi.send~" ],
					"maxclass" : "jsui",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 10.0, 10.0, 260.720001220703125, 57.600002288818359 ]
				}

			}
 ],
		"lines" : [  ],
		"dependency_cache" : [ 			{
				"name" : "helpname.js",
				"bootpath" : "C74:/help/resources",
				"type" : "TEXT",
				"implicit" : 1
			}
, 			{
				"name" : "helpdetails.js",
				"bootpath" : "C74:/help/resources",
				"type" : "TEXT",
				"implicit" : 1
			}
, 			{
				"name" : "helpargs.js",
				"bootpath" : "C74:/help/resources",
				"type" : "TEXT",
				"implicit" : 1
			}
, 			{
				"name" : "Logo_Google.png",
				"bootpath" : "~/Dropbox/Pixsper/Branding",
				"patcherrelativepath" : "../../../../../Dropbox/Pixsper/Branding",
				"type" : "PNG",
				"implicit" : 1
			}
, 			{
				"name" : "helpstarter.js",
				"bootpath" : "C74:/help/resources",
				"type" : "TEXT",
				"implicit" : 1
			}
, 			{
				"name" : "jit.ndi.send~.mxe64",
				"type" : "mx64"
			}
, 			{
				"name" : "jit.movie~.mxe64",
				"type" : "mx64"
			}
 ],
		"autosave" : 0,
		"styles" : [ 			{
				"name" : "AudioStatus_Menu",
				"default" : 				{
					"bgfillcolor" : 					{
						"type" : "color",
						"color" : [ 0.294118, 0.313726, 0.337255, 1 ],
						"color1" : [ 0.454902, 0.462745, 0.482353, 0.0 ],
						"color2" : [ 0.290196, 0.309804, 0.301961, 1.0 ],
						"angle" : 270.0,
						"proportion" : 0.39,
						"autogradient" : 0
					}

				}
,
				"parentstyle" : "",
				"multi" : 0
			}
 ]
	}

}
