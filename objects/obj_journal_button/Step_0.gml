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
if ((room == rm_main_menu) || (room == rm_load_game_menu)) {
    visible = false;
    exit; // Skip all code below so it doesn’t react
} else {
    visible = true;
}

// Step Event
var sw = display_get_gui_width();
var sh = display_get_gui_height();
button_x = sw - button_size - button_margin;
button_y = button_margin;

// Touch/mouse handling
var max_fingers = 5;
hovered = false; // default

for (var i = 0; i < max_fingers; i++) {
    if (device_mouse_check_button(i, mb_left)) {
        var mx = device_mouse_x_to_gui(i);
        var my = device_mouse_y_to_gui(i);

        // Hover check
        hovered = point_in_rectangle(mx, my, button_x, button_y, button_x + button_size, button_y + button_size);

        // Toggle journal on touch/click
        if (hovered && device_mouse_check_button_pressed(i, mb_left)) {
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
