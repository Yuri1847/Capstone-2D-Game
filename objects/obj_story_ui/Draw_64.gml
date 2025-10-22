/// obj_story_ui - Draw GUI
if (!variable_global_exists("story_chapters")) exit;
if (!variable_global_exists("current_chapter")) exit;
if (!variable_global_exists("current_objective")) exit;

var q = scr_story_get_current();
if (q == undefined) exit;

// === Get GUI visible area ===
var area = scr_get_camera_gui_area();

// === Margins relative to GUI area ===
var margin_left = area.x + 32;
var margin_top  = area.y + 32;

// === Story data ===
var current_chap = global.story_chapters[global.current_chapter];
var chap_title   = current_chap.chapter_title;

var text_chapter = string(chap_title);
var text_gawain  = "Gawain:";
var text_title   = string(q.title);
var text_desc    = string(q.description);

// === Font + spacing ===
var line_gap = 32;

// Measure widest text
draw_set_font(fnt_global_reg);
var w1 = string_width(text_chapter);
var w2 = string_width(text_gawain);
var w3 = string_width(text_title);
var w4 = string_width(text_desc);
var text_w = max(w1, w2, w3, w4);
var text_h = line_gap * 4;

// === Panel settings ===
var panel_pad_x = 32;
var panel_pad_y = 24;
var panel_w = text_w + (panel_pad_x * 2);
var panel_h = text_h + (panel_pad_y * 2);

// Clamp panel to stay inside visible GUI area
if (margin_left + panel_w > area.x + area.w)
    margin_left = (area.x + area.w) - panel_w - 16;
if (margin_top + panel_h > area.y + area.h)
    margin_top = (area.y + area.h) - panel_h - 16;

// === Draw semi-transparent panel ===
draw_set_alpha(0.5);
draw_set_color(c_white);
draw_sprite_stretched(
    spr_sps_panel, 0,
    margin_left,
    margin_top,
    panel_w,
    panel_h
);

// === Draw text inside panel ===
draw_set_alpha(1);
draw_set_color(c_white);
draw_set_halign(fa_left);
draw_set_valign(fa_top);

var text_x = margin_left + panel_pad_x;
var text_y = margin_top + panel_pad_y;

// Chapter + label
draw_set_font(fnt_sps_title);
draw_text(text_x, text_y, text_chapter);
draw_text(text_x, text_y + line_gap, text_gawain);

// Title
draw_set_font(fnt_sps_obj);
draw_text(text_x, text_y + line_gap * 2, text_title);

// Description
draw_set_font(fnt_sps_desc);
draw_text(text_x, text_y + line_gap * 3, text_desc);
