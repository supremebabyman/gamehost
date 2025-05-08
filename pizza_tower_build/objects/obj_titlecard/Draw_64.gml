// note: var s is replaced cuz why can't it just be forced to one if it never changes
// in draw_sprite only: irandom_range(-s, s)
if start
{
	// if Noise and CToP, then load @Nero's Custom CToP title card
	if room == tower_finalhallwaytitlecard { 
		if !obj_player1.ispeppino {
			draw_sprite(spr_titlecards, 20, 0, 0);
			draw_sprite(spr_titlecards_title2, 5, 32 + irandom_range(-1, 1), irandom_range(-1, 1));
			}
			else {
			draw_sprite(titlecard_sprite, titlecard_index, 0, 0);
			draw_sprite(title_sprite, title_index, 32 + irandom_range(-1, 1), irandom_range(-1, 1));
			}
		for (var i = 0; i < array_length(noisehead); i++)
		{
			var head = noisehead[i];
			if !head.visible
			{
				
			}
			else
			{
				head.visual_scale = Approach(head.visual_scale, 1, 0.25);
				draw_sprite_ext(spr_titlecard_noise, head.image_index, head.x, head.y, head.scale * head.visual_scale, head.scale * head.visual_scale, 0, c_white, 1);
			}
		}
	}
	
	else { // if not CToP, continue with normal shit
		draw_sprite(titlecard_sprite, titlecard_index, 0, 0);
		//var s = 1;
		draw_sprite(title_sprite, title_index, 32 + irandom_range(-1, 1), irandom_range(-1, 1));
		for (var i = 0; i < array_length(noisehead); i++)
		{
			var head = noisehead[i];
			if !head.visible
			{
				
			}
			else
			{
				head.visual_scale = Approach(head.visual_scale, 1, 0.25);
				draw_sprite_ext(spr_titlecard_noise, head.image_index, head.x, head.y, head.scale * head.visual_scale, head.scale * head.visual_scale, 0, c_white, 1);
			}
		}
	}

}
if !instance_exists(obj_fadeout)
	draw_set_alpha(fadealpha);
else
	draw_set_alpha(obj_fadeout.fadealpha);
draw_rectangle_color(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT, 0, 0, 0, 0, false);
draw_set_alpha(1);
