var area = scr_get_camera_gui_area();
var xe = area.x;
var ye = area.y;
var w = area.w;

// Background panel
draw_set_alpha(alpha * 0.6);
draw_set_color(make_color_rgb(0, 0, 0));
draw_rectangle(xe, ye, xe + w * 0.45, ye + 120, false);

// Text
draw_set_alpha(alpha);
draw_set_color(c_white);
draw_set_halign(fa_left);
draw_set_valign(fa_top);

// Title
draw_set_font(fnt_global_extraBoldDisplay);
draw_text(xe + 20, ye + 20, chapter_title);

// Summary (smaller font)
draw_set_font(fnt_global_extraBoldDisplay);
draw_text_ext(xe + 20, ye + 60, chapter_summary, 1, w * 0.4);

// Reset
draw_set_alpha(1);
draw_set_color(c_white);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
