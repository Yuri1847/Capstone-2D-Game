function clickButton(){
	obj_Pause_manager.pause = true;
	obj_Pause_manager.update_pause();
	sc_visible_layer(["quest_layer"]);
	sc_invisible_layer(["right_option_layer", "pause_button_layer"]);

}