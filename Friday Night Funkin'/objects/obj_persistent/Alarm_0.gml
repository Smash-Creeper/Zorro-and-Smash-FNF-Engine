//Initializing variables!
global.settings= ds_map_create();
global.keybinds= ds_map_create();
global.scores= ds_map_create();

//Loading save!
var file= SAVE_PATH+"info.sav";
if file_exists(file) {
	var f= file_text_open_read(file);
	/*
	Line 1: Settings
	Line 2: Keybinds
	Line 3: Scores
	*/
	ds_map_read(global.settings,file_text_read_string(f));
	file_text_readln(f);
	ds_map_read(global.keybinds,file_text_read_string(f));
	file_text_readln(f);
	ds_map_read(global.scores,file_text_read_string(f));
	file_text_close(f);
}

for (var i= 0; i< audio_get_listener_count(); i++;) {
	var map= audio_get_listener_info(i);
	if map!= -1 {
		audio_set_master_gain(map[?"index"],ds_map_default(global.settings,"Volume",100)/100);
		ds_map_destroy(map);
	}
}
room_speed= ds_map_default(global.settings,"Fps Cap",60);
window_set_fullscreen(ds_map_default(global.settings,"Fullscreen",0));
bgm_play(bgm_menu,0,,1); //Can accept undefined values (empty arguments)
