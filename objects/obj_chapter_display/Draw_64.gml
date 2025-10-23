var area = scr_get_camera_gui_area();
var xe = area.x;
var ye = area.y;
var w = area.w;
var h = area.h;

// Draw background sprite
draw_set_alpha(alpha);
draw_sprite_stretched(spr_chap_disp, 0, xe, ye, w, h);

// Draw text
draw_set_alpha(alpha);
draw_set_color(c_black);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);

// --- Title ---
draw_set_font(fnt_global_extraBoldDisplay);
var title_y = ye + h * 0.42;
draw_text(xe + w/2, title_y, global.current_chapter_title);

// --- Summary (fixed position + wrapping) ---
draw_set_font(fnt_global_extraBoldDisplay);

var summary_y = title_y + 50; // spacing under title
var wrap_width = w * 0.75; // wrap text within 75% of screen width

draw_text_ext(xe + w/2, summary_y, global.current_chapter_summary, 1, wrap_width);

// Reset
draw_set_alpha(1);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
