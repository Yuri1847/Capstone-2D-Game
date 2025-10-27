/// obj_letter_ui - Draw GUI Event

var area = scr_get_camera_gui_area();

// === Background Panel ===
draw_set_color(c_black);
draw_set_alpha(0.75);
draw_rectangle(area.x, area.y, area.x + area.w, area.y + area.h, false);
draw_set_alpha(1);

// === Placeholder Content ===
draw_set_color(c_white);
draw_text(area.x + 64, area.y + 64, "📜 Letter / Reflection Content Here");

// === Close Button ===
var bx1 = close_x;
var by1 = close_y;
var bx2 = close_x + close_w;
var by2 = close_y + close_h;

draw_set_color(c_white);
draw_rectangle(bx1, by1, bx2, by2, false);
draw_text(bx1 + 40, by1 + 20, "Close");
