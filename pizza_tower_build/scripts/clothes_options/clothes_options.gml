global.clothes_allunlock = 0;

function clothes_unlock(_palettename, _paletteselect, _texture = noone, peppino = true)
{
	ini_open_from_string(obj_savesystem.ini_str_options);
	ini_write_real("Palettes", _palettename, true);
	obj_savesystem.ini_str_options = ini_close();
}

function all_clothes_unlock() {
	// Pep Palettes
	clothes_unlock("unfunny", 3);
	clothes_unlock("mooney", 15);
	clothes_unlock("sage", 5);
	clothes_unlock("money", 4);
	clothes_unlock("blood", 6);
	clothes_unlock("tv", 7);
	clothes_unlock("dark", 8);
	clothes_unlock("shitty", 9);
	clothes_unlock("golden", 10);
	clothes_unlock("garish", 11);
	// Pep Patterns
	clothes_unlock("funny", 12, spr_peppattern1);
	clothes_unlock("itchy", 12, spr_peppattern2);
	clothes_unlock("pizza", 12, spr_peppattern3);
	clothes_unlock("stripes", 12, spr_peppattern4);
	clothes_unlock("goldemanne", 12, spr_peppattern5);
	clothes_unlock("bones", 12, spr_peppattern6);
	clothes_unlock("pp", 12, spr_peppattern7);
	clothes_unlock("war", 12, spr_peppattern8);
	clothes_unlock("john", 12, spr_peppattern9);
	// Pep Halloween
	clothes_unlock("candy", 5, spr_peppattern10);
	clothes_unlock("bloodstained", 10, spr_peppattern11);
	clothes_unlock("bat", 15, spr_peppattern12);
	clothes_unlock("pumpkin", 20, spr_peppattern13);
	clothes_unlock("fur", 25, spr_peppattern14);
	clothes_unlock("flesh", 30, spr_peppattern15);
	
	// Noise Palettes			peppino = false
	clothes_unlock("boise", 3, -4, false);
	clothes_unlock("roise", 4, noone, false);
	clothes_unlock("poise", 5, noone, false);
	clothes_unlock("reverse", 6, -4, false);
	clothes_unlock("critic", 7, -4, false);
	clothes_unlock("outlaw", 8, -4, false);
	clothes_unlock("antidoise", 9, -4, false);
	clothes_unlock("flesheater", 10, -4, false);
	clothes_unlock("super", 11, -4, false);
	clothes_unlock("porcupine", 15, -4, false);
	clothes_unlock("feminine", 16, -4, false);
	clothes_unlock("realdoise", 17, -4, false);
	clothes_unlock("forest", 18, -4, false);
	// Noise Patterns
	clothes_unlock("racer", 28, spr_noisepattern1, false);
	clothes_unlock("comedian", 27, spr_noisepattern2, false);
	clothes_unlock("banana", 26, spr_noisepattern3, false);
	clothes_unlock("noiseTV", 25, spr_noisepattern4, false);
	clothes_unlock("madman", 24, spr_noisepattern5, false);
	clothes_unlock("bubbly", 23, spr_noisepattern6, false);
	clothes_unlock("welldone", 22, spr_noisepattern7, false);
	clothes_unlock("grannykisses", 21, spr_noisepattern8, false);
	clothes_unlock("towerguy", 20, spr_noisepattern9, false);
	// Noise Halloween	
	clothes_unlock("candy", 5, spr_peppattern10, false);
	clothes_unlock("bloodstained", 10, spr_peppattern11, false);
	clothes_unlock("bat", 15, spr_peppattern12, false);
	clothes_unlock("pumpkin", 20, spr_peppattern13, false);
	clothes_unlock("fur", 25, spr_peppattern14, false);
	clothes_unlock("flesh", 30, spr_peppattern15, false);
}