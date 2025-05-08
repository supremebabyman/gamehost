var _levelinfo = level_array[selected_world][selected_level];
if (!instance_exists(obj_option))
{
	scr_menu_getinput();//scr_getinput_ls();
	if (!instance_exists(obj_fadeout))
	{
		var _m = key_down2 - key_up2;
		selected_world += _m;
		selected_world = clamp(selected_world, 0, array_length(level_array) - 1);
		if _m != 0
			selected_level = 0;
		selected_level += (key_left2 + key_right2);
		selected_level = clamp(selected_level, 0, array_length(level_array[selected_world]) - 1);
	}
	with obj_player
	{
		movespeed = 0;
		hsp = 0;
		vsp = 0;
	}
	if !active
		exit;
		
	// Key Left doesn't seem to work...
	if (key_down2 || key_up2 || key_left2 || key_right2)
		fmod_event_one_shot("sfx/pep/step");
		
	if (key_jump2 && !instance_exists(obj_fadeout))
	{
		fmod_event_one_shot("event:/sfx/ui/select");
		with obj_player
		{
			global.leveltosave = _levelinfo[2];
			global.leveltorestart = _levelinfo[1];
			state = states.comingoutdoor;
			movespeed = 0;
			hsp = 0;
			vsp = 0;
			targetRoom = _levelinfo[1];
			targetDoor = "A";
			instance_create(x, y, obj_fadeout);
		}
	}
	if (instance_exists(obj_fadeout))
	{
		with obj_player
			image_index = 0;
	}
}
for (var i = 0; i < array_length(toppin_info); i++)
{
	toppin_info[i][0] += 0.35;
	if (toppin_info[i][0] > sprite_get_number(toppin_info[i][1]))
		toppin_info[i][0] = frac(toppin_info[i][0]);
}

// Below is Custom shit
// very VERY BADLY MADE CUSTOM SHIT
// GOD SAVE ME
// FOR I HAVE SINNED


// if World 1 selected, and it was changed before
if (concat(world_array[selected_world]) == "WORLD 1") {
	layer_set_visible(bg_2, true);
	layer_set_visible(bg_3, false);
	layer_set_visible(bg_4, false);
	layer_set_visible(bg_5, false);
	layer_set_visible(bg_6, false);
}
if (concat(world_array[selected_world]) == "WORLD 2") {
	layer_set_visible(bg_2, false);
	layer_set_visible(bg_3, true);
	layer_set_visible(bg_4, false);
	layer_set_visible(bg_5, false);
	layer_set_visible(bg_6, false);
}
if (concat(world_array[selected_world]) == "WORLD 3") {
	layer_set_visible(bg_2, false);
	layer_set_visible(bg_3, false);
	layer_set_visible(bg_4, true);
	layer_set_visible(bg_5, false);
	layer_set_visible(bg_6, false);
}
if (concat(world_array[selected_world]) == "WORLD 4") {
	layer_set_visible(bg_2, false);
	layer_set_visible(bg_3, false);
	layer_set_visible(bg_4, false);
	layer_set_visible(bg_5, true);
	layer_set_visible(bg_6, false);
}
if (concat(world_array[selected_world]) == "WORLD 5") {
	layer_set_visible(bg_2, false);
	layer_set_visible(bg_3, false);
	layer_set_visible(bg_4, false);
	layer_set_visible(bg_5, false);
	layer_set_visible(bg_6, true);
}

// to detect if Boss Room Selected
if ((_levelinfo[1] == boss_pepperman) || (_levelinfo[1] == boss_vigilante) || (_levelinfo[1] == boss_noise) || (_levelinfo[1] == boss_fakepep) || (_levelinfo[1] == tower_pizzafacehall)  || (_levelinfo[1] == tower_finalhallway))
	boss_room = true;
else
	boss_room = false;
	
// For Treasures
// oh yeah I lOvE sLoP cOdE
if _levelinfo[1] == entrance_1
	treasure_frame = 0;
else if _levelinfo[1] == medieval_1
	treasure_frame = 1;
else if _levelinfo[1] == ruin_1
	treasure_frame = 2;
else if _levelinfo[1] == dungeon_1
	treasure_frame = 3;
// World 2
else if _levelinfo[1] == badland_1
	treasure_frame = 4;
else if _levelinfo[1] == graveyard_1
	treasure_frame = 5;
else if _levelinfo[1] == farm_2
	treasure_frame = 6;
else if _levelinfo[1] == saloon_1
	treasure_frame = 7;
// World 3
else if _levelinfo[1] == plage_entrance
	treasure_frame = 8;
else if _levelinfo[1] == forest_1
	treasure_frame = 9;
else if _levelinfo[1] == space_1
	treasure_frame = 10;
else if _levelinfo[1] == minigolf_1
	treasure_frame = 11;
// World 4
else if _levelinfo[1] == street_intro
	treasure_frame = 12;
else if _levelinfo[1] == sewer_1
	treasure_frame = 13;
else if _levelinfo[1] == industrial_1
	treasure_frame = 14;
else if _levelinfo[1] == freezer_1
	treasure_frame = 16; // 15 is unused
// World 5
else if _levelinfo[1] == chateau_1
	treasure_frame = 17;
else if _levelinfo[1] == kidsparty_1
	treasure_frame = 18;
else if _levelinfo[1] == war_1
	treasure_frame = 19;
