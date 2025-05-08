//This was updated for RPS with GX.GAMES Compatiblity
function pal_swap_draw_palette(_sprite,_index,_x,_y) {
	draw_sprite_part(_sprite,0,floor(_index),0,1,sprite_get_height(_sprite),_x,_y);
}