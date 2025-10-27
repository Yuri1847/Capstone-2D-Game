// --------------------------------------------------
// obj_letter_ui — Step Event
// --------------------------------------------------
// Get camera GUI area (assume scr_get_camera_gui_area exists and returns struct {x,y,w,h})
var area = scr_get_camera_gui_area();
var ax = area.x, ay = area.y, aw = area.w, ah = area.h;

var margin = 80;
var xs = ax + margin;
var ys = ay + margin;
var w = aw - margin * 2;
var h = ah - margin * 2;

// Input: support device (touch) and mouse
var tx = -1, ty = -1;
var pressed = false;

// try multi-touch device first
for (var f = 0; f < 5; f++) {
    if (device_mouse_check_button_pressed(f, mb_left)) {
        tx = device_mouse_x_to_gui(f);
        ty = device_mouse_y_to_gui(f);
        pressed = true;
        break;
    }
}
// fallback to desktop mouse
if (!pressed && mouse_check_button_pressed(mb_left)) {
    tx = display_mouse_get_gui_x();
    ty = display_mouse_get_gui_y();
    pressed = true;
}

if (pressed) {
    // check choices
    for (var j = 0; j < array_length(choice_bbox); j++) {
        var b = choice_bbox[j];
        if (point_in_rectangle(tx, ty, b.xs, b.ys, b.xs + b.w, b.ys + b.h)) {
            selected_choice = j;
            break;
        }
    }

    // submit button rectangle
    var button_w = 200, button_h = 50;
    var button_x = xs + (w - button_w) / 2;
    var button_y = ys + h - button_h - 40;
    if (point_in_rectangle(tx, ty, button_x, button_y, button_x + button_w, button_y + button_h)) {
        if (selected_choice >= 0) scr_letter_submit(self);
    }
}

// keyboard shortcuts
for (var k = 0; k < array_length(choices); k++) {
    var key = ord(string(k + 1));
    if (keyboard_check_pressed(key)) selected_choice = k;
}
if ((keyboard_check_pressed(vk_enter) || keyboard_check_pressed(vk_space)) && selected_choice >= 0) {
    scr_letter_submit(self);
}
