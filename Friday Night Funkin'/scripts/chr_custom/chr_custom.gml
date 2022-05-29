function gp_macro(val) {
	switch val {
		case "face1": return gp_face1; break;
		case "face2": return gp_face2; break;
		case "face3": return gp_face3; break;
		case "face4": return gp_face4; break;
		case "shoulderl": return gp_shoulderl; break;
		case "shoulderlb": return gp_shoulderlb; break;
		case "shoulderr": return gp_shoulderr; break;
		case "shoulderrb": return gp_shoulderrb; break;
		case "select": return gp_select; break;
		case "start": return gp_start; break;
		case "stickl": return gp_stickl; break;
		case "stickr": return gp_stickr; break;
		case "padd": return gp_padd; break;
		case "padl": return gp_padl; break;
		case "padr": return gp_padr; break;
		case "padu": return gp_padu; break;
		
		default: return val; break;
	}
}

function gp_text(val) {
	switch val {
		case "gp_face1": return "face1"; break;
		case "gp_face2": return "face2"; break;
		case "gp_face3": return "face3"; break;
		case "gp_face4": return "face4"; break;
		case "gp_shoulderl": return "shoulderl"; break;
		case "gp_shoulderlb": return "shoulderlb"; break;
		case "gp_shoulderr": return "shoulderr"; break;
		case "gp_shoulderrb": return "shoulderrb"; break;
		case "gp_select": return "select"; break;
		case "gp_start": return "start"; break;
		case "gp_stickl": return "stickl"; break;
		case "gp_stickr": return "stickr"; break;
		case "gp_padd": return "padd"; break;
		case "gp_padl": return "padl"; break;
		case "gp_padr": return "padr"; break;
		case "gp_padu": return "padu"; break;
		
		default: return val; break;
	}
}
function gp_custom(val,pad) {
	var r= string(val);
	switch gp_text(val) {
		case "face1": if string_pos("playstation",string_lower(gamepad_get_description(pad)))!= 0 {r= "Cross";}else{r= "A";} break;
		case "face2": if string_pos("playstation",string_lower(gamepad_get_description(pad)))!= 0 {r= "Circle";}else{r= "B";} break;
		case "face3": if string_pos("playstation",string_lower(gamepad_get_description(pad)))!= 0 {r= "Square";}else{r= "X";} break;
		case "face4": if string_pos("playstation",string_lower(gamepad_get_description(pad)))!= 0 {r= "Triangle";}else{r= "Y";} break;
		case "shoulderl": r= "LB"; break;
		case "shoulderlb": r= "LT"; break;
		case "shoulderr": r= "RB"; break;
		case "shoulderrb": r= "RT"; break;
		case "select": r= "Select"; break;
		case "start": if string_pos("playstation",string_lower(gamepad_get_description(pad)))!= 0 {r= "Options";}else{r= "Start";} break;
		case "stickl": r= "Left Stick"; break;
		case "stickr": r= "Right Stick"; break;
		case "padd": r= "D-pad down"; break;
		case "padl": r= "D-pad left"; break;
		case "padr": r= "D-pad right"; break;
		case "padu": r= "D-pad up"; break;
	}
	return r;
}
function chr_custom(val) {
	var str= string_digits(string(val));
	if str= "" {return "-1";}
	var r= chr(real(str));
	switch val {
		case vk_nokey: r= "No Key"; break;
		case vk_anykey: r= "Any Key"; break;
		case vk_left: r= "Left Arrow"; break;
		case vk_right: r= "Right Arrow"; break;
		case vk_up: r= "Up Arrow"; break;
		case vk_down: r= "Down Arrow"; break;
		case vk_enter: r= "Enter"; break;
		case vk_escape: r= "Esc"; break;
		case vk_space: r= "Space"; break;
		case vk_shift: r= "Shift"; break;
		case vk_control: r= "Ctrl"; break;
		case vk_alt: r= "Alt"; break;
		case vk_backspace: r= "Backspc"; break;
		case vk_tab: r= "Tab"; break;
		case vk_home: r= "Home"; break;
		case vk_end: r= "End"; break;
		case vk_delete: r= "Delete"; break;
		case vk_insert: r= "Insert"; break;
		case vk_pageup: r= "Pag. Up"; break;
		case vk_pagedown: r= "Pag. Down"; break;
		case vk_pause: r= "Pause"; break;
		case vk_printscreen: r= "Printscreen"; break;
		case vk_f1: r= "F1"; break;
		case vk_f2: r= "F2"; break;
		case vk_f3: r= "F3"; break;
		case vk_f4: r= "F4"; break;
		case vk_f5: r= "F5"; break;
		case vk_f6: r= "F6"; break;
		case vk_f7: r= "F7"; break;
		case vk_f8: r= "F8"; break;
		case vk_f9: r= "F9"; break;
		case vk_f10: r= "F10"; break;
		case vk_f11: r= "F11"; break;
		case vk_f12: r= "F12"; break;
		case vk_numpad0: r= "Numpad 0"; break;
		case vk_numpad1: r= "Numpad 1"; break;
		case vk_numpad2: r= "Numpad 2"; break;
		case vk_numpad3: r= "Numpad 3"; break;
		case vk_numpad4: r= "Numpad 4"; break;
		case vk_numpad5: r= "Numpad 5"; break;
		case vk_numpad6: r= "Numpad 6"; break;
		case vk_numpad7: r= "Numpad 7"; break;
		case vk_numpad8: r= "Numpad 8"; break;
		case vk_numpad9: r= "Numpad 9"; break;
		case vk_multiply: r= "Numpad *"; break;
		case vk_divide: r= "Numpad /"; break;
		case vk_add: r= "Numpad +"; break;
		case vk_subtract: r= "Numpad -"; break;
		case vk_decimal: r= "Numpad ."; break;
		case 221: r= "¿"; break;
		case 219: r= "'"; break;
		case 186: r= "´"; break;
		case 222: r= "{"; break;
		case 191: r= "}"; break;
		case 189: r= "Keyboard -"; break;
		case 187: r= "Keyboard +"; break;
		case 192: r= "Ñ"; break;
		case 188: r= ","; break;
		case 190: r= "."; break;
		case 226: r= "<"; break;
		case 91: r= "Start key"; break;
		case 144: r= "Numpad block"; break;
		case 93: r= "Paging"; break;
		case 220: r= "|"; break;
	}
	if val= vk_rcontrol {r= "Right Ctrl";}
	if val= vk_lcontrol {r= "Left Ctrl";}
	if val= vk_rshift {r= "Right Shift";}
	if val= vk_lshift {r= "Left Shift";}
	if val= vk_ralt {r= "Right Alt";}
	if val= vk_lalt {r= "Left Alt";}
	return r;
}
