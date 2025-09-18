joyX = 0;
joyY = 0;
touchId = -1;
radius = sprite_width / 2;

input = function (touchId)
{
	self.touchId = touchId;
}

x = ((display_get_width() / 2) - ((display_get_width() / 2) / 2)-128);
y = (display_get_height() / 2 + 160);