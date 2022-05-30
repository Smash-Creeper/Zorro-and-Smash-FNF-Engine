function sentry_timestamp_string(timestamp= date_current_datetime()){
	var oldTz= date_get_timezone();
	date_set_timezone(timezone_utc);
	var weekday= "", month= "";
	switch date_get_weekday(timestamp) {case 0: weekday= "Saturday"; break; case 1: weekday= "Sunday"; break; case 2: weekday= "Monday"; break; case 3: weekday= "Tuesday"; break; case 4: weekday= "Wednesday"; break; case 5: weekday= "Thursday"; break; case 6: weekday= "Friday"; break;}
	switch date_get_month(timestamp) {case 1: month= "January"; break; case 2: month= "February"; break; case 3: month= "March"; break; case 4: month= "April"; break; case 5: month= "May"; break; case 6: month= "June"; break; case 7: month= "July"; break; case 8: month= "August"; break; case 9: month= "September"; break; case 10: month= "October"; break; case 11: month= "November"; break; case 12: month= "December"; break;}
	var datetimeString= weekday+", "+month+" "+string(date_get_day(timestamp))+", "+string(date_get_year(timestamp))+", "+string((date_get_hour(timestamp)> 12?date_get_hour(timestamp)-12: (date_get_hour(timestamp)= 0?12: date_get_hour(timestamp))))+":"+string_replace_all(string_format(date_get_minute(timestamp),2,0)," ","0")+":"+string_replace_all(string_format(date_get_second(timestamp),2,0)," ","0")+" "+(date_get_hour(timestamp)> 12?"PM":"AM");
	//var datetimeString= string_format(date_get_year(timestamp),4,0)+"-"+string_format(date_get_month(timestamp),2,0)+"-"+string_format(date_get_day(timestamp),2,0)+"T"+string_format(date_get_hour(timestamp),2,0)+":"+string_format(date_get_minute(timestamp),2,0)+":"+string_format(date_get_second(timestamp),2,0); datetimeString= string_replace_all(datetimeString," ","0");
	date_set_timezone(oldTz);
	return datetimeString;
}