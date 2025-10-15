// ---------------------------------------------------------
// Fade In
// ---------------------------------------------------------
if (!is_closing && fade < 1) {
    fade = min(1, fade + fade_speed);
}

// ---------------------------------------------------------
// Fade Out when closing
// ---------------------------------------------------------
if (is_closing) {
    fade -= fade_speed;
    if (fade <= 0) instance_destroy();
}

// ---------------------------------------------------------
// Button Setup
// ---------------------------------------------------------
var gui_w = display_get_gui_width();
var gui_h = display_get_gui_height();

var target_w = gui_w * 0.8;
var target_h = gui_h * 0.8;

var xp = (gui_w - target_w) * 0.5;
var yp = (gui_h - target_h) * 0.5;

// Button bottom-right
var bx = xp + target_w - button_w - 20;
var by = yp + target_h - button_h - 20;

// ---------------------------------------------------------
// Input Handling (Mouse + Touch)
// ---------------------------------------------------------
var pressed = false;

// --- Mouse input (PC) ---
if (mouse_check_button_pressed(mb_left)) {
    var mx = device_mouse_x_to_gui(0);
    var my = device_mouse_y_to_gui(0);
    if (point_in_rectangle(mx, my, bx, by, bx + button_w, by + button_h)) {
        pressed = true;
    }
}

// --- Touch input (Mobile) ---
var max_fingers = 5;
for (var i = 0; i < max_fingers; i++) {
    if (device_mouse_check_button_pressed(i, mb_left)) {
        var tx = device_mouse_x_to_gui(i);
        var ty = device_mouse_y_to_gui(i);
        if (point_in_rectangle(tx, ty, bx, by, bx + button_w, by + button_h)) {
            pressed = true;
        }
    }
}

// ---------------------------------------------------------
// Trigger close if pressed
// ---------------------------------------------------------
if (pressed) {
    is_closing = true;
}
