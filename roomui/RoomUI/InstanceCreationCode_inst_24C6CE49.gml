function clickButton(){
	obj_Pause_manager.pause = true;
	obj_Pause_manager.update_pause();
	with(obj_state_slot_save){
		obj_state_slot_save.isEnabled = true;
	}
	sc_visible_layer(["state_slot_save_layer"])
	sc_invisible_layer(["pause_layer"])
}