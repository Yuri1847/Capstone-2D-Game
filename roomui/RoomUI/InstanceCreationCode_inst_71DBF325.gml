function clickButton(){
	// Inventory close Inventory Layer
	obj_Pause_manager.pause = false;
	obj_Pause_manager.update_pause();
		with(obj_Inventory){
		obj_Inventory.isEnabled = false;
	}
	sc_visible_layer(["right_option_layer", "pause_button_layer"]);
	sc_invisible_layer(["inventory_layer"]);
}