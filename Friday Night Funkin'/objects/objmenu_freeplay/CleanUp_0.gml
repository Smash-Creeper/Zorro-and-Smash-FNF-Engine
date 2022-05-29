for (i= 0; i< array_length_1d(bgmd); i++;) {
	if audio_exists(bgmd[i]) && i!= global.freeplaysel {
		audio_destroy_stream(bgmd[i]);
	}
}
for (i= 0; i< array_length_1d(vocd); i++;) {
	if audio_exists(vocd[i]) && i!= global.freeplaysel {
		audio_destroy_stream(vocd[i]);
	}
}
