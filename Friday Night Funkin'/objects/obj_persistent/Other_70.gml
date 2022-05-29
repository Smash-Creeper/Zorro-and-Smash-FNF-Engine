var evtyp= async_load[?"event_type"];
switch evtyp {
	case "DiscordReady":
	global.DiscordAvatar= async_load[?"avatar"];
	global.DiscordDiscriminator= async_load[?"discriminator"];
	global.DiscordID= async_load[?"user_id"];
	global.DiscordUsername= async_load[?"username"];
	event_user(0);
	sprite_add(np_get_avatar_url(async_load[?"user_id"],async_load[?"avatar"]),1,0,0,0,0);
	//Uses Async - Image Loaded for setting the sprite!
	break;
	case "DiscordError":
	trace("Discord Error: "+async_load[?"error_message"]+" ("+string(async_load[?"error_code"])+")!");
	break;
	case "DiscordDisconnected":
	trace("Discord Disconnected: "+async_load[?"error_message"]+" ("+string(async_load[?"error_code"])+")!");
	break;
}

