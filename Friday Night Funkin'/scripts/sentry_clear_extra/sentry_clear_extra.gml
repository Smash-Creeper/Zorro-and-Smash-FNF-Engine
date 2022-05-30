function sentry_clear_extra() {
	with sentry_handler {
		ds_map_clear(precomputeExtra);
	}
}