/// @description Draw logout button
draw_set_font(fnt_profile);
draw_set_color(c_black);

// Button background
draw_roundrect(btn_x, btn_y, btn_x + btn_w, btn_y + btn_h, false);

// Button text
draw_text(btn_x + 40, btn_y + 20, btn_text);
