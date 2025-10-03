function clickButton(){
	// no button Alert Dialog 
	obj_Pause_manager.pause = false;
	obj_Pause_manager.update_pause();
	sc_invisible_layer(["exit_confirm_layer"]);
	sc_visible_layer(["pause_button_layer", "right_option_layer"])
}