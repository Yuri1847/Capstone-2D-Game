/// Draw GUI Event
var box_w = 300;
var box_h = 60;
var xx = display_get_width() / 2 - box_w / 2;
var yy = display_get_height() / 6;

// Background box (semi-transparent blue)
draw_set_alpha(alpha * 0.8);
draw_set_color(#606060);
draw_roundrect(xx, yy, xx + box_w, yy + box_h, false);

// Border
draw_set_alpha(alpha);
draw_set_color(#404040);
draw_roundrect(xx, yy, xx + box_w, yy + box_h, true);

// Icon box
var icon_x = xx + 10;
var icon_y = yy + 10;
draw_sprite_ext(item_sprite, 0, icon_x, icon_y-20, 1, 1, 0, c_white, alpha);

// Text
draw_set_font(fn_ui_state_slot_descripton);
draw_set_halign(fa_left);
draw_set_color(#FFFFFF);
draw_text(xx + 80, yy+22, "You receive: " + string(item_name));

// Reset alpha
draw_set_alpha(1);
