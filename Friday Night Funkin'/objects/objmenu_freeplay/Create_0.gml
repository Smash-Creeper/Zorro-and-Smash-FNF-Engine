bgimg= 1;

if !variable_global_exists("freeplaysel") {global.freeplaysel= 0;}
maxsel= 0;

song= []; //Song name
bgmp= []; //BGM path
vocp= []; //Voices path
icon= []; //Icon number
bgmd= []; //BGM Audio ID
vocd= []; //Voices Audio ID
chap= []; //Chart Path
bpm= []; //Camera Zoom BPM
diff= []; //Difficulties Array
var f= file_text_open_read(ASSETS_PATH+"freeplayList.txt");
while !file_text_eof(f) {
	var txt= file_text_read_string(f);
	if string_copy(txt,1,2)!= "//" {
		var map= json_decode(txt);
		if map!= -1 {
			trace(json_encode(map));
			var arr= map[?"default"];
			if ds_list_size(arr)> 6 {
				array_push(song,string(arr[|0]));
				array_push(bpm,real(arr[|1]));
				var path= string(arr[|2]);
				if !file_exists(APP_PATH+path) {trace("Warning! BGM Path doesn't exist, Path: \""+path+"\""); path= "";}
				array_push(bgmp,APP_PATH+path);
				path= string(arr[|3]);
				if !file_exists(APP_PATH+path) {trace("Warning! VOICES Path doesn't exist, Path: \""+path+"\""); path= "";}
				array_push(vocp,APP_PATH+path);
				path= string(arr[|4]);
				if !file_exists(APP_PATH+path) {trace("Warning! CHART Path doesn't exist, Path: \""+path+"\""); path= "";}
				array_push(chap,APP_PATH+path);
				array_push(icon,real(arr[|5]));
				array_push(bgmd,-1);
				array_push(vocd,-1);
				var temp= [];
				for (var i= 0; i< ds_list_size(arr[|6]); i++;) {
					array_push(temp,arr[|6][|i]);
				}
				array_push(diff,temp);
				temp= -1;
			}else{
				trace(@"Warning! Invalid ARRAY, the ARRAY needs to be like:
[<Song name, string>, <BPM, real>, <BGM Path, string (path)>, <VOICES Path, string (path)>, <CHART Path, string (path)>, <Icon, real>, <Difficulties, array>]
[     Argument 0    , Argument 1 ,        Argument 2        ,          Argument 3         ,         Argument 4         ,  Argument 5 ,      Argument 6      ]");
			}
			ds_map_destroy(map);
		}else{
			trace("Warning! Invalid ARRAY!");
		}
	}
	file_text_readln(f);
}
file_text_close(f);
maxsel= array_length_1d(song)-1;
newx= 0;
newy= 0;

bgmmenus= -1;
vocmenus= -1;

if variable_global_exists("bgmstream") {
	if bgm_is_playing(10000) {
		if audio_get_name(bgm_get_id(10000))= audio_get_name(global.bgmstream) {
			//bgmmenus= bgm_get_track_position(10000);
			bgmd[global.freeplaysel]= global.bgmstream;
			global.bgmstream= -1;
		}
	}
}
if variable_global_exists("vocstream") {
	if bgm_is_playing(10001) {
		if audio_get_name(bgm_get_id(10001))= audio_get_name(global.vocstream) {
			//vocmenus= bgm_get_track_position(10001);
			vocd[global.freeplaysel]= global.vocstream;
			global.vocstream= -1;
		}
	}
}
