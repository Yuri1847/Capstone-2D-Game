// Hide in main menu
if ((room == rm_main_menu) || (room == rm_load_game_menu)) {
    visible = false;
    exit; // Skip all code below so it doesn’t react
} else {
    visible = true;
}

// Step Event
var sw = display_get_gui_width();
var mx = device_mouse_x_to_gui(0);
var my = device_mouse_y_to_gui(0);

// Calculate top-right position dynamically (so it works on all screen sizes)
button_x = sw - button_size - button_margin;
button_y = button_margin;

// Hover check
hovered = point_in_rectangle(mx, my, button_x, button_y, button_x + button_size, button_y + button_size);

// Toggle journal on click
if (hovered && mouse_check_button_pressed(mb_left)) {
    // Only open if not already open
    if (!global.journal_open) {
		with (obj_joystick_base) enabledJOY = false; // disables
		sc_invisible_layer(["right_option_layer", "pause_button_layer"]);
        global.journal_open = true;
		
        if (instance_exists(obj_journal_controller)) {
            with (obj_journal_controller) visible = true;
        }
		
    }
}

