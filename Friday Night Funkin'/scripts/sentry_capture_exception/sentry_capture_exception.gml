///@arg exception the GM exception to log
///@arg logger* optional logger name
function sentry_capture_exception(argument0) {
	var exception= argument0;
	var logger= (argument_count> 1)?argument[1]: "logger";
	return sentry_capture_message(exception,SENTRY_ERROR,logger,undefined,1);
}