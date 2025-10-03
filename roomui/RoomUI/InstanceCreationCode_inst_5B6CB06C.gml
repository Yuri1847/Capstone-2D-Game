function clickButton(){
								
	sc_invisible_layer(["state_slot1_dialog_layer"])
	instance_deactivate_object(obj_dialog_box_shadow)
	sc_visible_layer(["load_game_menu_layer"])
	instance_activate_object(obj_state_slot_load)
	
}