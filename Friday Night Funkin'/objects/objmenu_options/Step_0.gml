if sel>= 0 {
	catnap= 0.6;
	selnap= 0.8;
}else{
	catnap= 0.8;
	selnap= 0.6;
}

catalp= lerp(catalp,catnap,get_delta_timer(0.2,60));
selalp= lerp(selalp,selnap,get_delta_timer(0.2,60));
