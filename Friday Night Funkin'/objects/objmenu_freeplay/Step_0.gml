if check_input(INP_EXIT,INPM_PRESSED) {
	if room_fade(ROOMFADE_SPEED,rm_menu)!= -1 {
		bgm_play(sfx_cancel_menu,1,1);
		global.bgmstream= bgmd[global.freeplaysel];
		global.vocstream= vocd[global.freeplaysel];
		global.bpmstream= bpm[global.freeplaysel];
		/*bgm_set_volume(10000,0,600);
		bgm_set_volume(10001,0,600);*/
	}
}

if check_input(INP_UI_DOWN,INPM_PRESSED) {
	global.freeplaysel++;
	bgm_play(sfx_scroll_menu,1,1);
	//Reserved for only this!
	bgm_stop(10000);
	bgm_stop(10001);
}
if check_input(INP_UI_UP,INPM_PRESSED) {
	global.freeplaysel--;
	bgm_play(sfx_scroll_menu,1,1);
	//Reserved for only this!
	bgm_stop(10000);
	bgm_stop(10001);
}
if global.freeplaysel< 0 {global.freeplaysel= maxsel;}
if global.freeplaysel> maxsel {global.freeplaysel= 0;}

if bgmp[global.freeplaysel]!= "" {
	if !audio_exists(bgmd[global.freeplaysel]) {
		bgmd[global.freeplaysel]= audio_create_stream(bgmp[global.freeplaysel]);
	}
}

if vocp[global.freeplaysel]!= "" {
	if !audio_exists(vocd[global.freeplaysel]) {
		vocd[global.freeplaysel]= audio_create_stream(vocp[global.freeplaysel]);
	}
}
if audio_exists(bgmd[global.freeplaysel]) {
	if !bgm_is_playing(10000) {
		bgm_play(bgmd[global.freeplaysel],10000);
		if bgmmenus!= -1 {
			bgm_set_track_position(10000,bgmmenus);
			bgmmenus= -1;
		}
		if audio_exists(vocd[global.freeplaysel]) {
			if bgm_is_playing(10001) {
				bgm_stop(10001);
			}
			bgm_play(vocd[global.freeplaysel],10001);
			if vocmenus!= -1 {
				bgm_set_track_position(10001,vocmenus);
				vocmenus= -1;
			}
		}
	}
}else{
	if audio_exists(vocd[global.freeplaysel]) {
		if !bgm_is_playing(10001) {
			bgm_play(vocd[global.freeplaysel],10001);
			if vocmenus!= -1 {
				bgm_set_track_position(10001,vocmenus);
				vocmenus= -1;
			}
		}
	}
}
if bgm_is_playing(10000) || bgm_is_playing(10001) {
	if bgm_is_playing(0) {
		if audio_get_name(bgm_get_id(0))= "bgm_menu" {
			bgm_set_volume(0,0,600);
		}
	}
}
