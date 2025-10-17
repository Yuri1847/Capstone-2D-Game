if (visible) {
    var sw = display_get_gui_width();
    var sh = display_get_gui_height();
    var num_tabs = array_length(tab_titles);
    var tab_w = sw / num_tabs; // each tab same width

    var max_fingers = 5;

    for (var i = 0; i < max_fingers; i++) {
        if (device_mouse_check_button_pressed(i, mb_left)) {

            // Convert to GUI coordinates
            var mx = device_mouse_x_to_gui(i);
            var my = device_mouse_y_to_gui(i);

            // === TAB SELECTION ===
            for (var t = 0; t < num_tabs; t++) {
                var xq = t * tab_w;
                var yq = tab_y;

                if (point_in_rectangle(mx, my, xq, yq, xq + tab_w, yq + tab_h)) {
                    current_tab = tab_keys[t];
                }
            }

            // === BACK BUTTON ===
            var back_x = back_margin;
            var back_y = sh - back_h - back_margin;

            if (point_in_rectangle(mx, my, back_x, back_y, back_x + back_w, back_y + back_h)) {
                // Close the journal
                visible = false;
                with (obj_joystick_base) enabledJOY = true; // re-enable joystick
                sc_visible_layer(["right_option_layer", "pause_button_layer"]);
                global.journal_open = false;
            }
        }
    }
}
