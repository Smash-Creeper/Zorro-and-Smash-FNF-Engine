function sentry_saved_count() {
	with sentry_handler {
		var count= 0;
		var file= file_find_first(gmSentryLogFilePrefix+"*",0);
		while file!= "" {
			count++;
			file= file_find_next();
		}
		file_find_close();
		return count;
	}
	return undefined;
}