///@arg id a unique ID of the user, can be undefined
///@arg email email of the user, can be undefined
///@arg username username of the user, can be undefined
///@arg map* optional map containing other user info
function sentry_set_user() {
	with sentry_handler {
		ds_map_destroy(precomputeUser);
		if argument_count> 3 {
			var map= ds_map_create();
			ds_map_copy(map,argument[3]);
			precomputeUser= argument[3];	
		}else{
			precomputeUser= ds_map_create();
		}
		if !is_undefined(argument[0]) {
			ds_map_add(precomputeUser,"id",argument[0]);	
		}
		if !is_undefined(argument[1]) {
			ds_map_add(precomputeUser,"email",argument[1]);	
		}
		if !is_undefined(argument[2]) {
			ds_map_add(precomputeUser,"username",argument[2]);	
		}
	}
}