///@desc Buttons?

#region Tooltips (left)
var txt= "BGM Doesn't exist.";
if audio_exists(bgm) {
	var time= "0.00";
	if bgm_is_playing(20000) {
		time= string_format(max(bgm_get_track_position(20000),bgm_is_playing(20001)? bgm_get_track_position(20001): -1),0,2);
	}
	var t= audio_sound_length(bgm);
	if audio_exists(voc) {
		t= max(t,audio_sound_length(voc));
	}
	txt= time+"s / "+string_format(t,0,2)+"s";
	if !audio_exists(voc) {txt+= "\nVOICES Don't exist.";}
}else{
	if !audio_exists(voc) {txt+= "\nNeither does VOICES.";}
}
draw_text(5,55,txt);
draw_text(5,55+string_height(txt)+5,"");
#endregion
#region Set BGM Button
var txt= "Set BGM";
var _x= room_width-10-string_width(txt);
var _y= 10;
var bbx_w= 4;
var bbx_h= 4;
var boxcol= c_dkgray;
if mouse_x>= _x-bbx_w && mouse_y>= _y-bbx_h {
	if mouse_x<= _x+string_width(txt)+bbx_w && mouse_y<= _y+string_height(txt)+bbx_h {
		if mouse_check_button_pressed(mb_left) {
			var dir= get_open_filename_ext("Audio Files (.ogg)|*.ogg;","","","Select a audio file!");
			if dir!= "" {
				if file_exists(dir) {
					if string_pos(APP_PATH,dir)> 0 {
						global.mapinfo[?"BGM Path"]= string_copy(dir,string_pos(APP_PATH,dir),string_length(dir));
					}else{
						show_message("Keep in mind everything should be within the game's folder.\nAfter you've finished up, save the charting,\nput the file in the game's folder and\nreload it again for saving.");
					}
					if audio_exists(bgm) {
						if bgm_is_playing(20000) {
							var pos= bgm_get_track_position(20000);
							var ispaused= bgm_is_paused(20000);
							bgm_stop(20000);
							audio_destroy_stream(bgm);
							bgm= audio_create_stream(dir);
							if !ispaused {
									bgm_play(bgm,20000,1);
									bgm_set_track_position(20000,pos);
								}
						}else{
							bgm= audio_create_stream(dir);
							if bgm_is_playing(20001) {
								var pos= bgm_get_track_position(20001);
								var ispaused= bgm_is_paused(20001);
								if !ispaused {
									bgm_play(bgm,20000,1);
									bgm_set_track_position(20000,pos);
								}
							}
						}
					}else{
						bgm= audio_create_stream(dir);
						if bgm_is_playing(20001) {
							var pos= bgm_get_track_position(20001);
							var ispaused= bgm_is_paused(20001);
							if !ispaused {
								bgm_play(bgm,20000,1);
								bgm_set_track_position(20000,pos);
							}
						}
					}
				}
			}
		}
	}
}
draw_rectangle_color(_x-bbx_w,_y-bbx_h,_x+string_width(txt)+bbx_w,_y+string_height(txt)+bbx_h,boxcol,boxcol,boxcol,boxcol,0);
draw_text(_x,_y,txt);
#endregion
#region Set VOICES Button
var txt= "Set VOICES";
var _x= room_width-10-string_width(txt);
var _y= 45;
var bbx_w= 4;
var bbx_h= 4;
var boxcol= c_dkgray;
if mouse_x>= _x-bbx_w && mouse_y>= _y-bbx_h {
	if mouse_x<= _x+string_width(txt)+bbx_w && mouse_y<= _y+string_height(txt)+bbx_h {
		if mouse_check_button_pressed(mb_left) {
			var dir= get_open_filename_ext("Audio Files (.ogg)|*.ogg;","","","Select a audio file!");
			if dir!= "" {
				if file_exists(dir) {
					if string_pos(APP_PATH,dir)> 0 {
						global.mapinfo[?"VOICES Path"]= string_copy(dir,string_pos(APP_PATH,dir),string_length(dir));
					}else{
						show_message("Keep in mind everything should be within the game's folder.\nAfter you've finished up, save the charting,\nput the file in the game's folder and\nreload it again for saving.");
					}
					if audio_exists(voc) {
						if bgm_is_playing(20001) {
							var pos= bgm_get_track_position(20001);
							var ispaused= bgm_is_paused(20001);
							bgm_stop(20001);
							audio_destroy_stream(voc);
							voc= audio_create_stream(dir);
							if !ispaused {
									bgm_play(voc,20001,1);
									bgm_set_track_position(20001,pos);
								}
						}else{
							voc= audio_create_stream(dir);
							if bgm_is_playing(20000) {
								var pos= bgm_get_track_position(20000);
								var ispaused= bgm_is_paused(20000);
								if !ispaused {
									bgm_play(voc,20001,1);
									bgm_set_track_position(20001,pos);
								}
							}
						}
					}else{
						voc= audio_create_stream(dir);
						if bgm_is_playing(20000) {
							var pos= bgm_get_track_position(20000);
							var ispaused= bgm_is_paused(20000);
							if !ispaused {
									bgm_play(voc,20001,1);
									bgm_set_track_position(20001,pos);
								}
						}
					}
				}
			}
		}
	}
}
draw_rectangle_color(_x-bbx_w,_y-bbx_h,_x+string_width(txt)+bbx_w,_y+string_height(txt)+bbx_h,boxcol,boxcol,boxcol,boxcol,0);
draw_text(_x,_y,txt);
#endregion
#region BPM Button
var txt= "BPM: "+string(bpm);
var _x= room_width-10-string_width(txt);
var _y= 80;
var bbx_w= 4;
var bbx_h= 4;
var boxcol= c_dkgray;
if mouse_x>= _x-bbx_w && mouse_y>= _y-bbx_h {
	if mouse_x<= _x+string_width(txt)+bbx_w && mouse_y<= _y+string_height(txt)+bbx_h {
		if mouse_check_button_pressed(mb_left) {
			var _bpm= get_integer("Set BPM\nCurrent BPM: "+string(bpm),bpm);
			if _bpm!= undefined {
				bpm= _bpm;
				global.mapinfo[?"BPM"]= _bpm;
			}
		}
	}
}
draw_rectangle_color(_x-bbx_w,_y-bbx_h,_x+string_width(txt)+bbx_w,_y+string_height(txt)+bbx_h,boxcol,boxcol,boxcol,boxcol,0);
draw_text(_x,_y,txt);
#endregion
#region Chunk size Button
var txt= "Chunk size: "+string(chunksize);
var _x= room_width-10-string_width(txt);
var _y= 115;
var bbx_w= 4;
var bbx_h= 4;
var boxcol= c_dkgray;
if mouse_x>= _x-bbx_w && mouse_y>= _y-bbx_h {
	if mouse_x<= _x+string_width(txt)+bbx_w && mouse_y<= _y+string_height(txt)+bbx_h {
		if mouse_check_button_pressed(mb_left) {
			var _chunksize= get_integer("Set Chunk size\nCurrent Chunk size: "+string(chunksize),chunksize);
			if _chunksize!= undefined {
				_chunksize= clamp(floor(_chunksize/2)*2,1,4096); //Dimissing lag!!
				chunksize= _chunksize;
				global.mapinfo[?"Chunksize"]= _chunksize;
			}
		}
	}
}
draw_rectangle_color(_x-bbx_w,_y-bbx_h,_x+string_width(txt)+bbx_w,_y+string_height(txt)+bbx_h,boxcol,boxcol,boxcol,boxcol,0);
draw_text(_x,_y,txt);
#endregion
#region Note count Button
var txt= "Note count: "+string(notecount);
var _x= room_width-10-string_width(txt);
var _y= 150;
var bbx_w= 4;
var bbx_h= 4;
var boxcol= c_dkgray;
if mouse_x>= _x-bbx_w && mouse_y>= _y-bbx_h {
	if mouse_x<= _x+string_width(txt)+bbx_w && mouse_y<= _y+string_height(txt)+bbx_h {
		if mouse_check_button_pressed(mb_left) {
			var _notc= get_integer("Set Note count\nCurrent Note count: "+string(notecount),notecount);
			if _notc!= undefined {
				notecount= _notc;
				global.mapinfo[?"Notecount"]= _notc;
			}
		}
	}
}
draw_rectangle_color(_x-bbx_w,_y-bbx_h,_x+string_width(txt)+bbx_w,_y+string_height(txt)+bbx_h,boxcol,boxcol,boxcol,boxcol,0);
draw_text(_x,_y,txt);
#endregion
#region Chart count Button
var txt= "Chart count: "+string(charts);
var _x= room_width-10-string_width(txt);
var _y= 185;
var bbx_w= 4;
var bbx_h= 4;
var boxcol= c_dkgray;
if mouse_x>= _x-bbx_w && mouse_y>= _y-bbx_h {
	if mouse_x<= _x+string_width(txt)+bbx_w && mouse_y<= _y+string_height(txt)+bbx_h {
		if mouse_check_button_pressed(mb_left) {
			var _chr= get_integer("Set Chart count\nCurrent Chart count: "+string(charts),charts);
			if _chr!= undefined {
				charts= _chr;
				global.mapinfo[?"Chart Count"]= _chr;
			}
		}
	}
}
draw_rectangle_color(_x-bbx_w,_y-bbx_h,_x+string_width(txt)+bbx_w,_y+string_height(txt)+bbx_h,boxcol,boxcol,boxcol,boxcol,0);
draw_text(_x,_y,txt);
#endregion
#region Notespeed Button
var txt= "Notespeed: "+string(notespeed);
var _x= room_width-10-string_width(txt);
var _y= 220;
var bbx_w= 4;
var bbx_h= 4;
var boxcol= c_dkgray;
if mouse_x>= _x-bbx_w && mouse_y>= _y-bbx_h {
	if mouse_x<= _x+string_width(txt)+bbx_w && mouse_y<= _y+string_height(txt)+bbx_h {
		if mouse_check_button_pressed(mb_left) {
			var _nts= get_integer("Set Notespeed\nCurrent Notespeed: "+string(notespeed),notespeed);
			if _nts!= undefined {
				notespeed= _nts;
				global.mapinfo[?"Notespeed"]= _nts;
			}
		}
	}
}
draw_rectangle_color(_x-bbx_w,_y-bbx_h,_x+string_width(txt)+bbx_w,_y+string_height(txt)+bbx_h,boxcol,boxcol,boxcol,boxcol,0);
draw_text(_x,_y,txt);
#endregion
#region Next Chart Preview
var txt= "NCH ["+(chartp? "ON": "OFF")+"]";
var _x= room_width-10-string_width(txt);
var _y= 255;
var bbx_w= 4;
var bbx_h= 4;
var boxcol= c_dkgray;
if mouse_x>= _x-bbx_w && mouse_y>= _y-bbx_h {
	if mouse_x<= _x+string_width(txt)+bbx_w && mouse_y<= _y+string_height(txt)+bbx_h {
		if mouse_check_button_pressed(mb_left) {
			var _nts= get_integer("Set Notespeed\nCurrent Notespeed: "+string(notespeed),notespeed);
			if _nts!= undefined {
				notespeed= _nts;
				global.mapinfo[?"Notespeed"]= _nts;
			}
		}
	}
}
draw_rectangle_color(_x-bbx_w,_y-bbx_h,_x+string_width(txt)+bbx_w,_y+string_height(txt)+bbx_h,boxcol,boxcol,boxcol,boxcol,0);
draw_text(_x,_y,txt);
#endregion
