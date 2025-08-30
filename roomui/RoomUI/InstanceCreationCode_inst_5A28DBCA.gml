function clickButton(){
	// Quest close Quest Layer
	obj_Pause_manager.pause = false;
	obj_Pause_manager.update_pause();
	sc_visible_layer(["Right_Option_Layer", "Pause_Button_Layer", "Control_Layer"]);
	sc_invisible_layer(["Quest_Layer"]);
}