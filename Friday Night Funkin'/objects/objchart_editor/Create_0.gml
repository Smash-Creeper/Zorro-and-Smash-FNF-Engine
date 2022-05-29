//Defaults
chunksize= 64;
notecount= 4; //Not fully supported?
charts= 2;
bpm= 100;
notespeed= 1;
bgm= -1;
voc= -1;

//Editor
chartpos= 0;
color= 0;
chartp= 0;
gridl= ds_list_create();
/*
Chart separated as:
Chunks
Arrows (Ordered by addition)
*/

if !variable_global_exists("chart") {global.chart= ds_grid_create(notecount*charts,chunksize) /*notecount*charts,chunksize*/}else{ds_grid_clear(global.chart,"0");}
if !variable_global_exists("mapinfo") {global.mapinfo= ds_map_create();}else{ds_map_clear(global.mapinfo);}
if variable_global_exists("chartpath") {
	var f= file_text_open_read(global.chartpath);
	/*
	Line 1: Ds List (Charting)
	Line 2: Ds Map (Map Info)
	*/
	ds_grid_read(global.chart,file_text_read_string(f));
	file_text_readln(f);
	ds_map_read(global.mapinfo,file_text_read_string(f));
	file_text_close(f);
}else{
	global.chartpath= "";
}
if ds_map_exists(global.mapinfo,"BPM") {bpm= global.mapinfo[?"BPM"];}
if ds_map_exists(global.mapinfo,"Notespeed") {notespeed= global.mapinfo[?"Notespeed"];}
if ds_map_exists(global.mapinfo,"Chunksize") {chunksize= global.mapinfo[?"Chunksize"];}
if ds_map_exists(global.mapinfo,"Chunksize") {chunksize= global.mapinfo[?"Chunksize"];}
if ds_map_exists(global.mapinfo,"Notecount") {notecount= global.mapinfo[?"Notecount"];}
if ds_map_exists(global.mapinfo,"Chart Count") {charts= global.mapinfo[?"Chart Count"];}
global.mapinfo[?"BGM Path"]= "Inst.ogg";
global.mapinfo[?"VOICES Path"]= "Voices.ogg";
if ds_map_exists(global.mapinfo,"BGM Path") {
	var path= APP_PATH+global.mapinfo[?"BGM Path"];
	if path!= "" {
		if file_exists(path) {
			bgm= audio_create_stream(path);
		}else{
			trace("Warning! BPM Path doesn't exist, Path: \""+path+"\"");
		}
	}
}
if ds_map_exists(global.mapinfo,"VOICES Path") {
	var path= APP_PATH+global.mapinfo[?"VOICES Path"];
	if path!= "" {
		if file_exists(path) {
			voc= audio_create_stream(path);
		}else{
			trace("Warning! VOICES Path doesn't exist, Path: \""+path+"\"");
		}
	}
}