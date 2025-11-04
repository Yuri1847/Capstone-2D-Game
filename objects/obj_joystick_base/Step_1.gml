if (!global.enabledJOY) exit;

if (touchId != -1){
	if (device_mouse_check_button(touchId, mb_left))
	{
		joyX = device_mouse_x_to_gui(touchId) - x;
		joyY = device_mouse_y_to_gui(touchId) - y;
	
		var _direction = point_direction(0, 0, joyX, joyY);
		var _distance = point_distance(0, 0, joyX, joyY);
	
		if (_distance > radius)
		{
			joyX = lengthdir_x(radius, _direction);
			joyY = lengthdir_y(radius, _direction);
		}
	}
	else
	{
		touchId = -1;
		joyX = 0;
		joyY = 0;
	}
}

// Tutorial highlight pulse
if (global.highlight_joystick) {
    highlight_alpha += 0.03 * highlight_dir;
    if (highlight_alpha >= 0.6) highlight_dir = -1;
    if (highlight_alpha <= 0.1) highlight_dir = 1;
} else {
    highlight_alpha = max(0, highlight_alpha - 0.05);
}
