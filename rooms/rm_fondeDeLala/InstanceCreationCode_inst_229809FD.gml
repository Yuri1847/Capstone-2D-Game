function openTrivia(){
	obj_Pause_manager.pause = true;
	obj_Pause_manager.update_pause();
	
	sc_visible_layer(["trivia_layer","main_panel"]);
	sc_invisible_layer(["pause_button_layer","right_option_layer"]);
}