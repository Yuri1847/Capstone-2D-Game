if (current_time - cutscene_start_time >= cutscene_duration) {
    if (layer_exists("ins_cutscene")) {
        layer_destroy("ins_cutscene");
    }
    sc_visible_layer(["right_option_layer", "pause_button_layer"]);
	instance_activate_all(); 

    instance_destroy(); 
    room_goto(next_room);
}
