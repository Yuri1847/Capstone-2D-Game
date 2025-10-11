/// Toggle and handle scrolling
if (keyboard_check_pressed(ord("Q"))) {
    visible = !visible;
}

if (!visible) exit;

// Scroll with mouse wheel
scroll_offset += mouse_wheel_up() * 1;
scroll_offset -= mouse_wheel_down() * 1;
scroll_offset = clamp(scroll_offset, 0, 9999); // limit later dynamically

// Mouse click selection
if (mouse_check_button_pressed(mb_left)) {
    var mx = device_mouse_x_to_gui(0);
    var my = device_mouse_y_to_gui(0);
    
    // Check if inside quest list area
    if (mx > ui_x + 16 && mx < ui_x + 280 && my > ui_y + 48 && my < ui_y + ui_h - 48) {
        var idx = floor((my - (ui_y + 48) + scroll_offset * row_height) / row_height);
        
        var keys = ds_map_keys(global.quests);
        if (idx >= 0 && idx < ds_list_size(keys)) {
            selected_index = idx;
        }
        ds_list_destroy(keys);
    }
}
