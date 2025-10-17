if (!enabledJOY) exit;

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