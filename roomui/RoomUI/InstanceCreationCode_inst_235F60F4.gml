function clickButton(){
	
	sc_visible_layer([
		"right_option_layer", 
		"pause_button_layer", 
	]);
									
									
	sc_invisible_layer(["state_slot1_dialog_layer"])
	global.is_main_state = false;
	
	instance_activate_object(obj_player)
	instance_activate_object(obj_joystick_base)
	instance_activate_object(obj_multitouch_manager)
	instance_activate_object(obj_Inventory)
	state_slot1_load_game()
	
	obj_player.x = global.state_slot1_data.player_x;
	obj_player.y = global.state_slot1_data.player_y;
	room_goto(asset_get_index(global.state_slot1_data.last_room));
	
}