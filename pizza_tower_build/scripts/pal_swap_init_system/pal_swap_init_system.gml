// This was updated for RPS with GX.GAMES Compatiblity

// If you're using an older version of PT, you might have to change pal_swap_init_system_fix() back to pal_swap_init_system()
// ^ IMPORTANT

// This Function Initiates the palette system.  Call once at the beginning of your game somewhere.
function pal_swap_init_system_fix(_shader = shd_pal_swapper) {
	
	var _swapper = {
  	shader: noone,
  	texel_size: [0],
  	uvs: [0],
  	index: [0],
  	texture: [0],
  	layer_priority: 0,
  	layer_temp_priority: 0,
  	layer_map: 0,
	
  	cleanup: function() {
  		ds_priority_destroy(layer_priority);
  		ds_priority_destroy(layer_temp_priority);
  		ds_map_destroy(layer_map);
  	}
  }
	// Set Shader shd_pal_swapper Up
	_swapper.shader = _shader;
	_swapper.texel_size = shader_get_uniform(_shader, "texel_size");
	_swapper.uvs = shader_get_uniform(_shader, "palette_UVs");
	_swapper.index = shader_get_uniform(_shader, "palette_index");
	_swapper.texture = shader_get_sampler_index(_shader, "palette_texture");
	
	_swapper.layer_priority = ds_priority_create();
	_swapper.layer_temp_priority = ds_priority_create();
	_swapper.layer_map = ds_map_create();
	
	global.retro_pal_swapper = _swapper;
	
	// Compatiblity for Pizza Tower
	global.Pal_Shader = _shader;
	global.Pal_Texel_Size = shader_get_uniform(_shader, "texel_size");
	global.Pal_UVs = shader_get_uniform(_shader, "palette_UVs");
	global.Pal_Index = shader_get_uniform(_shader, "palette_index");
	global.Pal_Texture = shader_get_sampler_index(_shader, "palette_texture");
	if argument_count > 1 && argument[1]
		global.Pal_Map = ds_map_create();
	
	global.Pattern_Texture_Indexed = -4;
	global.Base_Pattern_Color = [1, 2];
	
	// Patterns
	global.Pattern_Texture = shader_get_sampler_index(_shader, "pattern_texture");
	global.Pattern_Enable = shader_get_uniform(_shader, "pattern_enabled");
	global.Pattern_Tex_Data = shader_get_uniform(_shader, "pattern_tex_data");
	global.Pattern_UVs = shader_get_uniform(_shader, "pattern_UVs");
	
	// Unused in RPS for GX.GAMES
	// Is used for normal PT RPS
	global.Pattern_Spr_UVs = shader_get_uniform(_shader, "sprite_UVs");
	global.Pattern_Spr_Tex_Data = shader_get_uniform(_shader, "sprite_tex_data");
	global.Pattern_Spr_Scale = shader_get_uniform(_shader, "sprite_scale");
	global.Pattern_Color_Array = shader_get_uniform(_shader, "color_array");
	global.Pattern_Solid_Color = shader_get_uniform(_shader, "pattern_solid_color");
	
	// For Noise Update (Delete if using Older Build without shd_noise_afterimage)
	global.N_Pal_Texture = shader_get_sampler_index(shd_noise_afterimage, "palette_texture");
	global.N_Texel_Size = shader_get_uniform(shd_noise_afterimage, "texel_size");
	global.N_Pal_UVs = shader_get_uniform(shd_noise_afterimage, "palette_UVs");
	global.N_Pal_Index = shader_get_uniform(shd_noise_afterimage, "palette_index");
	global.N_Pal_Y = shader_get_uniform(shd_noise_afterimage, "palette_y");
	global.N_Pattern_Tex = shader_get_sampler_index(shd_noise_afterimage, "pattern_texture");
	global.N_Pattern_Enabled = shader_get_uniform(shd_noise_afterimage, "pattern_enabled");
	global.N_Pattern_UVs = shader_get_uniform(shd_noise_afterimage, "pattern_UVs");
}
