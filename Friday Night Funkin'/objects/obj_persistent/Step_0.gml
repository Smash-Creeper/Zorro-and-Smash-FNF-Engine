if variable_global_exists("settings") {
	if ds_map_default(global.settings,"Discord Status",1) {
		if statuse= 0 {
			statuse= 1;
			event_user(0);
		}
		np_update();
	}else{
		np_clearpresence();
		statuse= 0;
	}
}
if variable_global_exists("bpmstream") || instance_exists(objmenu_freeplay) {
	var _bpm= global.bpmstream;
	if instance_exists(objmenu_freeplay) {
		_bpm= objmenu_freeplay.bpm[global.freeplaysel];
	}
	if _bpm> 0 { //Trying to not have crashes!
		if bpmtimer> (60/_bpm) {
			camz= 10;
			bpmtimer= 0;
		}else{
			bpmtimer+= delta_time/1000000;
		}
	}
	
	if audio_exists(global.bgmstream) {
	if !bgm_is_playing(10000) {
		bgm_play(global.bgmstream,10000);
		if audio_exists(global.vocstream) {
			if bgm_is_playing(10001) {
				bgm_stop(10001);
			}
			bgm_play(global.vocstream,10001);
		}
	}
}else{
	if audio_exists(global.vocstream) {
		if !bgm_is_playing(10001) {
			bgm_play(global.vocstream,10001);
		}
	}
}
	
	var temp= min((camw-(camz*2))/camw,(camh-(camz*2))/camh);
	camera_set_view_pos(view_camera[0],(camw-(temp*camw))/2,(camh-(temp*camh))/2);
	camera_set_view_size(view_camera[0],temp*camw,temp*camh);
	camz= lerp(camz,camn,get_delta_timer(0.2,60));
}

if variable_global_exists("settings") {
	var varch= 0;
	if check_input(INP_ADD_VOL,INPM_PRESSED) {
		if ds_map_default(global.settings,"Volume",100)!= 100 {bgm_play(sfx_click_text,2,1);}
		global.settings[?"Volume"]= ds_map_default(global.settings,"Volume",100)+5;
		varch= 1;
	}
	if check_input(INP_SUBTRACT_VOL,INPM_PRESSED) {
		if ds_map_default(global.settings,"Volume",100)!= 0 {bgm_play(sfx_click_text,2,1);}
		global.settings[?"Volume"]= ds_map_default(global.settings,"Volume",100)-5;
		varch= 1;
	}
	global.settings[?"Volume"]= clamp(ds_map_default(global.settings,"Volume",100),0,100);
	if varch= 1 {
		drawvol= 1;
		volt= 120;
		for (var i= 0; i< audio_get_listener_count(); i++;) {
			var map= audio_get_listener_info(i);
			if map!= -1 {
				audio_set_master_gain(map[?"index"],ds_map_default(global.settings,"Volume",100)/100);
				ds_map_destroy(map);
			}
		}
	}
}
