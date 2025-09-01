function clickButton(){
	// Quest close Quest Layer
	obj_Pause_manager.pause = false;
	obj_Pause_manager.update_pause();
	sc_visible_layer(["right_option_layer", "pause_button_layer"]);
	sc_invisible_layer(["quest_layer"]);
}