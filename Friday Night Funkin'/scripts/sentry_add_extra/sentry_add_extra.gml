///@arg key key of custom data
///@arg value value of custom data
///@arg is_map* if true, adds as a nested map, otherwise it's added directly (lists and other ds types are not supported, serialize them instead)
function sentry_add_extra() {
	var key= argument[0];
	var value= argument[1];
	with sentry_handler {
		if argument_count> 2 && argument[2] {
			ds_map_replace_map(precomputeExtra,key,value);
		}else{
			ds_map_replace(precomputeExtra,key,value);
		}
	}
}