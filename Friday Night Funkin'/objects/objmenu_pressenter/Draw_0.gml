image_index+= get_delta_timer(0.25,60);
image_index= image_index% sprite_get_number(sprite_index);

draw_sprite_ext(sprite_index,image_index,x,y,image_xscale,image_yscale,image_angle,image_blend,image_alpha);
draw_sprite_ext(intrspr,image_index,x,y,image_xscale,image_yscale,image_angle,image_blend,image_alpha*intr);
