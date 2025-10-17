/// @description Handle hover and click logic

var mx = device_mouse_x_to_gui(0);
var my = device_mouse_y_to_gui(0);

hovered = (mx > btn_x - btn_w/2 && mx < btn_x + btn_w/2 && my > btn_y - btn_h/2 && my < btn_y + btn_h/2);

if (hovered && mouse_check_button_pressed(mb_left)) {
    confirm_reset = true;
    fade_alpha = 0; // start confirm fade
}
