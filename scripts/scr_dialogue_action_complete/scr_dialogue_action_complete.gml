function scr_dialogue_action_complete(_dialog)
{
    if (!instance_exists(_dialog)) return;
    _dialog._action_running = false;

    if (instance_exists(obj_talk_button)) {
        with (obj_talk_button) {
            isEnabled = true;
            visible = true;
        }
    }
}
