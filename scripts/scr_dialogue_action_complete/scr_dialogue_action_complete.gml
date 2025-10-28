
function scr_dialogue_action_complete(_dialog)
{
    if (!instance_exists(_dialog)) {
        show_debug_message("⚠️ scr_dialogue_action_complete: dialog missing");
        return;
    }

    _dialog._action_running = false;

    // Re-enable talk button(s)
    if (instance_exists(obj_talk_button)) {
        with (obj_talk_button) {
            isEnabled = true;
            visible = true;
        }
    }
}
