draw_set_alpha(alpha);
draw_set_font(fnt_rn);
draw_set_color(c_white);
draw_set_halign(fa_center);
draw_set_valign(fa_top);

var gui_w = display_get_gui_width();
draw_text(gui_w / 2, 64, title_text);

draw_set_alpha(1);
