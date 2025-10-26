function scr_dialogue_start_action(action_struct, dialog_inst) {
    var _action = action_struct;
    var _dialog = dialog_inst; 

    _dialog._action_running = true;

    if (instance_exists(obj_talk_button)) {
        obj_talk_button.isEnabled = false;
        obj_talk_button.visible = false;
    }
	
	
    if (is_string(_action)) {
        switch (_action) {
            case "letter_system":
                scr_letter_system(_dialog);
                break;


            default:
                scr_dialogue_action_complete(_dialog);
                break;
        }
        exit; 
    }
    if (is_struct(_action)) {
	    switch (_action.type) {
	        case "letter_system":
	            var _script_ref = undefined;

	            if (is_string(_action.id)) {
	                if (variable_global_exists(_action.id)) {
	                    _script_ref = variable_global_get(_action.id);
	                }
	            } else {
	                _script_ref = _action.id;
	            }

	            if (is_callable(_script_ref)) {
	                _script_ref(_dialog);
	            } else {
	                show_debug_message("⚠️ Invalid letter script: " + string(_action.id));
	                scr_dialogue_action_complete(_dialog);
	            }
	            break;

	        default:
	            scr_dialogue_action_complete(_dialog);
	            break;
	    }
	} else {
	    scr_dialogue_action_complete(_dialog);
	}

}
