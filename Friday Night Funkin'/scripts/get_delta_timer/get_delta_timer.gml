function get_delta_timer(value=1,org_fps=60){
	//Value: Value you want deltatimed.
	//Org_Fps: FPS the value was tested on.
	return (delta_time/1000000)*(value*org_fps);
}