if drawvol {
	draw_set_alpha(0.8);
	var _x= (camera_get_view_width(view_camera[0])/2)+camera_get_view_x(view_camera[0]);
	draw_rectangle_color(_x-75,voly,_x+75,voly+75,0,0,0,0,0);
	draw_set_alpha(1);
	draw_set_color(-1);
	draw_set_font(fnt_vcr_osd_mono);
	draw_set_halign(fa_center);
	draw_set_valign(fa_top);
	draw_text_transformed(_x,voly+5,"Volume "+string(floor(global.settings[?"Volume"]))+"%",1,1,0);
	draw_healthbar(_x-65,voly+35,_x+65,voly+45,global.settings[?"Volume"],0,c_gray,-1,0,1,1);
	draw_set_halign(fa_left);
	if volt< 0 {
		if volt!= -1 {
			if floor(voly)!= -80 {
				voly= lerp(voly,-80,get_delta_timer(0.2,60));
			}else{
				drawvol= 0;
				voly= -80;
				volt= -1;
			}
		}
	}else{
		volt-= get_delta_timer(1,60);
		voly= lerp(voly,5,get_delta_timer(0.2,60));
	}
}
draw_watermark();
