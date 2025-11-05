function clickButton(){
	/*sc_visible_layer([
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
	room_goto(asset_get_index(global.file_handling_data.last_room));*/
	//room_goto(rm_loading_bar_next_room)
	//global.room_check = "main_menu"
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
}