//Background momento
draw_sprite_ext(sprmenu_background,bgimg,sprite_get_width(sprmenu_background)/2,sprite_get_height(sprmenu_background)/2,1,1,0,-1,1);
draw_set_alpha(catalp);
draw_set_color(0);
draw_rectangle(0,0,room_width,room_height/4,0);
draw_set_alpha(selalp);
draw_rectangle(0,room_height/4+1,room_width,room_height,0);
draw_set_color(-1);
draw_set_alpha(1);
var selected_color= -1;
var unselected_color= merge_color(c_gray,c_dkgray,0.25);
var blocked_color= c_dkgray;
var categories= ["GAME","GRAPHICS","KEYBINDS"];
var blocked_categories= [0, 0, 0]; //Lesser than 1 means not blocked, else means blocked

while array_length_1d(blocked_categories)< array_length_1d(categories) {
	array_push(blocked_categories,0);
}

if sel< 0 && moveable {
	if check_input(INP_EXIT,INPM_PRESSED) {
		if room_fade(ROOMFADE_SPEED,rm_menu)!= -1 {
			bgm_play(sfx_cancel_menu,1,1);
		}
	}
	if check_input(INP_UI_LEFT,INPM_PRESSED) {
		catsel--;
		bgm_play(sfx_scroll_menu,1,1);
	}
	if check_input(INP_UI_RIGHT,INPM_PRESSED) {
		catsel++;
		bgm_play(sfx_scroll_menu,1,1);
	}
	if catsel> catselmax {catsel= 0;}
	if catsel< 0 {catsel= catselmax;}
	if check_input(INP_ENTER,INPM_PRESSED) || check_input(INP_UI_DOWN,INPM_PRESSED) {
		alarm[0]= 1; //1 Frame for stopping the input.
		bgm_play(sfx_scroll_menu,1,1);
	}
}

var catmode= 0;
draw_set_font(fnt_phantommuff_full_letters);
draw_set_halign(fa_center);
draw_set_valign(fa_top);
for (var i= 0; i< array_length_1d(categories); i++;) {
	draw_set_color(blocked_categories[i]<= 0? (catsel= i? selected_color: unselected_color): (catsel= i? merge_color(blocked_color,unselected_color,0.5): blocked_color));
	if sel>= 0 {
		draw_set_color(blocked_categories[i]<= 0? (catsel= i? unselected_color: merge_color(blocked_color,0,0.2)): (catsel= i? merge_color(blocked_color,unselected_color,0.25): merge_color(blocked_color,0,0.5)));
	}
	switch catmode {
		case 0:
		draw_text_outline(room_width/2-(room_width/3),room_height/6-(string_height("A")*0.75),string(categories[i]),2,0,12);
		break;
		case 1:
		draw_text_outline(room_width/2,room_height/6-(string_height("A")*0.75),string(categories[i]),2,0,12);
		break;
		case 2:
		draw_text_outline(room_width/2+(room_width/3),room_height/6-(string_height("A")*0.75),string(categories[i]),2,0,12);
		break;
	}
	catmode= (catmode+1)%3;
}
draw_set_halign(fa_left);

if !surface_exists(surf) {
	surf= surface_create(camera_get_view_width(view_camera[0]),camera_get_view_height(view_camera[0]));
}else{
	surface_resize(surf,camera_get_view_width(view_camera[0]),camera_get_view_height(view_camera[0]));
}
surface_set_target(surf);

var subcategories= [];
var blocked_subcategories= []; //Lesser than 1 means not blocked, else means blocked
switch catsel {
	case 0:
	subcategories= ["FULLSCREEN", "FPS CAP", "SHOW FPS", "DISCORD STATUS", "VOLUME", "CURRENT GPU"];
	blocked_subcategories= [0, 0, 0, 0, 0, 1];
	break;
	case 1:
	break;
	case 2:
	subcategories= [gpsel? "<GAMEPAD>": "<KEYBOARD>", "SELECT", "EXIT", "UI LEFT", "UI DOWN", "UI UP", "UI RIGHT", "LEFT", "DOWN", "UP", "RIGHT", "SUBTRACT VOLUME","ADD VOLUME"];
	blocked_subcategories= [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
	break;
}

while array_length_1d(blocked_subcategories)< array_length_1d(subcategories) {
	array_push(blocked_subcategories,0); //Might not work??
}

if sel>= 0  && moveable {
	if check_input(INP_EXIT,INPM_PRESSED) {
		sel= -1;
		bgm_play(sfx_cancel_menu,1,1);
	}
	if check_input(INP_UI_UP,INPM_PRESSED) {
		sel--;
		if sel>= 0 {
			bgm_play(sfx_scroll_menu,1,1);
		}else{
			bgm_play(sfx_cancel_menu,1,1);
		}
	}
	if check_input(INP_UI_DOWN,INPM_PRESSED) {
		if !(sel+1>= array_length_1d(subcategories)) {
			sel++;
			bgm_play(sfx_scroll_menu,1,1);
		}
	}
}

var _x= 20;
var _y= room_height/4+(string_height("A")/2)-cury;
var _ysep= 6;

newy= 0;
if sel> 2 {
	newy= ((sel-2)*string_height("A")+_ysep);
}

cury= lerp(cury,newy,get_delta_timer(0.2,60));

for (var i= 0; i< array_length_1d(subcategories); i++;) {
	draw_set_color(blocked_subcategories[i]<= 0? (sel= i? selected_color: unselected_color): (sel= i? merge_color(blocked_color,selected_color,0.5): blocked_color));
	if sel< 0 {
		draw_set_color(blocked_subcategories[i]<= 0? (merge_color(blocked_color,0,0.2)): (merge_color(blocked_color,0,0.4)));
	}
	custom_text= "";
	current_subcat= subcategories[i];
	currenti= i;
	event_user(0);
	draw_text_outline(_x,_y,subcategories[i]+custom_text,2,0,12);
	_y+= string_height(subcategories[i]+custom_text)+_ysep;
}

surface_reset_target();
draw_surface_part_ext(surf,0,room_height/4+1,room_width,room_height,0,room_height/4+1,1,1,-1,1);
