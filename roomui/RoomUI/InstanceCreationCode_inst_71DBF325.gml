function clickButton(){
	// Inventory close Inventory Layer
	obj_Pause_manager.pause = false;
	obj_Pause_manager.update_pause();
		with(obj_Inventory){
		obj_Inventory.isEnabled = false;
	}
	sc_visible_layer(["Right_Option_Layer", "Pause_Button_Layer", "Control_Layer"]);
	sc_invisible_layer(["Inventory_Layer"]);
}