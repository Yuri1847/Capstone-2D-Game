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
    global.journal_open = !global.journal_open;

    if (instance_exists(journal_controller_id)) {
        with (journal_controller_id) visible = global.journal_open;
    }
}
