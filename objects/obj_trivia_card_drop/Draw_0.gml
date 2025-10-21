// Draw Event
var height_offset = y - base_y;
var shadow_scale = 1 - (height_offset / 10);

draw_set_color(c_black);
draw_set_alpha(0.3);
draw_ellipse(x - 4 * shadow_scale, base_y + 18, x + 4 * shadow_scale, base_y + 10, false);
draw_set_alpha(1);
draw_set_color(c_white);

draw_self();