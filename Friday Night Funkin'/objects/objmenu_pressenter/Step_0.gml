switch mode {
	case 0: intr= abs(sin(get_timer()/1000000)); break;
	case 2: if !bgm_is_playing(1) {room_fade(ROOMFADE_SPEED,room_next(room));} break;
}
if check_input(INP_ENTER,INPM_PRESSED) {
	mode= 2;
	sprite_index= sprmenu_pressedenter;
	intr= 0;
	if audio_get_name(bgm_get_id(1))!= "sfx_select_menu" {
		bgm_play(sfx_select_menu,1,1);
	}
}
