destroy= 0;
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
global.alphabet= font_add_sprite_ext(sprfreeplay_alphabet,"ABCDEFGHIJKLMNOPQRSTUVWXYZ, 0123456789-.:@_",1,2);
global.vocstream= -1;
global.bgmstream= -1;
global.bpmstream= 0;

bpmtimer= 0;
camz= 0; //Camera Zoom Value (In Pixels)
camn= 0; //Camera Lerp Zoom Value (In Pixels)
camw= camera_get_view_width(view_camera[0]);
camh= camera_get_view_height(view_camera[0]);

drawvol= 0;
volt= -1;
voly= -80;
statuse= 1;
if !np_initdiscord("965494945303629884",0,np_steam_app_id_empty) { //Init Discord status
	trace("Error: NekoPresence didn't Init!");
	statuse= -1;
}
global.DiscordAvatarSpr= -1;
global.DiscordAvatar= "";
global.DiscordID= "";
global.DiscordUsername= "";
global.DiscordDiscriminator= "";
//NekoPresence's Wiki: https://github.com/nkrapivin/NekoPresence/wiki
