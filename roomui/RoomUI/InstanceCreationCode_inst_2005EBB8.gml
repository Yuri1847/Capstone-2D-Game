function clickButton(){
	obj_Pause_manager.pause = true;
	obj_Pause_manager.update_pause();
	with(obj_Inventory){
		obj_Inventory.isEnabled = true;
	}
	sc_visible_layer(["inventory_layer"]);
	sc_invisible_layer(["right_option_layer", "pause_button_layer"]);
}