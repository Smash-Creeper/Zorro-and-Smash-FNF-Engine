draw_set_font(fnt_pixel_arial);
draw_set_color(-1);
draw_set_alpha(1);
draw_set_color(-1);
var t= 0;
if bgm_is_playing(20000) {
	t= bgm_get_track_position(20000);
}
if bgm_is_playing(20001) {
	t= max(t,bgm_get_track_position(20001));
}
var bary= 128*((t*notespeed)-(chartpos/4));

//Draw chart chunk

var gride= 0;
var grids= 0;
var _x= room_width/2-((((charts*notecount)+1)*64)/2);
var w= ((charts*notecount)+1)*64;
var _xe= 0;
var ext= -(bary*2);
var _y= floor(125+ext);
var arrv= 0;
chartpos= floor((t*notespeed)/(chunksize/4))*chunksize;
/*repeat (notecount*charts)-array_length_1d(global.chart)+1 {
	array_push(global.chart,[]);
}*/

if ds_grid_height(global.chart)< chartpos+(chunksize*2) {
	ds_grid_resize(global.chart,notecount*charts,chartpos+(chunksize*2));
}
ds_grid_resize(global.chart,(notecount*charts)+1,ds_grid_height(global.chart));
ds_list_clear(gridl);
for (var i= chartpos; i< (chartpos+(chunksize)); i++;) {
	_xe= 0;
	var e= 0;
	e++;
	if e> notecount {
		if ds_list_find_index(gridl,_x+_xe)= -1 {
			ds_list_add(gridl,_x+_xe);
		}
		e= 1;
	}
	/*if i>= chartpos+chunksize {
		draw_set_color(merge_color(merge_color(-1,c_gray,0.5),c_dkgray,0.5));
	}else{
		draw_set_color(merge_color(-1,c_gray,0.5));
	}*/
	for (var a= 0; a< notecount*charts; a++;) {
		var val= a+gride;
		grids++;
		if val/2= floor(val/2) {
			draw_set_color(merge_color(merge_color(-1,c_gray,0.5),c_dkgray,0.5));
		}else{
			draw_set_color(merge_color(-1,c_gray,0.5));
		}
		draw_rectangle(_x+(64*a)+_xe,_y+(64*gride),_x+(64*a)+_xe+63,_y+(64*gride)+63,0);
	}
	//draw_text_color(_x+_xe,_y+(64*gride),ds_grid_get(global.chart,a,i),0,0,0,0,1);
	var o= ds_grid_get(global.chart,a,i);
	while o> 0 {
		var arr= string_parse(ds_grid_get(global.chart,a,i),",",1);
		trace(arr);
		draw_fnfarrow(_x+_xe+109,_y+(64*gride)+110,0,0.41,0.41,,,,arr[0],array_length_1d(arr)> 1? arr[1]: ARROWM_NORMAL,arrv,1);
		arrv= (arrv+1)%(min(notecount,4));
		_xe+= 64;
		gride++;
		o--;
	}
}

if mouse_x>= _x && mouse_x<= _x+w-65 {
	if mouse_y>= _y && mouse_y<= _y+(64*gride) {
		var xx= _x+(floor((mouse_x-_x)/64)*64);
		var yy= (floor((mouse_y-_y)/64)*64)+_y;
		draw_set_color(c_dkgray);
		draw_set_alpha(0.5);
		draw_rectangle(xx,yy,xx+63,yy+63,0);
		draw_set_color(0);
		draw_rectangle(xx+3,yy+3,xx+60,yy+60,1);
		draw_rectangle(xx+4,yy+4,xx+59,yy+59,1);
		draw_set_alpha(1);
		draw_set_color(-1);
		var gridx= floor((mouse_x-_x)/64);
		var gridy= (floor(chartpos/64)*64)+floor((mouse_y-_y)/64);
		if mouse_check_button_pressed(mb_left) {
			var val= ds_grid_get(global.chart,gridx,gridy);
			var arr= string_parse(val,",",1);
			if val= "0" {
				ds_grid_set(global.chart,gridx,gridy,string(ARROW_NORMAL)+","+string(ARROWM_NORMAL));
			}else{
				var pval= real(arr[0])+1;
				if pval<= ARROW_NORMAL {
					ds_grid_set(global.chart,gridx,gridy,string(min(real(arr[0])+1,ARROW_NORMAL))+","+arr[1]);
				}else{
					ds_grid_set(global.chart,gridx,gridy,"0");
				}
			}
		}
		if mouse_check_button_pressed(mb_right) {
			ds_grid_set(global.chart,gridx,gridy,"0");
		}
	}
}

//window_set_caption(string(floor((mouse_x-_x)/64))+", "+string((floor(chartpos/64)*64)+floor((mouse_y-_y)/64)));
draw_set_color(0);
/*for (i= 0; i< ds_list_size(gridl); i++;) {
	draw_rectangle(gridl[|i],_y,gridl[|i]+1,_y+(chunksize*128),0);
}*/
draw_set_color(c_gray);
draw_rectangle(_x-64,125,_x+w,126,0);
draw_set_color(-1);
