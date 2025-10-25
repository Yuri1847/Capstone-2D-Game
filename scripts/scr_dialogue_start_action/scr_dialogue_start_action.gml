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
            case "gui_popup":
                scr_gui_popup_item_found(_dialog);
                break;

            case "quiz_intro":
                scr_quiz_intro(_dialog);
                break;

            case "cutscene_intro":
                scr_cutscene_intro(_dialog);
                break;

            default:
                scr_dialogue_action_complete(_dialog);
                break;
        }
        exit; 
    }
    if (is_struct(_action)) {
        switch (_action.type) {
        case "quiz":
            if (script_exists(_action.id)) {
                script_execute(_action.id, _action.params, _dialog);
            } else {
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

        case "gui_popup":
            scr_gui_popup_item_found(_dialog);
            break;

        default:
            scr_dialogue_action_complete(_dialog);
            break;
        }
    } else {
        // safety fallback
        scr_dialogue_action_complete(_dialog);
    }
}
