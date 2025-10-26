/// obj_letter_ui Destroy
global.letter_open = false;
global.letter_current_dialog = noone;

// re-enable talk button if exists
if (instance_exists(obj_talk_button)) {
    with (obj_talk_button) {
        isEnabled = true;
        visible = true;
    }
}
