function clickButton(){
	obj_Pause_manager.pause = true;
	obj_Pause_manager.update_pause();
	sc_visible_layer(["Quest_Layer"]);
	sc_invisible_layer(["Right_Option_Layer", "Pause_Button_Layer", "Control_Layer"]);
}