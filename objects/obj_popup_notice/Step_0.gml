// Fade in
if (alpha < 1) alpha = lerp(alpha, 1, 0.1);

// Horizontal expansion animation
if (width_scale < target_width_scale)
    width_scale = lerp(width_scale, target_width_scale, transition_speed);

// --- Touch / Click detection ---
var max_fingers = 5;

// Get camera GUI area
var area = scr_get_camera_gui_area();
var gui_x1 = area.x;
var gui_y1 = area.y;
var gui_x2 = area.x + area.w;
var gui_y2 = area.y + area.h;

// Check all touch points
for (var i = 0; i < max_fingers; i++) {
    if (device_mouse_check_button_pressed(i, mb_left)) {
        var tx = device_mouse_x_to_gui(i);
        var ty = device_mouse_y_to_gui(i);

        // Check if touch/click is inside GUI area
        if (point_in_rectangle(tx, ty, gui_x1, gui_y1, gui_x2, gui_y2)) {
            instance_destroy(); // close popup
            break; // exit loop once triggered
        }
    }
}
