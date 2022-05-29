size= lerp(size,0.7,clamp(get_delta_timer(0.12,60),0,1));
if alarm0< 0 {
	if alarm0!= -1 {
		size= 1;
		alarm0= alr0;
	}
}else{
	alarm0-= get_delta_timer(1,60);
}
