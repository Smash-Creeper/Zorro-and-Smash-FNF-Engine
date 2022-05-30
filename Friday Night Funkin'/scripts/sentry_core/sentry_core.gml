function sentry_error_exists(UUID) {
with sentry_handler {return !is_undefined(ds_map_find_value(errorMap,string(UUID)));}
}
function sentry_error_pop(UUID) {
	var key= string(UUID);
	with sentry_handler {
		var retval= ds_map_find_value(errorMap,key);
		if !is_undefined(retval) {
			ds_map_delete(errorMap,key);
		}
		return retval;
	}
	return undefined;
}
function sentry_macros() {
	//macros moment
	#macro SENTRY_FATAL "fatal"
	#macro SENTRY_ERROR "error"
	#macro SENTRY_WARNING "warning"
	#macro SENTRY_INFO "info"
	#macro SENTRY_DEBUG "debug"
}
function sentry_request(buffer) {
	with sentry_handler {
		var timestamp= sentry_unix_timestamp();
		var x_auth= "Sentry sentry_version=7, sentry_client="+game_project_name+"/"+GM_version+", sentry_timestamp="+string(timestamp)+", sentry_key="+dsnPublicKey;
		if !is_undefined(dsnSecretKey) {x_auth+= ", sentry_secret"+dsnSecretKey;}
		var headers= ds_map_create();
		headers[?"Content-Type"]= "application/json";
		headers[?"X-Sentry-Auth"]= x_auth;
		var asyncId= http_request(endpoint,"POST",headers,buffer_base64_encode(buffer,0,buffer_get_size(buffer)));
		ds_map_destroy(headers);
		return asyncId;
	}
	return undefined;
}
function sentry_result_cancel(UUID) {
	var key= string(UUID);
	with sentry_handler {ds_map_delete(requestMap,key);}
}
function sentry_result_exists(UUID) {
with sentry_handler {return !is_undefined(ds_map_find_value(resultMap,string(UUID)));}
}
function sentry_result_pop(UUID) {
	var key= string(UUID);
	with sentry_handler {
		var retval= ds_map_find_value(resultMap,key);
		if !is_undefined(retval) {ds_map_delete(resultMap,key);}
		return retval;
	}
	return undefined;
}