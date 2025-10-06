function clickButton(){
	//back to main menu
	with (all) {
	    if (persistent && object_index != obj_player && object_index != obj_Inventory) {
	        instance_destroy();
	    }
	}
	room_goto(rm_main_menu)
}