var maxDevices = 4;

for (var i = 0; i < maxDevices; i++)
{
	var mouseX = device_mouse_x_to_gui(i);
	var mouseY = device_mouse_y_to_gui(i);
	
	var uiAtPos = instance_position(mouseX, mouseY, obj_joystick_base);
	var held = device_mouse_check_button(i, mb_left);
	
	if (uiAtPos != noone && held)
	{
		uiAtPos.input(i);
	}
}