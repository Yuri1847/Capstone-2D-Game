function sc_visible_layer(data){
	var layers = layer_get_all();
    for (var i = 0; i < array_length(layers); i++) {
        var layerID = layers[i];
        var layerName = layer_get_name(layerID);

        for (var j = 0; j < array_length(data); j++) {
            if (string_pos(data[j], layerName) == 1) {
                layer_set_visible(layerID, true);
                instance_activate_layer(layerID);
                break;
            }
        }
    }
}
