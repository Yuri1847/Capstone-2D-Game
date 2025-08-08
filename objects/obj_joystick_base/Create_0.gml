joyX = 0;
joyY = 0;
touchId = -1;
radius = sprite_width / 2;

input = function (touchId)
{
	self.touchId = touchId;
}

x = camera_get_view_x(view_camera[0]) + 300;
y = camera_get_view_y(view_camera[0]) + 500;