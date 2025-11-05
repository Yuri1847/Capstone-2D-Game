if(!isEnabled) exit;

// obj_toggle_button - Step Event
var mx = device_mouse_x_to_gui(0);
var my = device_mouse_y_to_gui(0);

// Calculate hover for left and right button
click_left  = (mx > x_pos && mx < x_pos + btn_w && my > y_pos && my < y_pos + btn_h);
click_right = (mx > x_pos + btn_w && mx < x_pos + btn_w * 2 && my > y_pos && my < y_pos + btn_h);

// Handle clicks
if (mouse_check_button_pressed(mb_left)) {
    if (click_left){  
		toggle_state = 1;
		global.enabledJOY = true
		global.enabledDpad = false;
	} else if (click_right){
		toggle_state = 0;
		global.enabledJOY = false
		global.enabledDpad = true;
	}
}


