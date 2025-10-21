// Step Event (obj_loot_item)
if (!variable_instance_exists(id, "base_y")) base_y = y;

// Floating effect
y = base_y + sin(current_time / 400) * 2;

// Gray blinking + alpha pulse
var blink = abs(sin(current_time / 250));
image_blend = merge_color(c_white, #7D7D7D, blink);
image_alpha = 0.6 + 0.4 * abs(sin(current_time / 300));

depth  = -10000;