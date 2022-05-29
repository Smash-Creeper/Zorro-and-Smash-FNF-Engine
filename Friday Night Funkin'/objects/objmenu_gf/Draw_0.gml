image_index+= get_delta_timer(0.33,60);
image_index= image_index% sprite_get_number(sprite_index);

draw_self();
