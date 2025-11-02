// Draw GUI Event of obj_joystick_base

var scale = global.joystick_scale;

draw_sprite_ext(spr_joystick_base, 0, x, y, scale, scale, 0, c_white, 1);
draw_sprite_ext(spr_joystick_cursor, 0, x + joyX, y + joyY, scale, scale, 0, c_white, 1);
