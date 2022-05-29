function draw_text_outline(x,y,str,outwidth,outcol,outfidelty) {
	//Created by Andrew McCluskey http://nalgames.com/ (And ZorroMundoYT!)
	//x,y: Coordinates to draw
	//str: String to draw
	//outwidth: Width of outline in pixels
	//outcol: Colour of outline (main text draws with regular set colour)
	//outfidelity: Fidelity of outline (recommended: 4 for small, 8 for medium, 16 for larger. Watch your performance!)
	var orgcol= draw_get_color();
	draw_set_color(outcol);
	for (var i= 45; i<= 405; i+= 360/outfidelty;) {
		draw_text(x+lengthdir_x(outwidth,i),y+lengthdir_y(outwidth,i),str);
	}
	draw_set_color(orgcol);
	draw_text(x,y,str);
}
//Enable when needed.
/*function draw_text_ext_outline(x,y,str,sep,w,outwidth,outcol,outfidelty) {
	//Created by Andrew McCluskey http://nalgames.com/ (And ZorroMundoYT!)
	//x,y: Coordinates to draw
	//str: String to draw
	//outwidth: Width of outline in pixels
	//outcol: Colour of outline (main text draws with regular set colour)
	//outfidelity: Fidelity of outline (recommended: 4 for small, 8 for medium, 16 for larger. Watch your performance!)
	var orgcol= draw_get_color();
	draw_set_color(outcol);
	for (var i= 45; i<= 405; i+= 360/outfidelty;) {
		draw_text_ext(x+lengthdir_x(outwidth,i),y+lengthdir_y(outwidth,i),str,sep,w);
	}
	draw_set_color(orgcol);
	draw_text_ext(x,y,str,sep,w);
}
function draw_text_color_outline(x,y,str,c1,c2,c3,c4,alpha,outwidth,outcol1,outcol2,outcol3,outcol4,outfidelty) {
	//Created by Andrew McCluskey http://nalgames.com/ (And ZorroMundoYT!)
	//x,y: Coordinates to draw
	//str: String to draw
	//outwidth: Width of outline in pixels
	//outcol: Colour of outline (main text draws with regular set colour)
	//outfidelity: Fidelity of outline (recommended: 4 for small, 8 for medium, 16 for larger. Watch your performance!)
	for (var i= 45; i<= 405; i+= 360/outfidelty;) {
		draw_text_color(x+lengthdir_x(outwidth,i),y+lengthdir_y(outwidth,i),str,outcol1,outcol2,outcol3,outcol4,alpha);
	}
	draw_text_color(x,y,str,c1,c2,c3,c4,alpha);
}
function draw_text_ext_color_outline(x,y,str,sep,w,c1,c2,c3,c4,alpha,outwidth,outcol1,outcol2,outcol3,outcol4,outfidelty) {
	//Created by Andrew McCluskey http://nalgames.com/ (And ZorroMundoYT!)
	//x,y: Coordinates to draw
	//str: String to draw
	//outwidth: Width of outline in pixels
	//outcol: Colour of outline (main text draws with regular set colour)
	//outfidelity: Fidelity of outline (recommended: 4 for small, 8 for medium, 16 for larger. Watch your performance!)
	for (var i= 45; i<= 405; i+= 360/outfidelty;) {
		draw_text_ext_color(x+lengthdir_x(outwidth,i),y+lengthdir_y(outwidth,i),str,sep,w,outcol1,outcol2,outcol3,outcol4,alpha);
	}
	draw_text_ext_color(x,y,str,sep,w,c1,c2,c3,c4,alpha);
}
function draw_sprite_outline(sprite,subimg,x,y,outwidth,outcol,outfidelty) {
	//Created by Andrew McCluskey http://nalgames.com/ (And ZorroMundoYT!)
	//x,y: Coordinates to draw
	//str: String to draw
	//outwidth: Width of outline in pixels
	//outcol: Colour of outline (main text draws with regular set colour)
	//outfidelity: Fidelity of outline (recommended: 4 for small, 8 for medium, 16 for larger. Watch your performance!)
	var orgcol= draw_get_color();
	draw_set_color(outcol);
	for (var i= 45; i<= 405; i+= 360/outfidelty;) {
		draw_sprite(sprite,subimg,x+lengthdir_x(outwidth,i),y+lengthdir_y(outwidth,i));
	}
	draw_set_color(orgcol);
	draw_sprite(sprite,subimg,x,y);
}
function draw_sprite_ext_outline(sprite,subimg,x,y,xscale,yscale,rot,col,alpha,outwidth,outcol,outfidelty) {
	//Created by Andrew McCluskey http://nalgames.com/ (And ZorroMundoYT!)
	//x,y: Coordinates to draw
	//str: String to draw
	//outwidth: Width of outline in pixels
	//outcol: Colour of outline (main text draws with regular set colour)
	//outfidelity: Fidelity of outline (recommended: 4 for small, 8 for medium, 16 for larger. Watch your performance!)
	var orgcol= draw_get_color();
	draw_set_color(outcol);
	for (var i= 45; i<= 405; i+= 360/outfidelty;) {
		draw_sprite_ext(sprite,subimg,x+lengthdir_x(outwidth,i),y+lengthdir_y(outwidth,i),xscale,yscale,rot,col,alpha);
	}
	draw_set_color(orgcol);
	draw_sprite_ext(sprite,subimg,x,y,xscale,yscale,rot,col,alpha);
}*/
