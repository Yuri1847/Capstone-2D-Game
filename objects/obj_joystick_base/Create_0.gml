joy_x = 0;
joy_y = 0;
touch_id = -1;

radius = sprite_width / 2;

input = function (_touch_id)
{
	touch_id = _touch_id;
}

x = camera_get_view_x(view_camera[0]) + 300;
y = camera_get_view_y(view_camera[0]) + 500;