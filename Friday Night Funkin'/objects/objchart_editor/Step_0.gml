if keyboard_check_pressed(vk_space) {
	if bgm_is_playing(20000) {
		if bgm_is_paused(20000) {
			var t= bgm_get_track_position(20000);
			if audio_sound_length(bgm_get_id(20001))>= t {
				if !bgm_is_playing(20001) {
					bgm_play(voc,20001,1);
				}
				bgm_set_track_position(20001,t);
				bgm_resume(20001);
			}
			bgm_resume(20000);
		}else{
			bgm_pause(20000);
			if !bgm_is_playing(20001) {
				bgm_play(voc,20001,1);
				bgm_set_track_position(20000,bgm_get_track_position(20000));
			}
			bgm_pause(20001);
		}
	}else{
		bgm_play(bgm,20000,1);
		bgm_play(voc,20001,1);
	}
}
if mouse_wheel_down() {
	if !bgm_is_playing(20000) {bgm_play(bgm,20000,1);}
	if !bgm_is_playing(20001) {bgm_play(voc,20001,1);}
	bgm_set_track_position(20000,bgm_get_track_position(20000)+0.15);
	bgm_set_track_position(20001,bgm_get_track_position(20001)+0.15);
	bgm_pause(20000);
	bgm_pause(20001);
}
if mouse_wheel_up() {
	if audio_exists(bgm) {if !bgm_is_playing(20000) {bgm_play(bgm,20000,1);}}
	if audio_exists(voc) {if !bgm_is_playing(20001) {bgm_play(voc,20001,1);}}
	bgm_set_track_position(20000,max(bgm_get_track_position(20000)-0.15,0));
	bgm_set_track_position(20001,max(bgm_get_track_position(20001)-0.15,0));
	bgm_pause(20000);
	bgm_pause(20001);
}
