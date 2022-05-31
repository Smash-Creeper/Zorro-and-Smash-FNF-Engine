draw_set_alpha(time/duration);
draw_sprite_ext(sprite_index,0,view_get_xport(0),y-sprite_get_height(sprite_index),view_get_wport(0),1,0,-1,1);
draw_sprite_ext(sprite_index,0,view_get_xport(0),y+sprite_get_height(sprite_index),view_get_wport(0),-1,0,-1,1);
draw_set_alpha(1);
