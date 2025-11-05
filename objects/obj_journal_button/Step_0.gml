var area = scr_get_camera_gui_area();
/*
// Hide when quiz is active
if (global.quiz_active) {
    visible = false;
    exit;
} else {
    visible = true;
}
*/


// Hide in main menu
if ((room == rm_main_menu) || (room == rm_load_game_menu) ||(room == rm_loading_bar_next_room) || (room == rm_loading_bar_first_map)) {
    visible = false;
    exit; // Skip all code below so it doesn’t react
} else {
    visible = true;
}

// Touch/mouse handling
var max_fingers = 5;
hovered = false;

for (var i = 0; i < max_fingers; i++) {
    if (device_mouse_check_button(i, mb_left)) {
        var mx = device_mouse_x_to_gui(i);
        var my = device_mouse_y_to_gui(i);

        if (point_in_rectangle(mx, my, area.x + area.w - button_size - button_margin, area.y + button_margin, area.x + area.w - button_size - button_margin + button_size, area.y + button_margin + button_size)) {
            hovered = true;

            if (device_mouse_check_button_pressed(i, mb_left)) {
                // Toggle Journal
                if (!global.journal_open) {
                    with (obj_joystick_base) global.enabledJOY = false; // disable joystick
                    sc_invisible_layer(["right_option_layer", "pause_button_layer"]);
                    global.journal_open = true;

                    if (instance_exists(obj_journal_controller)) {
                        with (obj_journal_controller) visible = true;
                    }
                }
            }
        }
    }
}

