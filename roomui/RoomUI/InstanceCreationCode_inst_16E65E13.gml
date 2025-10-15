function clickButton(){
	
	obj_Pause_manager.pause = false;
	obj_Pause_manager.update_pause();
	
	sc_visible_layer([
		"right_option_layer", 
		"pause_button_layer", 
	]);						
									
	sc_invisible_layer(["load_slot3_dialog_layer"])
	sc_invisible_layer(["state_slot_load_layer"])
	instance_activate_object(obj_state_slot_load);
	with(obj_state_slot_load){
		obj_state_slot_load.isEnabled = false;
	}
	global.is_main_state = false;
	state_slot1_load_game()
	obj_player.x = global.state_slot3_data.player_x;
	obj_player.y = global.state_slot3_data.player_y;
	with (all) {
	    if (persistent && object_index != obj_player && 
		object_index != obj_Inventory && 
		object_index != obj_Pause_manager &&
		object_index != obj_slider_bar &&
		object_index != obj_state_slot_save &&
		object_index != obj_state_slot_load) {
	        instance_destroy();
	    }
	}
	room_goto(asset_get_index(global.state_slot3_data.last_room));
	
}