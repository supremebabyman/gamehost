group_arr = -4;
offload_arr = -4;
alarm[0] = 1;
depth = -601;
dark = false;
screenscale = 1;
pause = false;
pauseID = -4;
scr_create_pause_image();
sound_list = ds_list_create();
instance_list = ds_list_create();
scr_pause_deactivate_objects(false);

// so basically, this is what happens
// Create -> Alarm 0 -> Alarm 1 & Draw (repeat until texture load is done) -> Destroy -> Clean Up