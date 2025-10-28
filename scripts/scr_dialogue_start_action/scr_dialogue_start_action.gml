/// scr_dialogue_start_action(_action, _dialog)
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

    // --- Parse compound actions ---
    var parts = string_split(_action, ":");
    var main_action = parts[0];
    var sub_id = array_length(parts) > 1 ? parts[1] : "";

    switch (main_action)
    {
        case "lettersystem":
            scr_letter_system(_dialog, sub_id);
            return;
    }

    scr_dialogue_action_complete(_dialog);
}
