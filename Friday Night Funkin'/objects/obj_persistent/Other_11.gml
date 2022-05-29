if variable_global_exists("settings") && variable_global_exists("scores") {
	//Saving stats!
	var f= file_text_open_write(SAVE_PATH+"info.sav");
	/*
	Line 1: Settings
	Line 2: Keybinds
	Line 3: Scores
	*/
	file_text_write_string(f,ds_map_write(global.settings));
	file_text_writeln(f);
	file_text_write_string(f,ds_map_write(global.keybinds));
	file_text_writeln(f);
	file_text_write_string(f,ds_map_write(global.scores));
	file_text_close(f);
}
