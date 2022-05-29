///@desc Settings custom text
var txt= "";
var subcat= current_subcat;
var curs= currenti;
var selected= sel= curs? 1: 0;

/*
Template:

case "":
		txt= ": ";
		break;
		
*/
switch catsel {
	case 0:
	switch subcat {
		case "FULLSCREEN":
		txt= ": "+(ds_map_default(global.settings,"Fullscreen",0)? "ENABLED": "DISABLED");
		if selected {
			if check_input(INP_UI_LEFT,INPM_PRESSED) || check_input(INP_UI_RIGHT,INPM_PRESSED) {
				bgm_play(sfx_scroll_menu,1,1);
				global.settings[?"Fullscreen"]= !ds_map_default(global.settings,"Fullscreen",0);
				window_set_fullscreen(global.settings[?"Fullscreen"]);
			}
		}
		break;
		case "FPS CAP":
		txt= ": "+string(ds_map_default(global.settings,"Fps Cap",60))+" FPS";
		if selected {
			if check_input(INP_UI_LEFT,INPM_PRESSED) {
				if ds_map_default(global.settings,"Fps Cap",60)!= 10 bgm_play(sfx_scroll_menu,1,1);
				global.settings[?"Fps Cap"]= max(ds_map_default(global.settings,"Fps Cap",60)-10,10);
				room_speed= global.settings[?"Fps Cap"];
			}
			if check_input(INP_UI_RIGHT,INPM_PRESSED) {
				if ds_map_default(global.settings,"Fps Cap",60)!= 400 {bgm_play(sfx_scroll_menu,1,1);}
				global.settings[?"Fps Cap"]= min(ds_map_default(global.settings,"Fps Cap",60)+10,400);
				room_speed= global.settings[?"Fps Cap"];
			}
		}
		break;
		case "SHOW FPS":
		txt= ": "+(ds_map_default(global.settings,"Show Fps",0)? "YES": "NO");
		if selected {
			if check_input(INP_UI_LEFT,INPM_PRESSED) || check_input(INP_UI_RIGHT,INPM_PRESSED) {
				bgm_play(sfx_scroll_menu,1,1);
				global.settings[?"Show Fps"]= !ds_map_default(global.settings,"Show Fps",0);
			}
		}
		break;
		case "DISCORD STATUS":
		txt= ": "+(ds_map_default(global.settings,"Discord Status",1)? "ENABLED": "DISABLED");
		if selected {
			if check_input(INP_UI_LEFT,INPM_PRESSED) || check_input(INP_UI_RIGHT,INPM_PRESSED) {
				bgm_play(sfx_scroll_menu,1,1);
				global.settings[?"Discord Status"]= !ds_map_default(global.settings,"Discord Status",1);
			}
		}
		break;
		case "VOLUME":
		txt= ": "+string(floor(ds_map_default(global.settings,"Volume",100)))+"%";
		if selected {
			var varch= 0;
			if check_input(INP_UI_LEFT,INPM_PRESSED) {
				if ds_map_default(global.settings,"Volume",100)!= 0 {bgm_play(sfx_scroll_menu,1,1);}
				global.settings[?"Volume"]= ds_map_default(global.settings,"Volume",100)-5;
				varch= 1;
			}
			if check_input(INP_UI_RIGHT,INPM_PRESSED) {
				if ds_map_default(global.settings,"Volume",100)!= 100 {bgm_play(sfx_scroll_menu,1,1);}
				global.settings[?"Volume"]= ds_map_default(global.settings,"Volume",100)+5;
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
		break;
		case "CURRENT GPU":
		var map= os_get_info();
		var gpu= "Unknown";
		switch os_type {
			case os_windows: gpu= map[?"video_adapter_description"]; break;
			case os_macosx: case os_linux: gpu= map[?"gl_renderer_string"]; break;
			case os_android: gpu= map[?"GL_RENDERER"]; break;
		}
		if map!= -1 {ds_map_destroy(map);}
		var strl= string_wordwarp_width(gpu,816,"\n",1);
		txt= ": "+strl;
		if check_input(INP_ENTER,INPM_PRESSED) && selected {
			show_message("Current GPU: "+gpu);
		}
		break;
	}
	break;
	case 1:
	break;
	case 2:
	var prs= -1;
	var chkinp= 1;
	if check_input(INP_ENTER,INPM_PRESSED) {
		if sel> 0 {
			if !selectingkey {
				selectingkey= 1;
				keyboard_lastkey= 0;
				moveable= 0;
				bgm_play(sfx_click_text,1,1);
				chkinp= 0;
				event_user(0);
				exit;
			}
		}else{
			if gamepad_is_connected(0) {
				gpsel= !gpsel;
			}
		}
	}
	
	if !gamepad_is_connected(0) {
		if !gpsel {
			gpsel= 0;
		}
	}
	
	if chkinp && selectingkey && selected {
		if gpsel {
			var btn= gp_face1; if gamepad_button_check_pressed(0,btn) {prs= "face1";}
			var btn= gp_face2; if gamepad_button_check_pressed(0,btn) {prs= "face2";}
			var btn= gp_face3; if gamepad_button_check_pressed(0,btn) {prs= "face3";}
			var btn= gp_face4; if gamepad_button_check_pressed(0,btn) {prs= "face4";}
			var btn= gp_shoulderl; if gamepad_button_check_pressed(0,btn) {prs= "shoulderl";}
			var btn= gp_shoulderlb; if gamepad_button_check_pressed(0,btn) {prs= "shoulderlb";}
			var btn= gp_shoulderr; if gamepad_button_check_pressed(0,btn) {prs= "shoulderr";}
			var btn= gp_shoulderrb; if gamepad_button_check_pressed(0,btn) {prs= "shoulderrb";}
			var btn= gp_select; if gamepad_button_check_pressed(0,btn) {prs= "select";}
			var btn= gp_start; if gamepad_button_check_pressed(0,btn) {prs= "start";}
			var btn= gp_stickl; if gamepad_button_check_pressed(0,btn) {prs= "stickl";}
			var btn= gp_stickr; if gamepad_button_check_pressed(0,btn) {prs= "stickr";}
			var btn= gp_padd; if gamepad_button_check_pressed(0,btn) {prs= "padd";}
			var btn= gp_padl; if gamepad_button_check_pressed(0,btn) {prs= "padl";}
			var btn= gp_padr; if gamepad_button_check_pressed(0,btn) {prs= "padr";}
			var btn= gp_padu; if gamepad_button_check_pressed(0,btn) {prs= "padu";}
		}else{
			prs= keyboard_lastkey;
		}
	}
	
	switch subcat {
		case "SELECT":
		var pret= gpsel? "gp_": "kb_";
		var key= pret+"enter";
		var def= gpsel? "face1": vk_enter;
		if prs> 0 && selected && prs> 0 {
			var dm= ds_map_find_first(global.keybinds);
			for (var i= 0; i< ds_map_size(global.keybinds); i++;) {
				if global.keybinds[?dm]= prs {
					global.keybinds[?dm]= global.keybinds[?key];
				}
				dm= ds_map_find_next(global.keybinds,dm);
			}
			bgm_play(sfx_click_text,1,1);
			alarm[1]= 1; //selectingkey= 0;
			moveable= 1;
			global.keybinds[?key]= prs;
		}
		var keyv= ds_map_default(global.keybinds,key,def);
		if gpsel {
			chrt= string_upper(gp_custom(keyv,0));
		}else{
			var chrt= string_upper(chr_custom(keyv));
		}
		if keyv= "-1" {
			chrt= "<EMPTY>";
		}
		if selected && selectingkey {
			chrt= "<PRESS A "+(gpsel? "GAMEPAD BUTTON": "KEY")+">";
		}
		if debug_mode {
			txt= ": "+chrt+" (KEY NUMBER: "+string(keyv)+")";
		}else{
			txt= ": "+chrt;
		}
		break;
		case "EXIT":
		var pret= gpsel? "gp_": "kb_";
		var key= pret+"exit";
		var def= gpsel? "face2": vk_escape;
		if prs> 0 && selected && prs> 0 {
			var dm= ds_map_find_first(global.keybinds);
			for (var i= 0; i< ds_map_size(global.keybinds); i++;) {
				if global.keybinds[?dm]= prs {
					global.keybinds[?dm]= global.keybinds[?key];
				}
				dm= ds_map_find_next(global.keybinds,dm);
			}
			bgm_play(sfx_click_text,1,1);
			alarm[1]= 1; //selectingkey= 0;
			moveable= 1;
			global.keybinds[?key]= prs;
		}
		var keyv= ds_map_default(global.keybinds,key,def);
		if gpsel {
			chrt= string_upper(gp_custom(keyv,0));
		}else{
			var chrt= string_upper(chr_custom(keyv));
		}
		if keyv= "-1" {
			chrt= "<EMPTY>";
		}
		if selected && selectingkey {
			chrt= "<PRESS A "+(gpsel? "GAMEPAD BUTTON": "KEY")+">";
		}
		if debug_mode {
			txt= ": "+chrt+" (KEY NUMBER: "+string(keyv)+")";
		}else{
			txt= ": "+chrt;
		}
		break;
		case "UI LEFT":
		var pret= gpsel? "gp_": "kb_";
		var key= pret+"ui_left";
		var def= gpsel? "padl": vk_left;
		if prs> 0 && selected && prs> 0 {
			var dm= ds_map_find_first(global.keybinds);
			for (var i= 0; i< ds_map_size(global.keybinds); i++;) {
				if global.keybinds[?dm]= prs {
					global.keybinds[?dm]= global.keybinds[?key];
				}
				dm= ds_map_find_next(global.keybinds,dm);
			}
			bgm_play(sfx_click_text,1,1);
			alarm[1]= 1; //selectingkey= 0;
			moveable= 1;
			global.keybinds[?key]= prs;
		}
		var keyv= ds_map_default(global.keybinds,key,def);
		if gpsel {
			chrt= string_upper(gp_custom(keyv,0));
		}else{
			var chrt= string_upper(chr_custom(keyv));
		}
		if keyv= "-1" {
			chrt= "<EMPTY>";
		}
		if selected && selectingkey {
			chrt= "<PRESS A "+(gpsel? "GAMEPAD BUTTON": "KEY")+">";
		}
		if debug_mode {
			txt= ": "+chrt+" (KEY NUMBER: "+string(keyv)+")";
		}else{
			txt= ": "+chrt;
		}
		break;
		case "UI DOWN":
		var pret= gpsel? "gp_": "kb_";
		var key= pret+"ui_down";
		var def= gpsel? "padd": vk_down;
		if prs> 0 && selected && prs> 0 {
			var dm= ds_map_find_first(global.keybinds);
			for (var i= 0; i< ds_map_size(global.keybinds); i++;) {
				if global.keybinds[?dm]= prs {
					global.keybinds[?dm]= global.keybinds[?key];
				}
				dm= ds_map_find_next(global.keybinds,dm);
			}
			bgm_play(sfx_click_text,1,1);
			alarm[1]= 1; //selectingkey= 0;
			moveable= 1;
			global.keybinds[?key]= prs;
		}
		var keyv= ds_map_default(global.keybinds,key,def);
		if gpsel {
			chrt= string_upper(gp_custom(keyv,0));
		}else{
			var chrt= string_upper(chr_custom(keyv));
		}
		if keyv= "-1" {
			chrt= "<EMPTY>";
		}
		if selected && selectingkey {
			chrt= "<PRESS A "+(gpsel? "GAMEPAD BUTTON": "KEY")+">";
		}
		if debug_mode {
			txt= ": "+chrt+" (KEY NUMBER: "+string(keyv)+")";
		}else{
			txt= ": "+chrt;
		}
		break;
		case "UI UP":
		var pret= gpsel? "gp_": "kb_";
		var key= pret+"ui_up";
		var def= gpsel? "padu": vk_up;
		if prs> 0 && selected && prs> 0 {
			var dm= ds_map_find_first(global.keybinds);
			for (var i= 0; i< ds_map_size(global.keybinds); i++;) {
				if global.keybinds[?dm]= prs {
					global.keybinds[?dm]= global.keybinds[?key];
				}
				dm= ds_map_find_next(global.keybinds,dm);
			}
			bgm_play(sfx_click_text,1,1);
			alarm[1]= 1; //selectingkey= 0;
			moveable= 1;
			global.keybinds[?key]= prs;
		}
		var keyv= ds_map_default(global.keybinds,key,def);
		if gpsel {
			chrt= string_upper(gp_custom(keyv,0));
		}else{
			var chrt= string_upper(chr_custom(keyv));
		}
		if keyv= "-1" {
			chrt= "<EMPTY>";
		}
		if selected && selectingkey {
			chrt= "<PRESS A "+(gpsel? "GAMEPAD BUTTON": "KEY")+">";
		}
		if debug_mode {
			txt= ": "+chrt+" (KEY NUMBER: "+string(keyv)+")";
		}else{
			txt= ": "+chrt;
		}
		break;
		case "UI RIGHT":
		var pret= gpsel? "gp_": "kb_";
		var key= pret+"ui_right";
		var def= gpsel? "padr": vk_right;
		if prs> 0 && selected && prs> 0 {
			var dm= ds_map_find_first(global.keybinds);
			for (var i= 0; i< ds_map_size(global.keybinds); i++;) {
				if global.keybinds[?dm]= prs {
					global.keybinds[?dm]= global.keybinds[?key];
				}
				dm= ds_map_find_next(global.keybinds,dm);
			}
			bgm_play(sfx_click_text,1,1);
			alarm[1]= 1; //selectingkey= 0;
			moveable= 1;
			global.keybinds[?key]= prs;
		}
		var keyv= ds_map_default(global.keybinds,key,def);
		if gpsel {
			chrt= string_upper(gp_custom(keyv,0));
		}else{
			var chrt= string_upper(chr_custom(keyv));
		}
		if keyv= "-1" {
			chrt= "<EMPTY>";
		}
		if selected && selectingkey {
			chrt= "<PRESS A "+(gpsel? "GAMEPAD BUTTON": "KEY")+">";
		}
		if debug_mode {
			txt= ": "+chrt+" (KEY NUMBER: "+string(keyv)+")";
		}else{
			txt= ": "+chrt;
		}
		break;
		case "LEFT":
		var pret= gpsel? "gp_": "kb_";
		var key= pret+"pl_left";
		var def= gpsel? "padl": ord("A");
		if prs> 0 && selected && prs> 0 {
			var dm= ds_map_find_first(global.keybinds);
			for (var i= 0; i< ds_map_size(global.keybinds); i++;) {
				if global.keybinds[?dm]= prs {
					global.keybinds[?dm]= global.keybinds[?key];
				}
				dm= ds_map_find_next(global.keybinds,dm);
			}
			bgm_play(sfx_click_text,1,1);
			alarm[1]= 1; //selectingkey= 0;
			moveable= 1;
			global.keybinds[?key]= prs;
		}
		var keyv= ds_map_default(global.keybinds,key,def);
		if gpsel {
			chrt= string_upper(gp_custom(keyv,0));
		}else{
			var chrt= string_upper(chr_custom(keyv));
		}
		if keyv= "-1" {
			chrt= "<EMPTY>";
		}
		if selected && selectingkey {
			chrt= "<PRESS A "+(gpsel? "GAMEPAD BUTTON": "KEY")+">";
		}
		if debug_mode {
			txt= ": "+chrt+" (KEY NUMBER: "+string(keyv)+")";
		}else{
			txt= ": "+chrt;
		}
		break;
		case "DOWN":
		var pret= gpsel? "gp_": "kb_";
		var key= pret+"pl_down";
		var def= gpsel? "padd": ord("S");
		if prs> 0 && selected && prs> 0 {
			var dm= ds_map_find_first(global.keybinds);
			for (var i= 0; i< ds_map_size(global.keybinds); i++;) {
				if global.keybinds[?dm]= prs {
					global.keybinds[?dm]= global.keybinds[?key];
				}
				dm= ds_map_find_next(global.keybinds,dm);
			}
			bgm_play(sfx_click_text,1,1);
			alarm[1]= 1; //selectingkey= 0;
			moveable= 1;
			global.keybinds[?key]= prs;
		}
		var keyv= ds_map_default(global.keybinds,key,def);
		if gpsel {
			chrt= string_upper(gp_custom(keyv,0));
		}else{
			var chrt= string_upper(chr_custom(keyv));
		}
		if keyv= "-1" {
			chrt= "<EMPTY>";
		}
		if selected && selectingkey {
			chrt= "<PRESS A "+(gpsel? "GAMEPAD BUTTON": "KEY")+">";
		}
		if debug_mode {
			txt= ": "+chrt+" (KEY NUMBER: "+string(keyv)+")";
		}else{
			txt= ": "+chrt;
		}
		break;
		case "UP":
		var pret= gpsel? "gp_": "kb_";
		var key= pret+"pl_up";
		var def= gpsel? "padu": ord("W");
		if prs> 0 && selected && prs> 0 {
			var dm= ds_map_find_first(global.keybinds);
			for (var i= 0; i< ds_map_size(global.keybinds); i++;) {
				if global.keybinds[?dm]= prs {
					global.keybinds[?dm]= global.keybinds[?key];
				}
				dm= ds_map_find_next(global.keybinds,dm);
			}
			bgm_play(sfx_click_text,1,1);
			alarm[1]= 1; //selectingkey= 0;
			moveable= 1;
			global.keybinds[?key]= prs;
		}
		var keyv= ds_map_default(global.keybinds,key,def);
		if gpsel {
			chrt= string_upper(gp_custom(keyv,0));
		}else{
			var chrt= string_upper(chr_custom(keyv));
		}
		if keyv= "-1" {
			chrt= "<EMPTY>";
		}
		if selected && selectingkey {
			chrt= "<PRESS A "+(gpsel? "GAMEPAD BUTTON": "KEY")+">";
		}
		if debug_mode {
			txt= ": "+chrt+" (KEY NUMBER: "+string(keyv)+")";
		}else{
			txt= ": "+chrt;
		}
		break;
		case "RIGHT":
		var pret= gpsel? "gp_": "kb_";
		var key= pret+"pl_right";
		var def= gpsel? "padr": ord("D");
		if prs> 0 && selected && prs> 0 {
			var dm= ds_map_find_first(global.keybinds);
			for (var i= 0; i< ds_map_size(global.keybinds); i++;) {
				if global.keybinds[?dm]= prs {
					global.keybinds[?dm]= global.keybinds[?key];
				}
				dm= ds_map_find_next(global.keybinds,dm);
			}
			bgm_play(sfx_click_text,1,1);
			alarm[1]= 1; //selectingkey= 0;
			moveable= 1;
			global.keybinds[?key]= prs;
		}
		var keyv= ds_map_default(global.keybinds,key,def);
		if gpsel {
			chrt= string_upper(gp_custom(keyv,0));
		}else{
			var chrt= string_upper(chr_custom(keyv));
		}
		if keyv= "-1" {
			chrt= "<EMPTY>";
		}
		if selected && selectingkey {
			chrt= "<PRESS A "+(gpsel? "GAMEPAD BUTTON": "KEY")+">";
		}
		if debug_mode {
			txt= ": "+chrt+" (KEY NUMBER: "+string(keyv)+")";
		}else{
			txt= ": "+chrt;
		}
		break;
		case "SUBTRACT VOLUME":
		var pret= gpsel? "gp_": "kb_";
		var key= pret+"subtract_vol";
		var def= gpsel? "shoulderl": 189;
		if prs> 0 && selected && prs> 0 {
			var dm= ds_map_find_first(global.keybinds);
			for (var i= 0; i< ds_map_size(global.keybinds); i++;) {
				if global.keybinds[?dm]= prs {
					global.keybinds[?dm]= global.keybinds[?key];
				}
				dm= ds_map_find_next(global.keybinds,dm);
			}
			bgm_play(sfx_click_text,1,1);
			alarm[1]= 1; //selectingkey= 0;
			moveable= 1;
			global.keybinds[?key]= prs;
		}
		var keyv= ds_map_default(global.keybinds,key,def);
		if gpsel {
			chrt= string_upper(gp_custom(keyv,0));
		}else{
			var chrt= string_upper(chr_custom(keyv));
		}
		if keyv= "-1" {
			chrt= "<EMPTY>";
		}
		if selected && selectingkey {
			chrt= "<PRESS A "+(gpsel? "GAMEPAD BUTTON": "KEY")+">";
		}
		if debug_mode {
			txt= ": "+chrt+" (KEY NUMBER: "+string(keyv)+")";
		}else{
			txt= ": "+chrt;
		}
		break;
		case "ADD VOLUME":
		var pret= gpsel? "gp_": "kb_";
		var key= pret+"add_vol";
		var def= gpsel? "shoulderr": 187;
		if prs> 0 && selected && prs> 0 {
			var dm= ds_map_find_first(global.keybinds);
			for (var i= 0; i< ds_map_size(global.keybinds); i++;) {
				if global.keybinds[?dm]= prs {
					global.keybinds[?dm]= global.keybinds[?key];
				}
				dm= ds_map_find_next(global.keybinds,dm);
			}
			bgm_play(sfx_click_text,1,1);
			alarm[1]= 1; //selectingkey= 0;
			moveable= 1;
			global.keybinds[?key]= prs;
		}
		var keyv= ds_map_default(global.keybinds,key,def);
		if gpsel {
			chrt= string_upper(gp_custom(keyv,0));
		}else{
			var chrt= string_upper(chr_custom(keyv));
		}
		if keyv= "-1" {
			chrt= "<EMPTY>";
		}
		if selected && selectingkey {
			chrt= "<PRESS A "+(gpsel? "GAMEPAD BUTTON": "KEY")+">";
		}
		if debug_mode {
			txt= ": "+chrt+" (KEY NUMBER: "+string(keyv)+")";
		}else{
			txt= ": "+chrt;
		}
		break;
	}
	break;
}

custom_text= txt;
