function sentry_browser_string() {
	switch os_browser {
		case browser_not_a_browser: return undefined;
		case browser_ie: case browser_ie_mobile: return "Internet Explorer"; break;
		case browser_firefox: return "Firefox"; break;
		case browser_chrome: return "Chrome"; break;
		case browser_safari: case browser_safari_mobile: return "Safari"; break;
		case browser_opera: return "Opera"; break;
		default: return "Unknown Browser"; break;
	}
}
function sentry_datetime_string(timestamp= date_current_datetime()) {
	var oldTz= date_get_timezone();
	date_set_timezone(timezone_utc);
	var weekday= "", month= "";
	switch date_get_weekday(timestamp) {case 0: weekday= "Saturday"; break; case 1: weekday= "Sunday"; break; case 2: weekday= "Monday"; break; case 3: weekday= "Tuesday"; break; case 4: weekday= "Wednesday"; break; case 5: weekday= "Thursday"; break; case 6: weekday= "Friday"; break;}
	switch date_get_month(timestamp) {case 1: month= "January"; break; case 2: month= "February"; break; case 3: month= "March"; break; case 4: month= "April"; break; case 5: month= "May"; break; case 6: month= "June"; break; case 7: month= "July"; break; case 8: month= "August"; break; case 9: month= "September"; break; case 10: month= "October"; break; case 11: month= "November"; break; case 12: month= "December"; break;}
	//var datetimeString= weekday+", "+month+" "+string(date_get_day(timestamp))+", "+string(date_get_year(timestamp))+", "+string((date_get_hour(timestamp)> 12?date_get_hour(timestamp)-12: (date_get_hour(timestamp)= 0?12: date_get_hour(timestamp))))+":"+string_replace_all(string_format(date_get_minute(timestamp),2,0)," ","0")+" "+(date_get_hour(timestamp)> 12?"PM":"AM");
	var datetimeString= string_format(date_get_year(timestamp),4,0)+"-"+string_format(date_get_month(timestamp),2,0)+"-"+string_format(date_get_day(timestamp),2,0)+"T"+string_format(date_get_hour(timestamp),2,0)+":"+string_format(date_get_minute(timestamp),2,0)+":"+string_format(date_get_second(timestamp),2,0); datetimeString= string_replace_all(datetimeString," ","0");
	date_set_timezone(oldTz);
	return datetimeString;
}
function sentry_os_string() {
	switch os_type {
		case os_windows: case os_uwp: case os_win8native: return "Windows"; break;
		case os_linux: return "Linux"; break;
		case os_macosx: return "Mac OS X"; break;
		case os_ios: return "iOS"; break;
		case os_android: return "Android"; break;
		case os_ps4: return "PlayStation"; break;
		case os_xboxone: return "XBox"; break;
		case os_switch: return "Switch"; break;
		default: return "Unknown" break;
	}
}
function sentry_os_version_string() {
	switch os_type {
		case os_windows: case os_uwp: case os_win8native:
		switch os_version {
		case 327680: return "2000"; break;
		case 327681: case 237862: return "XP"; break;
		case 393216: return "Vista"; break;
		case 393217: return "7"; break;
		case 393218: return "8"; break;
		case 393219: return "8.1"; break;
		case 655360: return "10"; break;
		}
		break;
		case os_macosx: case os_ios:
		var major= os_version>> 24, minor= (os_version>> 12)& 0xfff;
		return string(major)+"."+string(minor); break;
		case os_android:
		switch os_version {
			case 21: case 22: return "Lollipop"; break;
			case 23: return "Marshmallow"; break;
			case 24: return "Nougat"; break;
			case 25: return "Oreo"; break;
			case 26: return "Pie"; break;
		}
		break;
	}
	return "Unknown";
}
function sentry_system_string() {
	var device;
	switch os_browser {
		case browser_not_a_browser:
			switch os_type {
				case os_windows: case os_uwp: case os_win8native:
				device= "Windows";
				switch os_version {
					case 327680: device+= " 2000"; break;
					case 327681: case 237862: device+= " XP"; break;
					case 393216: device+= " Vista"; break;
					case 393217: device+= " 7"; break;
					case 393218: device+= " 8"; break;
					case 393219: device+= " 8.1"; break;
					case 655360: device+= " 10"; break;
				}
				break;
				case os_linux: device= "Linux"; break;
				case os_macosx:
				device= "Mac OS X";
				var major= os_version>> 24;
				var minor= (os_version>> 12)& 0xfff;
				device+= " "+string(major)+"."+string(minor);
				break;
				case os_ios:
				switch os_device {
					case device_ios_ipad: case device_ios_ipad_retina: device= "iPad"; break;
					case device_ios_iphone: case device_ios_iphone_retina: case device_ios_iphone6: case device_ios_iphone6plus: case device_ios_iphone5: device= "iPhone"; break;
					default: device= "iOS" break;
				}
				var major= os_version>> 24;
				var minor= (os_version>> 12)& 0xfff;
				device+= " "+string(major)+"."+string(minor);
				break;
				case os_android:
				switch os_device {
					case device_tablet: device= "Android Tablet"; break;
					default: device= "Android" break;
				}
				switch os_version {
					case 21: case 22: device+= " Lollipop"; break;
					case 23: device+= " Marshmallow"; break;
					case 24: device+= " Nougat"; break;
					case 25: device+= " Oreo"; break;
					case 26: device+= " Pie"; break;
				}
				break;
				case os_ps4: device= "PlayStation"; break;
				case os_xboxone: device= "XBox"; break;
				case os_switch: device= "Switch"; break;
				default: device= "Unknown" break;
			}
			break;
			case browser_ie: case browser_ie_mobile: device= "Internet Explorer"; break;
			case browser_firefox: device= "Firefox"; break;
			case browser_chrome: device= "Chrome"; break;
			case browser_safari: case browser_safari_mobile: device= "Safari"; break;
			case browser_opera: device= "Opera"; break;
			default: device= "Browser"; break;
		}
	return device;
}
function sentry_unix_timestamp() {
	var oldTz = date_get_timezone();
	date_set_timezone(timezone_utc);
	var timestamp= floor((date_current_datetime()-25569)*86400);
	date_set_timezone(oldTz);
	return timestamp;
}
function sentry_uuid4_string() {
	// we cheat and use md5
	var uuid= md5_string_utf8(string(current_time)+string(date_current_datetime())+string(random(1000000)));
	uuid= string_set_byte_at(uuid,13,ord("4"));
	uuid= string_set_byte_at(uuid,17,ord(choose("8","9","a","b")));
	return uuid;
}