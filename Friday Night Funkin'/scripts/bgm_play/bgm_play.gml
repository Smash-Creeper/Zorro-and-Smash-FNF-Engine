function bgm_play(audio,slot,overwrite=undefined,loop=undefined,channel=undefined){
	bgm_init();
	if channel= undefined {channel= slot;}
	if loop= undefined {loop= 0;}
	if overwrite= undefined {overwrite= 0;}
	if slot>= array_length_1d(global.__bgm_id) {
		trace("Warning! Slot ("+string(slot)+") is higher than initialized slots ("+string(array_length_1d(global.__bgm_id))+"), this might lead to crashes!");
		//Try to initialize slots before a crash happens!
		for (var i= array_length_1d(global.__bgm_id)+1; i<= slot+1; i++;) {
			global.__bgm_id[i]= -1;
		}
	}
	if audio_is_playing(global.__bgm_id[slot]) {
		trace("Warning! Audio is already playing in slot "+string(slot)+"!");
		if overwrite {
			trace("Warning! Overwrite audio is enabled, you may lose all control of the last sample being played.");
			if audio_exists(audio) {
				global.__bgm_id[slot]= audio_play_sound(audio,channel,loop);
			}
			return 1;
		}else{
			return 0;
		}
	}else{
		if audio_exists(audio) {
			global.__bgm_id[slot]= audio_play_sound(audio,channel,loop);
		}
		return 1;
	}
}