function bgm_get_id(slot){
	bgm_init();
	if slot<= array_length_1d(global.__bgm_id) {
		return global.__bgm_id[slot];
	}else{
		trace("Slot "+string(slot)+" doesn't exist!");
		return -1;
	}
}