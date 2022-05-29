depth= -2147483648;
if mode= 0 {time+= get_delta_timer(1,60);}else{time-= get_delta_timer(1,60);}
if time>= duration {mode= 1; if room_exists(rm) {room_goto(rm);}}
if time< 0 {instance_destroy();}
y+= get_delta_timer((sprite_get_height(sprite_index)+(room_height/2))/(duration),60);
