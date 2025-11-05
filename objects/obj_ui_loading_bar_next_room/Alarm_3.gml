if(global.room_check == "main_menu"){
	global.room_check = ""
	sc_visible_layer([
	//"right_option_layer", 
	"pause_button_layer", 
]);
	
	global.is_main_state = true;
	instance_activate_object(obj_player)
	instance_activate_object(obj_joystick_base)
	instance_activate_object(obj_multitouch_manager)
	instance_activate_object(obj_Inventory)
	
	file_handling_load_game()
	obj_player.x = global.file_handling_data.player_x;
	obj_player.y = global.file_handling_data.player_y;
	room_goto(asset_get_index(global.file_handling_data.last_room));
}else if(global.room_check == "load_slot_1"){
	global.room_check = ""
	sc_visible_layer([
		"right_option_layer", 
		"pause_button_layer", 
	]);
									
	sc_invisible_layer(["load_slot1_main_dialog_layer"])
	global.is_main_state = false;
	
	instance_activate_object(obj_player)
	instance_activate_object(obj_joystick_base)
	instance_activate_object(obj_multitouch_manager)
	instance_activate_object(obj_Inventory)
	state_slot1_load_game()
	
	obj_player.x = global.state_slot1_data.player_x;
	obj_player.y = global.state_slot1_data.player_y;
	room_goto(asset_get_index(global.state_slot1_data.last_room));
}else if(global.room_check == "load_slot_2"){
	global.room_check = ""
	sc_visible_layer([
		"right_option_layer", 
		"pause_button_layer", 
	]);
													
	sc_invisible_layer(["load_slot2_main_dialog_layer"])
	global.is_main_state = false;
	
	instance_activate_object(obj_player)
	instance_activate_object(obj_joystick_base)
	instance_activate_object(obj_multitouch_manager)
	instance_activate_object(obj_Inventory)
	state_slot2_load_game()
	
	obj_player.x = global.state_slot2_data.player_x;
	obj_player.y = global.state_slot2_data.player_y;
	room_goto(asset_get_index(global.state_slot2_data.last_room));
} else if(global.room_check == "load_slot_3"){
	global.room_check = ""
		sc_visible_layer([
		"right_option_layer", 
		"pause_button_layer", 
	]);
														
	sc_invisible_layer(["load_slot3_main_dialog_layer"])
	global.is_main_state = false;
	
	instance_activate_object(obj_player)
	instance_activate_object(obj_joystick_base)
	instance_activate_object(obj_multitouch_manager)
	instance_activate_object(obj_Inventory)
	state_slot3_load_game()
	
	obj_player.x = global.state_slot3_data.player_x;
	obj_player.y = global.state_slot3_data.player_y;
	room_goto(asset_get_index(global.state_slot3_data.last_room));
}
