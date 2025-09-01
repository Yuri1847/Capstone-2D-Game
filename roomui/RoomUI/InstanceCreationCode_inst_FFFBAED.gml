function clickButton(){
	//back to main menu
	room_goto(rm_main_menu)
	with (all) {
    if (persistent) {
        instance_destroy();
    }
}
}