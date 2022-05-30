exception_unhandled_handler(function(ex) {
	var error;
	if string_copy(ex.longMessage,1,5)= "FATAL" {
	error= SENTRY_FATAL;
	}else{
		error= SENTRY_ERROR;
	}
	var dat= ds_map_create();
	ds_map_add(dat,"Game build date",sentry_timestamp_string(GM_build_date));
	ds_map_add(dat,"UTC Current time",sentry_timestamp_string());
	sentry_add_breadcrumb("Info.",SENTRY_INFO,"Game info.",dat);
	var codeinfo= "";
	if string_pos(" - ",ex.longMessage)!= 0 {
		codeinfo= "Code line: "+string_copy(ex.longMessage,string_pos(" - ",ex.longMessage)+3,string_length(ex.longMessage));
	}
	var str= "";
	for (i= 0; i< array_length_1d(ex.stacktrace); i++;) {
		str+= ex.stacktrace[i]+"\r\n";
	}
	sentry_capture_message((error= SENTRY_ERROR?"ERROR":"FATAL ERROR")+" at: "+ex.stacktrace[0]+"\r\nError: "+ex.message+"\r\n"+codeinfo+"\r\n\r\n"+ex.longMessage,error,undefined,1);
	show_debug_message((error= SENTRY_ERROR?"ERROR":"FATAL ERROR")+" at:\r\n"+str+"Error: "+ex.message+"\r\n"+codeinfo+"\r\n\r\n"+ex.longMessage);
	ds_map_destroy(dat);
	show_message((error= SENTRY_ERROR?"ERROR":"FATAL ERROR")+" at:\n"+str+ex.message);
});