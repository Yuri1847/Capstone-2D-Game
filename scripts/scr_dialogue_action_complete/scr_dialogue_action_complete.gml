function scr_dialogue_action_complete(dialog_inst){
	var _dialog = dialog_inst;
	if !instance_exists(_dialog) exit;
	_dialog._action_running = false;
	
	
	if (instance_exists(obj_talk_button)) {
	    obj_talk_button.isEnabled = true;
	}
}

