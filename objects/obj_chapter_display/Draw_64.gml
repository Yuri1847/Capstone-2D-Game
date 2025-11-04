var area = scr_get_camera_gui_area();
var xe = area.x;
var ye = area.y;
var w = area.w;
var h = area.h;

// Fullscreen background
draw_set_alpha(alpha);
draw_set_color(make_color_rgb(0, 0, 0));
draw_rectangle(xe, ye, xe + w, ye + h, false);

// Text
draw_set_color(c_white);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);

// Title
draw_set_font(fnt_global_extraBoldDisplay);
var title_y = ye + h * 0.4;
draw_text(xe + w / 2, title_y, chapter_title);

// Summary
draw_set_font(fnt_global_extraBoldDisplay);
draw_text_ext(xe + w / 2, title_y + 60, chapter_summary, 1, w * 0.6);

// Tap prompt
if (state == 1) {
    draw_set_font(fnt_global_extraBoldDisplay);
    draw_set_color(c_gray);
    draw_text(xe + w / 2, ye + h * 0.8, "[Tap anywhere to continue]");
}

// Reset draw state
draw_set_alpha(1);
draw_set_color(c_white);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
