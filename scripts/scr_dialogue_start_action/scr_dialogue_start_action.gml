/// scr_dialogue_start_action(_action, _dialog)
function scr_dialogue_start_action(_action, _dialog)
{
    // --- Safety ---
    if (is_undefined(_action) || !instance_exists(_dialog)) {
        if (instance_exists(_dialog)) scr_dialogue_action_complete(_dialog);
        return;
    }

    _dialog._action_running = true;

    // Disable talk button while action runs
    if (instance_exists(obj_talk_button)) {
        with (obj_talk_button) {
            isEnabled = false;
            visible = false;
        }
    }

    // --- Match string actions ---
    switch (_action)
    {
        case "lettersystem":
            scr_letter_system(_dialog);
            return;
    }

    // --- Default fallback ---
    scr_dialogue_action_complete(_dialog);
}
