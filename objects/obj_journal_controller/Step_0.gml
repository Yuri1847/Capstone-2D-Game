/// @description Handle input for journal UI
if (!visible) exit;

// --- Safe visible GUI area (matches draw) ---
var area = scr_get_camera_gui_area();
var sw = area.w;
var sh = area.h;

// --- Layout percentages ---
var top_h = sh * 0.10;
var mid_h = sh * 0.80;
var bot_h = sh * 0.10;

// --- Tabs ---
var num_tabs = array_length(tab_titles);
var tab_h = top_h * 0.8; // same as draw
var tab_y = area.y + (top_h - tab_h) / 2;
var tab_w = area.w / num_tabs;

// --- Back Button (bottom-left, same as draw) ---
var back_w = 200;
var back_h = bot_h * 0.8;
var back_x = area.x + 40;
var back_y = area.y + sh - back_h - ((bot_h - back_h) / 2);

// --- Input loop ---
var max_fingers = 5;
for (var i = 0; i < max_fingers; i++) {
    if (device_mouse_check_button_pressed(i, mb_left)) {
        var mx = device_mouse_x_to_gui(i);
        var my = device_mouse_y_to_gui(i);

        // === TAB SELECTION ===
        for (var t = 0; t < num_tabs; t++) {
            var tab_x = area.x + (t * tab_w);
            if (point_in_rectangle(mx, my, tab_x, tab_y, tab_x + tab_w, tab_y + tab_h)) {
                current_tab = tab_keys[t];
            }
        }

        // === BACK BUTTON ===
        if (point_in_rectangle(mx, my, back_x, back_y, back_x + back_w, back_y + back_h)) {
            visible = false;
            global.journal_open = false;

            with (obj_joystick_base) {
                global.enabledJOY = true;
            }

            sc_visible_layer(["right_option_layer", "pause_button_layer"]);
        }
    }
}
