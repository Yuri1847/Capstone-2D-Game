/// scr_dialogue_start_action(_action, _dialog)
/// Safely executes dialogue-defined actions like "lettersystem:elias_guard"

function scr_dialogue_start_action(_action, _dialog)
{
    // === Sanity & type checks ===
    if (is_undefined(_action)) {
        show_debug_message("⚠️ scr_dialogue_start_action: _action is undefined");
        if (instance_exists(_dialog)) scr_dialogue_action_complete(_dialog);
        return;
    }

    if (!instance_exists(_dialog)) {
        show_debug_message("⚠️ scr_dialogue_start_action: _dialog instance missing");
        return;
    }

    // Ensure action is a string
    _action = string(_action);

    _dialog._action_running = true;

    // Disable talk button(s)
    if (instance_exists(obj_talk_button)) {
        with (obj_talk_button) {
            isEnabled = false;
            visible = false;
        }
    }

    // --- Split and sanitize ---
    var parts = string_split(_action, ":");
    if (array_length(parts) < 1) {
        show_debug_message("⚠️ Invalid action string: " + _action);
        scr_dialogue_action_complete(_dialog);
        return;
    }

    var main_action = string_lower(string_trim(parts[0]));
    var sub_id = (array_length(parts) >= 2) ? string_trim(parts[1]) : "";

    // --- Execute ---
    switch (main_action)
    {
        case "lettersystem":
            scr_letter_system(_dialog, sub_id);
            return;

        default:
            show_debug_message("⚠️ Unknown dialogue action: " + main_action);
            break;
    }

    // Always complete if nothing handled
    scr_dialogue_action_complete(_dialog);
}
