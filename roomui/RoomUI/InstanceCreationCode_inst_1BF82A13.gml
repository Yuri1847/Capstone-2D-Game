function clickButton(){
	obj_Pause_manager.pause = false;
	obj_Pause_manager.update_pause();
	sc_visible_layer(["Control_Layer", "Pause_Button_Layer", "Right_Option_Layer"])
	sc_invisible_layer(["Pause_Layer"]);
}