if (!global.enabledDpad) exit;
/// Draw GUI Event — obj_cross_controller

// Top row
draw_sprite(spr_top_left_cb, 0, x0, y0);
draw_sprite(spr_top_center_cb, 0, x0 + (max_w + gap), y0);
draw_sprite(spr_top_right_cb, 0, x0 + (max_w + gap) * 2, y0);

// Middle row
draw_sprite(spr_middle_left_cb, 0, x0, y0 + (h_top + gap));
draw_sprite(spr_middle_right_cb, 0, x0 + (max_w + gap) * 2, y0 + (h_top + gap));

// Bottom row
draw_sprite(spr_bottom_left_cb, 0, x0, y0 + (h_top + gap) + (h_mid + gap));
draw_sprite(spr_bottom_center_cb, 0, x0 + (max_w + gap), y0 + (h_top + gap) + (h_mid + gap));
draw_sprite(spr_bottom_right_cb, 0, x0 + (max_w + gap) * 2, y0 + (h_top + gap) + (h_mid + gap));

// Optional debug rectangles
/*draw_set_color(c_lime);
if (moveUp)    draw_rectangle(x0 + (max_w + gap), y0, x0 + (max_w + gap) * 2, y0 + (h_top + gap), false);
if (moveDown)  draw_rectangle(x0 + (max_w + gap), y0 + (h_top + gap) + (h_mid + gap), x0 + (max_w + gap) * 2, y0 + (h_top + gap) + (h_mid + gap) + h_bot, false);
if (moveLeft)  draw_rectangle(x0, y0 + (h_top + gap), x0 + (max_w + gap), y0 + (h_top + gap) + (h_mid + gap), false);
if (moveRight) draw_rectangle(x0 + (max_w + gap) * 2, y0 + (h_top + gap), x0 + (max_w + gap) * 3, y0 + (h_top + gap) + (h_mid + gap), false);
draw_set_color(c_white);*/