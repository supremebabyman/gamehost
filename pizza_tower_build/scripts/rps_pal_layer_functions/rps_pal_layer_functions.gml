// Should be called once before setting up any layers to pal swap.
function pal_swap_layer_init() {
	ds_map_clear(global.retro_pal_swapper.layer_map);
	ds_priority_clear(global.retro_pal_swapper.layer_priority);
	ds_priority_clear(global.retro_pal_swapper.layer_temp_priority);
}

//draws the specified layer using the specified palette in the specified event.
function pal_swap_set_layer(_pal_sprite, _pal_index, _layer_index, _pal_is_surface) {
	var _data = ds_map_find_value(global.retro_pal_swapper.layer_map,_layer_index);
	if(_data == undefined) return;  //Swapping not enabled on this layer
  
	global.retro_pal_swapper.layer_map[? _layer_index] = {sprite: _pal_sprite, index: _pal_index, is_surf: _pal_is_surface};
}

///   This script sets layer start and end scripts. 
///   This script should not be called in either a step event or a draw event.  
///   It should only be called once.
function pal_swap_enable_layer(_layer_index) {
  if(!layer_exists(_layer_index)) return;

  var _data = {sprite: undefined, index: undefined, is_surf: undefined}

  layer_script_begin(_layer_index,function() {
    if(event_type == ev_draw) {
        var _id = ds_priority_delete_min(global.retro_pal_swapper.layer_priority);
        var _data = global.retro_pal_swapper.layer_map[? _id];
        if(_data == "<undefined>") return;
        
        pal_swap_set(_data.sprite,_data.index,_data.is_surf);
        ds_priority_add(global.retro_pal_swapper.layer_temp_priority,_id,layer_get_depth(_id));
    }
  });    
  layer_script_end(_layer_index,function() {
    if(event_type == ev_draw) {
        pal_swap_reset();
        if(ds_priority_empty(global.retro_pal_swapper.layer_priority))
        {
            ds_priority_copy(global.retro_pal_swapper.layer_priority,global.retro_pal_swapper.layer_temp_priority);
            ds_priority_clear(global.retro_pal_swapper.layer_temp_priority);
        }
    }
  });

  global.retro_pal_swapper.layer_map[? _layer_index] = _data;
  ds_priority_add(global.retro_pal_swapper.layer_priority,_layer_index,layer_get_depth(_layer_index));
}

