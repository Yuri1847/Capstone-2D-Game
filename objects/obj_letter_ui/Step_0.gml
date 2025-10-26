/// obj_letter_ui — Step Event

// Get camera GUI area
var area = scr_get_camera_gui_area();
var ax = area.x;
var ay = area.y;
var aw = area.w;
var ah = area.h;

// These match the Draw GUI parchment area
var margin = 80;
var xs = ax + margin;
var ys = ay + margin;
var w = aw - margin * 2;
var h = ah - margin * 2;

// ============================================================
// 🖱️ TOUCH / MOUSE INPUT (absolute GUI coords)
// ============================================================
var max_fingers = 5;
for (var i = 0; i < max_fingers; i++) {
    if (device_mouse_check_button_pressed(i, mb_left)) {
        var tx = device_mouse_x_to_gui(i);
        var ty = device_mouse_y_to_gui(i);

        // === Check each choice box (use .xs, .ys from Draw GUI) ===
        for (var j = 0; j < array_length(choice_bbox); j++) {
            var b = choice_bbox[j];
            if (point_in_rectangle(tx, ty, b.xs, b.ys, b.xs + b.w, b.ys + b.h)) {
                selected_choice = j;
                break;
            }
        }

        // === Check Submit Button ===
        var button_w = 200;
        var button_h = 50;
        var button_x = xs + (w - button_w) / 2;
        var button_y = ys + h - button_h - 40;

        if (point_in_rectangle(tx, ty, button_x, button_y, button_x + button_w, button_y + button_h)) {
            if (selected_choice >= 0) {
                scr_letter_submit(self);
            }
            break;
        }
    }
}

// ============================================================
// ⌨️ KEYBOARD INPUT (numbers 1–9, Enter/Space)
// ============================================================
for (var k = 0; k < array_length(choices); k++) {
    var key = ord(string(k + 1));
    if (keyboard_check_pressed(key)) {
        selected_choice = k;
    }
}

if ((keyboard_check_pressed(vk_enter) || keyboard_check_pressed(vk_space)) && selected_choice >= 0) {
    scr_letter_submit(self);
}
