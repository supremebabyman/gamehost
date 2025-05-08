selected_level = 0;
selected_world = 0;
active = false;
alarm [0] = 30;
global.leveltorestart = -4;
world_array[0] = "WORLD 1";
world_array[1] = "WORLD 2";
world_array[2] = "WORLD 3";
world_array[3] = "WORLD 4";
world_array[4] = "WORLD 5";
level_array[0][0] = ["JOHN GUTTER", entrance_1, "entrance"];
//					[0],          [1],         [2]
level_array[0][1] = ["PIZZASCAPE", medieval_1, "medieval"];
level_array[0][2] = ["ANCIENT CHEESE", ruin_1, "ruin"];
level_array[0][3] = ["BLOODSAUCE DUNGEON", dungeon_1, "dungeon"];
level_array[0][4] = ["PEPPERMAN FIGHT", boss_pepperman, "b_pepperman"];
level_array[1][0] = ["OREGANO DESERT", badland_1, "badland"];
level_array[1][1] = ["WASTEYARD", graveyard_1, "graveyard"];
level_array[1][2] = ["FUN FARM", farm_2, "farm"];
level_array[1][3] = ["FAST FOOD SALOON", saloon_1, "saloon"];
level_array[1][4] = ["VIGILANTE FIGHT", boss_vigilante, "b_vigilante"];
level_array[2][0] = ["CRUST COVE", plage_entrance, "plage"];
level_array[2][1] = ["GNOME FOREST", forest_1, "forest"];
level_array[2][2] = ["DEEP DISH 9", space_1, "space"];
level_array[2][3] = ["MINI GOLF", minigolf_1, "minigolf"];
level_array[2][4] = ["NOISE FIGHT", boss_noise, "b_noise"];
level_array[3][0] = ["PIG CITY", street_intro, "street"];
level_array[3][1] = ["OH SHIT!", sewer_1, "sewer"];
level_array[3][2] = ["PEPPIBOT FACTORY", industrial_1, "industrial"];
level_array[3][3] = ["REFRIGERATOR FREEZERATOR", freezer_1, "freezer"];
level_array[3][4] = ["FAKE PEPPINO FIGHT", boss_fakepep, "b_fakepep"];
level_array[4][0] = ["PIZZASCARE", chateau_1, "chateau"];
level_array[4][1] = ["DONT MAKE A SOUND", kidsparty_1, "kidsparty"];
level_array[4][2] = ["WAR", war_1, "war"];
level_array[4][3] = ["PIZZAFACE FIGHT", tower_pizzafacehall, "b_pizzaface"];
level_array[4][4] = ["CRUMBLING TOWER OF PIZZA", tower_finalhallway, ""];
toppin_info[0] = [0, spr_toppinshroom];
toppin_info[1] = [0, spr_toppincheese];
toppin_info[2] = [0, spr_toppintomato];
toppin_info[3] = [0, spr_toppinsausage];
toppin_info[4] = [0, spr_toppinpineapple];
stickpressed = false;
key_up2 = false;
key_down2 = false;
key_left2 = false;
key_right2 = false;
key_jump2 = false;

// for boss room detection
boss_room = false;
// for treasures
treasure_frame = 0;

// For Background shit
bg_2 = layer_get_id("Backgrounds_2");
bg_3 = layer_get_id("Backgrounds_3");
bg_4 = layer_get_id("Backgrounds_4");
bg_5 = layer_get_id("Backgrounds_5");
bg_6 = layer_get_id("Backgrounds_6");