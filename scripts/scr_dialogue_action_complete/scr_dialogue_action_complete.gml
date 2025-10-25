function scr_dialogue_action_complete(dialog_inst){
	/// scr_dialogue_action_complete(dialog_inst)
	var _dialog = dialog_inst;
	if !instance_exists(_dialog) exit;

	// mark action finished
	_dialog._action_running = false;

	// re-enable pause manager and button (dialog will be resumed by obj_dialog logic)
	obj_Pause_manager.pause = false;
	obj_Pause_manager.update_pause();
	if (instance_exists(obj_talk_button)) {
	    obj_talk_button.isEnabled = true;
	    // visibility will be handled by parent code depending on can_talk
	}

}