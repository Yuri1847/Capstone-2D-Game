function scr_dialogue_start_action(action_struct, dialog_inst) {
    var _action = action_struct;
    var _dialog = dialog_inst;

    _dialog._action_running = true;

    // Disable talk button
    if (instance_exists(obj_talk_button)) {
        obj_talk_button.isEnabled = false;
        obj_talk_button.visible = false;
    }

    // 1️⃣ If it’s a simple string action
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

    // 2️⃣ If it’s a struct-based action
    if (is_struct(_action)) {
        switch (_action.type) {
            case "letter":
                // ✅ Pass the id directly to your system
                scr_letter_system(_dialog, _action.id);
                break;

            default:
                scr_dialogue_action_complete(_dialog);
                break;
        }
    } else {
        scr_dialogue_action_complete(_dialog);
    }
}
