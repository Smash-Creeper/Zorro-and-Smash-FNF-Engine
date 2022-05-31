//sentry_init("https://085f0b465a9a4286b15b4cf7998229cb@o1267233.ingest.sentry.io/6453335");
instance_deactivate_all(1);
if variable_global_exists("settings") {
	//Cool menu resuming xD
	if !bgm_is_playing(0) {
		wfenabled= 1;
		bgm_play(bgm_menu,0,,1); //Can accept undefined values (empty arguments)
	}
	wfenabled= 0;
	curtext= 11;
	instance_activate_all();
}else{
	wfenabled= 1;
	if !instance_exists(obj_persistent) {instance_create_depth(0,0,0,obj_persistent);}
	with obj_persistent {alarm[0]= 2;} //Letting the window be created before doing anything.
}

//Some cool local variables

title_jokes(0,0);
randomize();
wfalpha= 0;
audio= -1;
curtext= 0;
text[0]= "zorromundoyt";
text[1]= text[0]+"\npresents";
text[2]= "a recreation of";
text[3]= text[2]+"\nninjamuffin99, PhantomArcade,\nkawaisprite and evilsk8ers\ngame";
text[4]= "";
var tempj= irandom_range(0,array_length(joke)-1);
text[5]= title_jokes(tempj,1);
text[6]= title_jokes(tempj,0);
text[7]= "friday";
text[8]= text[7]+"\nnight";
text[9]= text[8]+"\nfunkin'";
text[10]= text[9]+"\ngamemaker remake";
text[11]= "";
