// obj_toggle_button - Create Event

toggle_state = 1; // 1 = left active, 0 = right active

// Position of the group of buttons (GUI space)
x_pos = (display_get_width() / 2 - 288/2);
y_pos = (display_get_height() / 2 ) + 20;

// Each button's size
btn_w = 144;
btn_h = 66;

// Hover check
click_left  = false;
click_right = false;

isEnabled = false;
