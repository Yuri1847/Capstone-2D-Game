function clickButton(){
	
	state_slot1_load_game()
	global.file_handling_data.player_x = global.state_slot1_data.player_x;
	global.file_handling_data.player_y = global.state_slot1_data.player_y;
	global.file_handling_data.last_room = global.state_slot1_data.last_room;
	file_handling_save_game()
	sc_invisible_layer(["load_slot1_main_dialog_layer"])
	instance_deactivate_object(obj_dialog_box_shadow)
	sc_visible_layer(["load_game_menu_layer"])
	instance_activate_object(obj_state_slot_load_main)
	show_toast("Successful overide slot 1 to main state")
	
	
}