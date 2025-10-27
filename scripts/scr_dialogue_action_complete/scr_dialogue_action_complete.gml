// --------------------------------------------------
// scr_dialogue_action_complete(dialog_inst)
// --------------------------------------------------
function scr_dialogue_action_complete(dialog_inst) {
    var _dialog = dialog_inst;
    if (!instance_exists(_dialog)) return;
    _dialog._action_running = false;

    // re-enable talk button if exists
    if (instance_exists(obj_talk_button)) {
        with (obj_talk_button) {
            isEnabled = true;
            visible = true;
        }
    }
}
