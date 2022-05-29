///@desc ds_map_default(id,key,default);
///@arg id
///@arg key
///@arg default
function ds_map_default(i,key,def){
	if !ds_map_exists(i,key) {
	i[?key]= def;
	}
	return i[?key];
}