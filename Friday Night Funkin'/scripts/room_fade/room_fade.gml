function room_fade(duration=undefined,room,verify_instance= 1){
	if duration= undefined {
		duration= ROOMFADE_SPEED;
	}
	if verify_instance> 0 {if instance_exists(obj_roomfade) {return -1;}}
	var ins= instance_create_depth(0,-sprite_get_height(spr_fade),0,obj_roomfade);
	ins.duration= duration;
	ins.rm= room;
	return ins;
}
