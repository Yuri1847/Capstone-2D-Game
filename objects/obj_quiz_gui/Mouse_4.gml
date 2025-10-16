if (!visible) exit;

var cx = display_get_gui_width() / 2;
var cy = display_get_gui_height() / 2;
var start_y = cy - panel_h/2 + 150;
var opt_w = panel_w * 0.8;
var opt_x = cx - opt_w/2;

// detect click
for (var i = 0; i < array_length(options); i++) {
    var opt_y = start_y + i * (btn_height + btn_spacing);
    if (point_in_rectangle(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), opt_x, opt_y, opt_x + opt_w, opt_y + btn_height)) {
        selected = i;
        if (i == correct_index) show_debug_message("✅ Correct!");
        else show_debug_message("❌ Wrong!");
        alarm[0] = room_speed; // hide after 1s
    }
}

// TEMP: End quiz when pressing Space
if (keyboard_check_pressed(vk_space)) {
    with (obj_quiz_controller) {
        quiz_done = true;
    }
    instance_destroy(); // remove quiz GUI
}
