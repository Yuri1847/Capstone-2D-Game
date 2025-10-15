function clickButton(){					
									
	sc_invisible_layer(["load_slot2_main_dialog_layer"])
	instance_deactivate_object(obj_dialog_box_shadow)
	sc_visible_layer(["load_game_menu_layer"])
	instance_activate_object(obj_state_slot_load_main)
	
}