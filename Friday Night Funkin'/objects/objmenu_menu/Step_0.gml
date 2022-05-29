if check_input(INP_EXIT,INPM_PRESSED) {
	if room_fade(ROOMFADE_SPEED,rm_init)!= -1 {
		bgm_play(sfx_cancel_menu,1,1);
	}
}

if check_input(INP_UI_DOWN,INPM_PRESSED) {
	global.menusel++;
	bgm_play(sfx_scroll_menu,1,1);
}
if check_input(INP_UI_UP,INPM_PRESSED) {
	global.menusel--;
	bgm_play(sfx_scroll_menu,1,1);
}
if global.menusel< 0 {global.menusel= maxsel;}
if global.menusel> maxsel {global.menusel= 0;}

if check_input(INP_ENTER,INPM_PRESSED) {
	if alarm0= -1 && !instance_exists(obj_roomfade) {
		alarm0= alarm0t;
		savsel= global.menusel;
		bgm_play(sfx_select_menu,1,1);
	}
}

if alarm0< 0 {
	if alarm0!= -1 {
		var temp= bgimg;
		bgimg= bgimgtar;
		bgimgtar= temp;
		if alarm0ct< alarm0times {
			alarm0= alarm0t;
			alarm0ct++;
		}else{
			alarm0= -1;
			alarm0ct= 1;
			switch savsel {
				case 0: //Storymode
				break;
				case 1: //Freeplay
				room_fade(,rm_freeplay);
				break;
				case 2: //Options
				room_fade(,rm_options);
				break;
				case 3: //Donate
				url_open("https://ninja-muffin24.itch.io/funkin/purchase");
				break;
			}
		}
	}
}else{
	alarm0-= get_delta_timer(1,60);
}

bg_yto= global.menusel*60;
bg_yoff= lerp(bg_yoff,bg_yto,get_delta_timer(0.2,60));
