function bgm_init(slot_count=25){
	if !variable_global_exists("bgm_hasinit") {
		global.bgm_hasinit= 1;
		for (var i= 0; i<= slot_count; i++;) {
			global.__bgm_id[i]= -1; //Audio IDs
		}
		return 1;
	}else{
		global.bgm_hasinit= 0;
		return 0;
	}
}