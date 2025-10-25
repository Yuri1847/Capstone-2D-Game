function scr_dialogue_start_action(action_struct, dialog_inst){
	/// scr_dialogue_start_action(action_struct, dialog_inst)
	var _action = action_struct;
	var _dialog = dialog_inst; // instance id of obj_dialog

	// Mark action as running
	_dialog._action_running = true;

	// disable talk button and prevent accidental input
	if (instance_exists(obj_talk_button)) {
	    obj_talk_button.isEnabled = false;
	    obj_talk_button.visible = false;
	}
	obj_Pause_manager.pause = true;
	obj_Pause_manager.update_pause();

	// Dispatch by type (you can add more types)
	switch (_action.type) {
	case "quiz":
	    // call the scripted entrypoint, pass the dialog instance so the quiz can call back
	    if (script_exists(_action.id)) {
	        script_execute(_action.id, _action.params, _dialog);
	    } else {
	        // fallback: mark completed immediately
	        scr_dialogue_action_complete(_dialog);
	    }
	    break;

	case "cutscene":
	    if (script_exists(_action.id)) {
	        script_execute(_action.id, _action.params, _dialog);
	    } else {
	        scr_dialogue_action_complete(_dialog);
	    }
	    break;

	case "script":
	    if (script_exists(_action.id)) {
	        script_execute(_action.id, _action.params, _dialog);
	    } else {
	        scr_dialogue_action_complete(_dialog);
	    }
	    break;

	default:
	    // unknown -> complete immediately
	    scr_dialogue_action_complete(_dialog);
	    break;
	}

}