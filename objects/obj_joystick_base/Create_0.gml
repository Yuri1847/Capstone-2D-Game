global.enabledJOY = true;

joyX = 0;
joyY = 0;
touchId = -1;
radius = sprite_width / 2;

// Get GUI camera area
var area = scr_get_camera_gui_area();

// Position joystick bottom-left with 128 margin
var margin = 128;
x = area.x + margin + radius; // radius offset so it sits fully inside the margin
y = area.y + area.h - margin - radius;

// Input assigner
input = function (touchId)
{
	self.touchId = touchId;
};
