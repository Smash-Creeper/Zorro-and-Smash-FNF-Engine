if instance_number(obj_persistent)> 1 {
	global.perstemp= id;
	with obj_persistent {
		if id> global.perstemp {
			global.perstemp= id;
		}
	}
	if global.perstemp= id {
		destroy= 1;
		instance_destroy();
	}
}
