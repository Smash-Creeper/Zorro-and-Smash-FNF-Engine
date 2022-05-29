function bgm_stop(slot){
	bgm_init();
	if slot>= array_length_1d(global.__bgm_id) {
		trace("Warning! Slot ("+string(slot)+") is higher than initialized slots ("+string(array_length_1d(global.__bgm_id))+"), this might lead to crashes!");
		//Try to initialize slots before a crash happens!
		for (var i= array_length_1d(global.__bgm_id)+1; i<= slot+1; i++;) {
			global.__bgm_id[i]= -1;
		}
	}
	if audio_is_playing(global.__bgm_id[slot]) {
		audio_stop_sound(global.__bgm_id[slot]);
		return 1;
	}else{
		trace("Warning! No audio in slot "+string(slot)+" is being played while trying to stop it! Try using bgm_play instead!");
		return 0;
	}
}