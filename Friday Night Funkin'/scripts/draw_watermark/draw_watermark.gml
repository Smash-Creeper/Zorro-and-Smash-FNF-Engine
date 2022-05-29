function draw_watermark(){
	draw_set_font(fnt_vcr_osd_mono);
	
	var txt= "FNF v1.0.0";
	
	if variable_global_exists("settings") {
		if ds_map_default(global.settings,"Show Fps",0) {
			txt+= "\nFPS: "+string(fps);
		}
	}
	var xx= camera_get_view_x(view_camera[0]);
	var yy= camera_get_view_y(view_camera[0]);
	if room= rm_editor {
		yy= 0;
	}
	
	draw_text_color((5+2)-xx,5-yy,txt,0,0,0,0,1);
	draw_text_color((5-2)-xx,5-yy,txt,0,0,0,0,1);
	draw_text_color(5-xx,(5+2)-yy,txt,0,0,0,0,1);
	draw_text_color(5-xx,(5-2)-yy,txt,0,0,0,0,1);
	draw_text_color((5-2)-xx,(5-2)-yy,txt,0,0,0,0,1);
	draw_text_color((5+2)-xx,(5+2)-yy,txt,0,0,0,0,1);
	draw_text_color((5-2)-xx,(5+2)-yy,txt,0,0,0,0,1);
	draw_text_color((5+2)-xx,(5-2)-yy,txt,0,0,0,0,1);
	
	draw_text_color(5-xx,5-yy,txt,-1,-1,-1,-1,1);
}