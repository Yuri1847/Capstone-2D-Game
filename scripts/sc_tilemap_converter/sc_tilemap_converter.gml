function sc_tilemap_converter(tilemapData){
	for(var i = array_length(tilemapData)-1; i >= 0; i--){
		draw_tilemap(layer_tilemap_get_id(layer_get_id(tilemapData[i])), 0,0);
	}
}