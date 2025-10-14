	// obj_talk_button Step Event
/*global.talk_button_pressed = false;

var max_fingers = 5;
for (var i = 0; i < max_fingers; i++) {
    if (device_mouse_check_button_pressed(i, mb_left)) {
        var tx = device_mouse_x_to_gui(i);
        var ty = device_mouse_y_to_gui(i);

        if (point_in_rectangle(tx, ty, x, y, x + sprite_width, y + sprite_height)) {
            global.talk_button_pressed = true;
            break;
        }
    }
}*/

global.talk_button_pressed = false;
if (mouse_check_button_pressed(mb_left)) {
    var tx = device_mouse_x_to_gui(0);
    var ty = device_mouse_y_to_gui(0);

    if (point_in_rectangle(tx, ty, x, y, x + sprite_get_width(spr_talk_button), y + sprite_get_height(spr_talk_button))) {
		global.talk_button_pressed = true;
    }
}


depth =+y;