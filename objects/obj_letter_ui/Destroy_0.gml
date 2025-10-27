// --------------------------------------------------
// obj_letter_ui — Destroy Event
// --------------------------------------------------
global.letter_open = false;
global.letter_current_dialog = noone;

if (instance_exists(obj_talk_button)) {
    with (obj_talk_button) {
        isEnabled = true;
        visible = true;
    }
}
