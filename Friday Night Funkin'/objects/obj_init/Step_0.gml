if bgm_is_playing(0) {
	var timer= bgm_get_track_position(0);
	switch curtext {
		case 0: if timer>= 1.8 {curtext++;} break;
		case 1: if timer>= 2.3 {curtext++;} break;
		case 2: if timer>= 4.1 {curtext++;} break;
		case 3: if timer>= 4.7 {curtext++;} break;
		case 4: if timer>= 5.3 {curtext++;} break;
		case 5: if timer>= 6.4 {curtext++;} break;
		case 6: if timer>= 7.1 {curtext++;} break;
		case 7: if timer>= 7.6 {curtext++;} break;
		case 8: if timer>= 8.2 {curtext++;} break;
		case 9: if timer>= 8.7 {curtext++;} break;
		case 10:
		if timer>= 9.4 {
			curtext++;
			wfalpha= 1;
			instance_activate_all();
		}
		break;
	}
	if curtext> array_length_1d(text) || curtext< 0 {curtext= array_length_1d(text)-1;}
	if curtext< 10 && check_input(INP_ENTER,INPM_PRESSED) {
		curtext= 11;
		wfalpha= 1;
		instance_activate_all();
		bgm_set_track_position(0,9.4);
		exit;
	}
}
