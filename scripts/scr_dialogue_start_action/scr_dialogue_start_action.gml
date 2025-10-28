function scr_dialogue_start_action(_action, _dialog)
{
    if (is_undefined(_action) || !instance_exists(_dialog)) {
        if (instance_exists(_dialog)) scr_dialogue_action_complete(_dialog);
        return;
    }

    _dialog._action_running = true;

    if (instance_exists(obj_talk_button)) {
        with (obj_talk_button) {
            isEnabled = false;
            visible = false;
        }
    }

    // --- Parse compound actions safely ---
    var parts = string_split(string(_action), ":"); // ensure string
    if (array_length(parts) < 1) {
        show_debug_message("⚠️ Dialogue action invalid: " + string(_action));
        scr_dialogue_action_complete(_dialog);
        return;
    }

    var main_action = parts[0];
    var sub_id = "";
    if (array_length(parts) >= 2) {
        sub_id = parts[1];
    }

    switch (main_action)
    {
        case "lettersystem":
            scr_letter_system(_dialog, string(sub_id)); 
            return;
    }

    scr_dialogue_action_complete(_dialog);
}
