// obj_talk_button – Step Event

var tapped = false;
var max_fingers = 5;

// detect any touch or mouse click
for (var i = 0; i < max_fingers; i++) {
    if (device_mouse_check_button_pressed(i, mb_left)) {
        var tx = device_mouse_x_to_gui(i);
        var ty = device_mouse_y_to_gui(i);

        if (point_in_rectangle(tx, ty, button_x, button_y, button_x + button_w, button_y + button_h)) {
            tapped = true;
            break;
        }
    }
}

// if tapped, spawn dialogue
if (tapped) {
    if (!instance_exists(obj_dialogue)) {
        instance_create_layer(0, 0, "GUI", obj_dialogue);
    }
}
