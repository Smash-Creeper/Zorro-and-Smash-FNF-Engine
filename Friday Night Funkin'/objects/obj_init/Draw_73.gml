draw_set_font(fnt_phantommuff_full_letters);
draw_set_halign(fa_center);
draw_set_alpha(1);
draw_set_color(-1);
if wfenabled {draw_text(room_width*0.5,room_height*0.3056,string_upper(text[curtext]));}
draw_set_halign(fa_left);
draw_set_alpha(wfalpha);
if wfenabled {draw_rectangle_color(0,0,room_width,room_height,-1,-1,-1,-1,0);}
draw_set_alpha(1);
if wfalpha>= 0 {wfalpha-= get_delta_timer(0.02,60);}
