// Fade in
if (!is_closing && fade < 1) {
    fade = min(1, fade + fade_speed);
}

// Fade out when closing
if (is_closing) {
    fade -= fade_speed;
    if (fade <= 0) instance_destroy();
}

// Handle button click
var gui_w = display_get_gui_width();
var gui_h = display_get_gui_height();
var target_w = gui_w * 0.8;
var target_h = gui_h * 0.8;
var xp = (gui_w - target_w) * 0.5;
var yp = (gui_h - target_h) * 0.5;

// button bottom-right pos
var bx = xp + target_w - button_w - 20;
var by = yp + target_h - button_h - 20;

// mouse check (GUI layer)
if (mouse_check_button_pressed(mb_left)) {
    var mx = device_mouse_x_to_gui(0);
    var my = device_mouse_y_to_gui(0);
    if (mx > bx && mx < bx + button_w && my > by && my < by + button_h) {
        is_closing = true;
    }
}
