// Step Event of obj_button
var max_fingers = 5; // GameMaker supports up to 5 simultaneous touches

for (var i = 0; i < max_fingers; i++) {
    if (device_mouse_check_button_pressed(i, mb_left)) {
        
        // Convert touch coordinates to GUI layer
        var tx = device_mouse_x_to_gui(i);
        var ty = device_mouse_y_to_gui(i);
        
        // If touch is inside this button
        if (point_in_rectangle(tx, ty, x, y, x + sprite_width, y + sprite_height)) {
            clickButton();
        }
    }
}		