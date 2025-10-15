// === Exit early if on main menu ===
if (room == rm_main_menu) exit;

// === GUI dimensions ===
var gui_w = display_get_gui_width();
var gui_h = display_get_gui_height();

// === Diary button (center-origin) ===
var bx = gui_w - margin_right - (button_w / 2);
var by = margin_top + (button_h / 2);

// === Panel dimensions (for later use) ===
var pw = gui_w * 0.9;
var ph = gui_h * 0.9;
var px = (gui_w - pw) / 2;
var py = (gui_h - ph) / 2;

// === Touch configuration ===
var max_fingers = 5;
var hit_expand = 16; // extra touch-friendly padding

for (var i = 0; i < max_fingers; i++) {
    if (device_mouse_check_button_pressed(i, mb_left)) {
        var tx = device_mouse_x_to_gui(i);
        var ty = device_mouse_y_to_gui(i);

        // =========================================================
        // 🟩 OPEN DIARY PANEL (Button Tap)
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
            // Panel layout values
            var header_h = 72;
            var footer_h = 72;

            // Close button
            var close_size = 48;
            var close_x = px + pw - close_size - 32;
            var close_y = py + (header_h - close_size) / 2;

            // Footer buttons
            var btn_w = 200;
            var btn_h = 48;
            var balik_x = px + 48;
            var balik_y = py + ph - footer_h + (footer_h - btn_h) / 2;
            var susunod_x = px + pw - btn_w - 48;
            var susunod_y = balik_y;

            // --- CLOSE ---
            if (point_in_rectangle(tx, ty, close_x, close_y, close_x + close_size, close_y + close_size)) {
                show_diary = false;
                break;
            }

            // --- BALIK ---
            if (point_in_rectangle(tx, ty, balik_x, balik_y, balik_x + btn_w, balik_y + btn_h)) {
                current_page = max(0, current_page - 1);
                break;
            }

            // --- SUSUNOD ---
            if (point_in_rectangle(tx, ty, susunod_x, susunod_y, susunod_x + btn_w, susunod_y + btn_h)) {
                current_page = min(max_page - 1, current_page + 1);
                break;
            }

            // --- TAP OUTSIDE PANEL CLOSES IT ---
            if (!point_in_rectangle(tx, ty, px, py, px + pw, py + ph)) {
                show_diary = false;
                break;
            }
        }
    }
}
