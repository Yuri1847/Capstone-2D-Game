/// scr_dialogue_start_action(_action, _dialog)
function scr_dialogue_start_action(_action, _dialog)
{
    if (is_undefined(_action) || !instance_exists(_dialog)) {
        if (instance_exists(_dialog)) scr_dialogue_action_complete(_dialog);
        return;
    }

    _dialog._action_running = true;

    // disable talk button
    if (instance_exists(obj_talk_button)) {
        with (obj_talk_button) {
            isEnabled = false;
            visible = false;
        }
    }

    // ✅ Struct-based reflection action
    if (is_struct(_action)) {
        if (variable_struct_exists(_action, "type")) {
            switch (_action.type) {
                case "reflection":
                    scr_letter_system(_dialog, _action);
                    return;
            }
        }
    }

    // fallback
    scr_dialogue_action_complete(_dialog);
}
