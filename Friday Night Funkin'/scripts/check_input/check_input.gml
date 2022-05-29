//Input
#macro INP_ENTER 0
#macro INP_EXIT 1
#macro INP_UI_LEFT 2
#macro INP_UI_DOWN 3
#macro INP_UI_UP 4
#macro INP_UI_RIGHT 5
#macro INP_PL_LEFT 6
#macro INP_PL_DOWN 7
#macro INP_PL_UP 8
#macro INP_PL_RIGHT 9
#macro INP_SUBTRACT_VOL 10
#macro INP_ADD_VOL 11

//Mode
#macro INPM_NORMAL 0
#macro INPM_PRESSED 1
#macro INPM_RELEASED 2

//Function
function check_input(input,mode){
	switch input {
		case INP_ENTER:
		switch mode {
			case INPM_NORMAL:
			return keyboard_check(ds_map_default(global.keybinds,"kb_enter",vk_enter))
			|| gamepad_button_check(0,gp_macro(ds_map_default(global.keybinds,"gp_enter","face1")));
			break;
			case INPM_PRESSED:
			return keyboard_check_pressed(ds_map_default(global.keybinds,"kb_enter",vk_enter))
			|| gamepad_button_check_pressed(0,gp_macro(ds_map_default(global.keybinds,"gp_enter","face1")));
			break;
			case INPM_RELEASED:
			return keyboard_check_released(ds_map_default(global.keybinds,"kb_enter",vk_enter))
			|| gamepad_button_check_released(0,gp_macro(ds_map_default(global.keybinds,"gp_enter","face1")));
			break;
		}
		break;
		case INP_EXIT:
		switch mode {
			case INPM_NORMAL:
			return keyboard_check(ds_map_default(global.keybinds,"kb_exit",vk_escape))
			|| gamepad_button_check(0,gp_macro(ds_map_default(global.keybinds,"gp_exit","face2")));
			break;
			case INPM_PRESSED:
			return keyboard_check_pressed(ds_map_default(global.keybinds,"kb_exit",vk_escape))
			|| gamepad_button_check_pressed(0,gp_macro(ds_map_default(global.keybinds,"gp_exit","face2")));
			break;
			case INPM_RELEASED:
			return keyboard_check_released(ds_map_default(global.keybinds,"kb_exit",vk_escape))
			|| gamepad_button_check_released(0,gp_macro(ds_map_default(global.keybinds,"gp_exit","face2")));
			break;
		}
		break;
		case INP_UI_LEFT:
		switch mode {
			case INPM_NORMAL:
			return keyboard_check(ds_map_default(global.keybinds,"kb_ui_left",vk_left))
			|| gamepad_button_check(0,gp_macro(ds_map_default(global.keybinds,"gp_ui_left","padl")));
			break;
			case INPM_PRESSED:
			return keyboard_check_pressed(ds_map_default(global.keybinds,"kb_ui_left",vk_left))
			|| gamepad_button_check_pressed(0,gp_macro(ds_map_default(global.keybinds,"gp_ui_left","padl")));
			break;
			case INPM_RELEASED:
			return keyboard_check_released(ds_map_default(global.keybinds,"kb_ui_left",vk_left))
			|| gamepad_button_check_released(0,gp_macro(ds_map_default(global.keybinds,"gp_ui_left","padl")));
			break;
		}
		break;
		case INP_UI_DOWN:
		switch mode {
			case INPM_NORMAL:
			return keyboard_check(ds_map_default(global.keybinds,"kb_ui_down",vk_down))
			|| gamepad_button_check(0,gp_macro(ds_map_default(global.keybinds,"gp_ui_down","padd")));
			break;
			case INPM_PRESSED:
			return keyboard_check_pressed(ds_map_default(global.keybinds,"kb_ui_down",vk_down))
			|| gamepad_button_check_pressed(0,gp_macro(ds_map_default(global.keybinds,"gp_ui_down","padd")));
			break;
			case INPM_RELEASED:
			return keyboard_check_released(ds_map_default(global.keybinds,"kb_ui_down",vk_down))
			|| gamepad_button_check_released(0,gp_macro(ds_map_default(global.keybinds,"gp_ui_down","padd")));
			break;
		}
		break;
		case INP_UI_UP:
		switch mode {
			case INPM_NORMAL:
			return keyboard_check(ds_map_default(global.keybinds,"kb_ui_up",vk_up))
			|| gamepad_button_check(0,gp_macro(ds_map_default(global.keybinds,"gp_ui_up","padu")));
			break;
			case INPM_PRESSED:
			return keyboard_check_pressed(ds_map_default(global.keybinds,"kb_ui_up",vk_up))
			|| gamepad_button_check_pressed(0,gp_macro(ds_map_default(global.keybinds,"gp_ui_up","padu")));
			break;
			case INPM_RELEASED:
			return keyboard_check_released(ds_map_default(global.keybinds,"kb_ui_up",vk_up))
			|| gamepad_button_check_released(0,gp_macro(ds_map_default(global.keybinds,"gp_ui_up","padu")));
			break;
		}
		break;
		case INP_UI_RIGHT:
		switch mode {
			case INPM_NORMAL:
			return keyboard_check(ds_map_default(global.keybinds,"kb_ui_right",vk_right))
			|| gamepad_button_check(0,gp_macro(ds_map_default(global.keybinds,"gp_ui_right","padr")));
			break;
			case INPM_PRESSED:
			return keyboard_check_pressed(ds_map_default(global.keybinds,"kb_ui_right",vk_right))
			|| gamepad_button_check_pressed(0,gp_macro(ds_map_default(global.keybinds,"gp_ui_right","padr")));
			break;
			case INPM_RELEASED:
			return keyboard_check_released(ds_map_default(global.keybinds,"kb_ui_right",vk_right))
			|| gamepad_button_check_released(0,gp_macro(ds_map_default(global.keybinds,"gp_ui_right","padr")));
			break;
		}
		break;
		case INP_PL_LEFT:
		switch mode {
			case INPM_NORMAL:
			return keyboard_check(ds_map_default(global.keybinds,"kb_pl_left",ord("A")))
			|| gamepad_button_check(0,gp_macro(ds_map_default(global.keybinds,"gp_pl_left","padl")));
			break;
			case INPM_PRESSED:
			return keyboard_check_pressed(ds_map_default(global.keybinds,"kb_pl_left",ord("A")))
			|| gamepad_button_check_pressed(0,gp_macro(ds_map_default(global.keybinds,"gp_pl_left","padl")));
			break;
			case INPM_RELEASED:
			return keyboard_check_released(ds_map_default(global.keybinds,"kb_pl_left",ord("A")))
			|| gamepad_button_check_released(0,gp_macro(ds_map_default(global.keybinds,"gp_pl_left","padl")));
			break;
		}
		break;
		case INP_PL_DOWN:
		switch mode {
			case INPM_NORMAL:
			return keyboard_check(ds_map_default(global.keybinds,"kb_pl_down",ord("S")))
			|| gamepad_button_check(0,gp_macro(ds_map_default(global.keybinds,"gp_pl_down","padd")));
			break;
			case INPM_PRESSED:
			return keyboard_check_pressed(ds_map_default(global.keybinds,"kb_pl_down",ord("S")))
			|| gamepad_button_check_pressed(0,gp_macro(ds_map_default(global.keybinds,"gp_pl_down","padd")));
			break;
			case INPM_RELEASED:
			return keyboard_check_released(ds_map_default(global.keybinds,"kb_pl_down",ord("S")))
			|| gamepad_button_check_released(0,gp_macro(ds_map_default(global.keybinds,"gp_pl_down","padd")));
			break;
		}
		break;
		case INP_PL_UP:
		switch mode {
			case INPM_NORMAL:
			return keyboard_check(ds_map_default(global.keybinds,"kb_pl_up",ord("W")))
			|| gamepad_button_check(0,gp_macro(ds_map_default(global.keybinds,"gp_pl_up","padu")));
			break;
			case INPM_PRESSED:
			return keyboard_check_pressed(ds_map_default(global.keybinds,"kb_pl_up",ord("W")))
			|| gamepad_button_check_pressed(0,gp_macro(ds_map_default(global.keybinds,"gp_pl_up","padu")));
			break;
			case INPM_RELEASED:
			return keyboard_check_released(ds_map_default(global.keybinds,"kb_pl_up",ord("W")))
			|| gamepad_button_check_released(0,gp_macro(ds_map_default(global.keybinds,"gp_pl_up","padu")));
			break;
		}
		break;
		case INP_PL_RIGHT:
		switch mode {
			case INPM_NORMAL:
			return keyboard_check(ds_map_default(global.keybinds,"kb_pl_right",ord("D")))
			|| gamepad_button_check(0,gp_macro(ds_map_default(global.keybinds,"gp_pl_right","padr")));
			break;
			case INPM_PRESSED:
			return keyboard_check_pressed(ds_map_default(global.keybinds,"kb_pl_right",ord("D")))
			|| gamepad_button_check_pressed(0,gp_macro(ds_map_default(global.keybinds,"gp_pl_right","padr")));
			break;
			case INPM_RELEASED:
			return keyboard_check_released(ds_map_default(global.keybinds,"kb_pl_right",ord("D")))
			|| gamepad_button_check_released(0,gp_macro(ds_map_default(global.keybinds,"gp_pl_right","padr")));
			break;
		}
		break;
		case INP_SUBTRACT_VOL:
		switch mode {
			case INPM_NORMAL:
			return keyboard_check(ds_map_default(global.keybinds,"kb_subtract_vol",189))
			|| gamepad_button_check(0,gp_macro(ds_map_default(global.keybinds,"gp_subtract_vol","shoulderl")));
			break;
			case INPM_PRESSED:
			return keyboard_check_pressed(ds_map_default(global.keybinds,"kb_subtract_vol",189))
			|| gamepad_button_check_pressed(0,gp_macro(ds_map_default(global.keybinds,"gp_subtract_vol","shoulderl")));
			break;
			case INPM_RELEASED:
			return keyboard_check_released(ds_map_default(global.keybinds,"kb_subtract_vol",189))
			|| gamepad_button_check_released(0,gp_macro(ds_map_default(global.keybinds,"gp_subtract_vol","shoulderl")));
			break;
		}
		break;
		case INP_ADD_VOL:
		switch mode {
			case INPM_NORMAL:
			return keyboard_check(ds_map_default(global.keybinds,"kb_add_vol",187))
			|| gamepad_button_check(0,gp_macro(ds_map_default(global.keybinds,"gp_add_vol","shoulderr")));
			break;
			case INPM_PRESSED:
			return keyboard_check_pressed(ds_map_default(global.keybinds,"kb_add_vol",187))
			|| gamepad_button_check_pressed(0,gp_macro(ds_map_default(global.keybinds,"gp_add_vol","shoulderr")));
			break;
			case INPM_RELEASED:
			return keyboard_check_released(ds_map_default(global.keybinds,"kb_add_vol",187))
			|| gamepad_button_check_released(0,gp_macro(ds_map_default(global.keybinds,"gp_add_vol","shoulderr")));
			break;
		}
		break;
	}
}