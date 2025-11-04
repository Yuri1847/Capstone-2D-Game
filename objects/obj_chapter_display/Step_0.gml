switch (state) {
    case 0: // Fade In
        alpha += fade_speed;
        if (alpha >= 1) {
            alpha = 1;
            state = 1;
        }
    break;

    case 1: // Wait for screen tap
        var max_fingers = 5; // GameMaker supports up to 5 touches

        for (var i = 0; i < max_fingers; i++) {
            if (device_mouse_check_button_pressed(i, mb_left)) {
                // Convert touch coordinates to GUI space
                var tx = device_mouse_x_to_gui(i);
                var ty = device_mouse_y_to_gui(i);

                // If they tap anywhere on the screen
                var area = scr_get_camera_gui_area();
                if (point_in_rectangle(tx, ty, area.x, area.y, area.x + area.w, area.y + area.h)) {
                    state = 2; // Start fade out
                }
            }
        }
    break;

    case 2: // Fade Out
        alpha -= fade_speed;
        if (alpha <= 0) instance_destroy();
    break;
}
