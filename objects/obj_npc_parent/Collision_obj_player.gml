obj_talk_button.isEnabled = true;
can_talk = true;
	
if (obj_talk_button.talk_button_pressed) {
    obj_talk_button.talk_button_pressed = false;
	obj_Pause_manager.pause = true;
	obj_Pause_manager.update_pause();
	sc_invisible_layer([
		"pause_button_layer",
		"right_option_layer",
	])
    create_dialogue(dialog);
}