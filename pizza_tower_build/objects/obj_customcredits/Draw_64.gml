draw_set_font(global.creditsfont)
draw_set_color(c_white)
draw_set_halign(fa_center)
draw_set_alpha(1)

// just to make screen black at start
// if statement should make it go away
if !four
	draw_sprite_ext(spr_bpixel, 0, 0, 0, 960, 540, 0, c_black, 1)
	
// for d's animation	
dancing_d_image += 0.1
if (dancing_d_image > 14)
	dancing_d_image -= 14

if four
{
    draw_sprite_tiled(bg_credits3, 0, x, (y + scroll / 2.15))
    draw_sprite_tiled(bg_credits2, 0, x, (y + scroll / 1.75))
    draw_sprite_tiled_ext(bg_credits, 0, x, (y + scroll / 1.5), 1, 1, c_white, 0.5)
	
	// draws Pizza Tower Title
    draw_sprite(spr_creditstitle, 0, 475, (310 + scroll))
	// Tribute to the legend, McPig
	draw_text(485, (475 + scroll), "Original Game by McPig")
    draw_sprite(spr_dancingpig, ani_pig, 475, (575 + scroll))
	
	// its a ME!
	draw_text(485, (750 + scroll), "Web Port by burnedpopcorn180")
    draw_sprite(burnedshit_credits, ani_pop, 475, (860 + scroll))
	
	draw_text(485, (1000 + scroll), "FMOD Sound Script by D-Official")
	draw_sprite(spr_dancing_d, dancing_d_image, 475, (1120 + scroll))
	
    draw_text(485, (1250 + scroll), "Noise Update Decompilation by loypoll")
    //draw_sprite(spr_crybaby, imindex, 475, (1355 + scroll))
	
    draw_text(485, (1505 + scroll), "Thanks Nero for making\n the new CToP Title Card for the Noise!")
	// below are ALL Yellow Text
    draw_set_color(c_yellow)
    draw_text(485, (1600 + scroll), "Special Thanks to:")

	// Images from the Discord
    draw_sprite(spr_credits1, imindex, 100, (1600 + scroll))
    draw_sprite(spr_credits2, imindex, 850, (1600 + scroll))
	
    draw_sprite(spr_credits3, imindex, 100, (1750 + scroll))
    draw_sprite(spr_credits4, imindex, 850, (1750 + scroll))
	
    draw_sprite(spr_credits5, imindex, 100, (1850 + scroll))
    draw_sprite(spr_credits6, imindex, 850, (1850 + scroll))

    draw_text(485, (1850 + scroll), "freddyroland   Bushy\n\n BfbFan26   BlueShyGuy\n\n Luigi	   Louis Shadow 2000")
    draw_set_color(c_white)
	// back to white
    draw_text(485, (2100 + scroll), "And thanks to all of the members of the\n burnedprojects Discord! \n These ports would not have been\n made without your support!")
    draw_text_color(485, 270, "Enjoy The Noise Update in the Browser!", c_white, c_white, c_white, c_white, fade2)
}

if one
    draw_text(485, (95 + scroll), "Thank you")
if two
    draw_text(485, (135 + scroll), "For Playing")
if (three && four == 0)
    draw_sprite(spr_creditstitle, 0, 475, (310 + scroll))
	
if four
    draw_sprite_ext(spr_pixel, 0, 0, 0, 960, 540, 0, c_white, flash)
	
draw_sprite_ext(spr_pixel, 0, 0, 0, 960, 540, 0, c_black, fade)
if popup
    draw_text(750, 500, "Press Any Key to Exit.")
