//Background momento
draw_sprite_ext(sprmenu_background,bgimg,room_width/2,room_height/2+bg_yoff,bgsize,bgsize,0,-1,1);

image_index+= get_delta_timer(0.3,60);
image_index= image_index% sprite_get_number(sprite_index);

var spr= (global.menusel= 0? sprmenu_storymode1: sprmenu_storymode0);
draw_sprite_ext(spr,image_index,x,y,1,1,0,-1,1);

var spr= (global.menusel= 1 ? sprmenu_freeplay1 : sprmenu_freeplay0);
draw_sprite_ext(spr,image_index+1,x,y+160,1,1,0,-1,1);

var spr= (global.menusel= 2? sprmenu_options1: sprmenu_options0);
draw_sprite_ext(spr,image_index+2,x,y+(160*2),1,1,0,-1,1);

var spr= (global.menusel= 3? sprmenu_donate1: sprmenu_donate0);
draw_sprite_ext(spr,image_index+3,x,y+(160*3),1,1,0,-1,1);
