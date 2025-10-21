
/// @description Handle input for journal UI
if (!visible) exit;

var sw = display_get_gui_width();
var sh = display_get_gui_height();
var num_tabs = array_length(tab_titles);

var top_space_h = sh * 0.10;
var total_tab_width = (sw * 0.5) * 0.92;
var margin_x = sw * 0.5 + (sw * 0.5 - total_tab_width) / 2;
var tab_w = total_tab_width / num_tabs;
var tab_y = (top_space_h - tab_h) / 2;

// --- Input loop ---
var max_fingers = 5;

for (var i = 0; i < max_fingers; i++) {
    if (device_mouse_check_button_pressed(i, mb_left)) {
        var mx = device_mouse_x_to_gui(i);
        var my = device_mouse_y_to_gui(i);

        // === TAB SELECTION ===
        for (var t = 0; t < num_tabs; t++) {
            var xq = margin_x + (t * tab_w);
            if (point_in_rectangle(mx, my, xq, tab_y, xq + tab_w, tab_y + tab_h)) {
                current_tab = tab_keys[t];
            }
        }

        // === BACK BUTTON ===
        var back_x = back_margin;
        var back_y = sh - back_h - back_margin;

        if (point_in_rectangle(mx, my, back_x, back_y, back_x + back_w, back_y + back_h)) {
            visible = false;
            global.journal_open = false;

            with (obj_joystick_base)
                global.enabledJOY = true;

            sc_visible_layer(["right_option_layer", "pause_button_layer"]);
        }
    }
}
