/// obj_letter_ui - Step Event

var area = scr_get_camera_gui_area();

var max_fingers = 5;
for (var i = 0; i < max_fingers; i++) {
    if (device_mouse_check_button_pressed(i, mb_left)) {
        var mx = device_mouse_x_to_gui(i);
        var my = device_mouse_y_to_gui(i);

        if (mx > close_x && mx < close_x + close_w &&
            my > close_y && my < close_y + close_h)
        {
            // Resume dialogue
            if (instance_exists(dialog_ref)) {
                scr_dialogue_action_complete(dialog_ref);
            }

            

            instance_destroy();
            break;
        }
    }
}
