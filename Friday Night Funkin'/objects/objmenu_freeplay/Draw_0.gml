draw_sprite_ext(sprmenu_background,bgimg,sprite_get_width(sprmenu_background)/2,sprite_get_height(sprmenu_background)/2,1,1,0,-1,1);
draw_sprite_ext(sprfreeplay_foreground,0,0,0,1,1,0,-1,1);

draw_set_font(global.alphabet);
draw_set_valign(fa_middle);
var xchange= 30;
var ychange= 120;
newy= lerp(newy,(global.freeplaysel*ychange),get_delta_timer(0.2,60));
newx= lerp(newx,(global.freeplaysel*xchange),get_delta_timer(0.2,60));
var xx= 25-newx;
var yy= room_height/2-newy;
var i= 0;
while i< array_length_1d(song) {
	if i= global.freeplaysel {var col= -1;}else{var col= c_gray;}
	draw_set_color(col);
	draw_text(xx,yy,string_upper(song[i]));
	if icon[i]>= 0 {draw_sprite_ext(spr_character_icons,icon[i],xx+string_width(string_upper(song[i]))+sprite_get_xoffset(spr_character_icons)+6,yy,1,1,0,-1,1);}
	xx+= xchange;
	yy+= ychange;
	i++;
}
draw_set_color(-1);
draw_set_valign(fa_top);
