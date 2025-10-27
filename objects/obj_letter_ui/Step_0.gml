if (keyboard_check_pressed(vk_space) || mouse_check_button_pressed(mb_left)) {
    instance_destroy();
    if (instance_exists(dialog_ref)) {
        scr_dialogue_action_complete(dialog_ref);
    }
}
