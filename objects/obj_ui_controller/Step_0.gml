if (room == rm_main_menu) exit;

var gui_w = display_get_gui_width();
var gui_h = display_get_gui_height();

// === Diary button (center-origin) ===
var bx = gui_w - margin_right - (button_w / 2);
var by = margin_top + (button_h / 2);

// === Panel dimensions ===
var pw = gui_w * 0.9;
var ph = gui_h * 0.9;
var px = (gui_w - pw) / 2;
var py = (gui_h - ph) / 2;

// === Touch setup ===
var max_fingers = 5;
var hit_expand = 16;

for (var i = 0; i < max_fingers; i++) {
    if (device_mouse_check_button_pressed(i, mb_left)) {
        var tx = device_mouse_x_to_gui(i);
        var ty = device_mouse_y_to_gui(i);

        // =========================================================
        // 🟩 OPEN DIARY PANEL
        // =========================================================
        if (!show_diary) {
            var bx1 = bx - (button_w / 2) - hit_expand;
            var by1 = by - (button_h / 2) - hit_expand;
            var bx2 = bx + (button_w / 2) + hit_expand;
            var by2 = by + (button_h / 2) + hit_expand;

            if (point_in_rectangle(tx, ty, bx1, by1, bx2, by2)) {
                show_diary = true;
                break;
            }
        }

        // =========================================================
        // 🟥 PANEL INTERACTIONS
        // =========================================================
        if (show_diary) {
            var header_h = 72;
            var tab_h = 56;
            var footer_h = 72;

            var close_size = 48;
            var close_x = px + pw - close_size - 32;
            var close_y = py + (header_h - close_size) / 2;

            var btn_w = 200;
            var btn_h = 48;
            var balik_x = px + 48;
            var balik_y = py + ph - footer_h + (footer_h - btn_h) / 2;
            var susunod_x = px + pw - btn_w - 48;
            var susunod_y = balik_y;

            // --- CLOSE BUTTON ---
            if (point_in_rectangle(tx, ty, close_x, close_y, close_x + close_size, close_y + close_size)) {
                show_diary = false;
                break;
            }

            // --- TAB CLICKS ---
            var tab_count = array_length(tab_names);
            var tab_spacing = pw / tab_count;
            var tab_y = py + header_h;
            var tab_bottom = tab_y + tab_h;

            if (ty >= tab_y && ty <= tab_bottom) {
                for (var t = 0; t < tab_count; t++) {
                    var tx1 = px + (t * tab_spacing);
                    var tx2 = tx1 + tab_spacing;
                    if (tx >= tx1 && tx <= tx2) {
                        current_tab = t;
                        break;
                    }
                }
            }


            // --- TAP OUTSIDE PANEL CLOSES ---
            if (!point_in_rectangle(tx, ty, px, py, px + pw, py + ph)) {
                show_diary = false;
                break;
            }
        }
    }
}
