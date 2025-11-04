if (!global.tutorial_visible) exit;

var area = scr_get_camera_gui_area();

draw_set_font(fnt_global_extraBoldDisplay);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_color(c_white);

var msg = global.tutorial_message;
var margin_bottom = 150 * global.joystick_scale;
var draw_x = area.x + (area.w * 0.5);
var draw_y = area.y + area.h - margin_bottom;

draw_text(draw_x, draw_y, msg);
