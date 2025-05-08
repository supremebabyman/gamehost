// This was updated for RPS with GX.GAMES Compatiblity
function pal_swap_set(_pal_sprite, _pal_index, _is_surface = false) {
	
	var _swapper = global.retro_pal_swapper;
	if(_pal_index == 0) exit;

	
		shader_set(_swapper.shader);

		var _tex = sprite_get_texture(_pal_sprite, 0),
				_UVs = sprite_get_uvs(_pal_sprite, 0);
	  texture_set_stage(_swapper.texture, _tex);
    
	  var _texel_x = texture_get_texel_width(_tex),
	      _texel_y = texture_get_texel_height(_tex),
	      _texel_hx = _texel_x * 0.5,
	      _texel_hy = _texel_y * 0.5;
    
	  shader_set_uniform_f(_swapper.texel_size, _texel_x, _texel_y);
	  shader_set_uniform_f(_swapper.uvs, _UVs[0] + _texel_hx, _UVs[1] + _texel_hy, _UVs[2], _UVs[3]);
	  shader_set_uniform_f(_swapper.index, _pal_index);
}
