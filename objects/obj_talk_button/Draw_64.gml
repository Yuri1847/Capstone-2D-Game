/*
if(!isEnabled) exit;
draw_self();
draw_sprite(spr_talk_button, -1, x, y);
*/

if (!visible) exit;

var area = scr_get_camera_gui_area();
var margin_x = 32;
var margin_y = 32;

// Bottom-right inside camera area
var bx = area.x + area.w - margin_x - sprite_get_width(spr_talk_button);
var by = area.y + area.h - margin_y - sprite_get_height(spr_talk_button);

draw_sprite(spr_talk_button, 0, bx, by);

