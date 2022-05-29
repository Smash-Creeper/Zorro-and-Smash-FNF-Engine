function bgm_is_playing(slot){
	bgm_init();
	if slot>= array_length_1d(global.__bgm_id) {
		trace("Warning! Slot ("+string(slot)+") is higher than initialized slots ("+string(array_length_1d(global.__bgm_id))+"), this might lead to crashes!");
		//Try to initialize slots before a crash happens!
		for (var i= array_length_1d(global.__bgm_id)+1; i<= slot+1; i++;) {
			global.__bgm_id[i]= -1;
		}
	}
	return audio_is_playing(global.__bgm_id[slot]);
}
