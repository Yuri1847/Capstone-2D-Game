function room_start_UI_Folder(){
		sc_invisible_layer([
		"exit_confirm_layer", 
		"inventory_layer", 
		"quest_layer", 
		"right_option_layer", 
		"settings_layer", 
		"pause_button_layer", 
		"pause_layer", 
		"state_slot1_dialog_layer",
		"state_slot2_dialog_layer",
		"state_slot3_dialog_layer",
		"settings_menu_layer"
	]);

	sc_visible_layer(["main_menu_layer"])
}

function room_end_UI_Folder(){
	sc_invisible_layer(["main_menu_layer"])
}