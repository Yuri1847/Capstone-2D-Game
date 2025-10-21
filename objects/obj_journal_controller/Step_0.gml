/// @description Handle input for journal UI
if (!visible) exit;

// Match the draw layout (from scr_get_camera_gui_area)
var area = scr_get_camera_gui_area();

var sw = area.w;
var sh = area.h;
var num_tabs = array_length(tab_titles);

// --- Layout (EXACTLY same as draw) ---
var top_space_h = sh * 0.10;
var tab_h = 64;
var tab_y = area.y + (top_space_h - tab_h) / 2;
var tab_w = area.w / num_tabs;

// --- Back Button (same as draw) ---
var back_margin = 32;
var back_w = 160;
var back_h = 48;
var back_x = area.x + back_margin;
var back_y = area.y + sh - back_h - back_margin;

// --- Input loop ---
var max_fingers = 5;

for (var i = 0; i < max_fingers; i++) {
    if (device_mouse_check_button_pressed(i, mb_left)) {
        var mx = device_mouse_x_to_gui(i);
        var my = device_mouse_y_to_gui(i);

        // === TAB SELECTION ===
        for (var t = 0; t < num_tabs; t++) {
            var xq = area.x + (t * tab_w);
            if (point_in_rectangle(mx, my, xq, tab_y, xq + tab_w, tab_y + tab_h)) {
                current_tab = tab_keys[t];
            }
        }

        // === BACK BUTTON ===
        if (point_in_rectangle(mx, my, back_x, back_y, back_x + back_w, back_y + back_h)) {
            visible = false;
            global.journal_open = false;

            with (obj_joystick_base)
                global.enabledJOY = true;

            sc_visible_layer(["right_option_layer", "pause_button_layer"]);
        }
    }
}
