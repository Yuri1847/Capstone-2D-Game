/// obj_story_ui - Draw GUI
if (!variable_global_exists("story_quests")) exit;

var q = scr_story_get_current();
if (q == undefined) exit;

// Get current chapter data
var current_chap = global.story_chapters[global.current_story_index];
var chap_title = string(current_chap.chapter_title);

// === CAMERA GUI AREA ===
var area = scr_get_camera_gui();
var gui_x = area.x;
var gui_y = area.y;
var gui_w = area.w;
var gui_h = area.h;

// === Layout positions (adjusted to top-left corner) ===
var margin_left = gui_x + 16; // previously gui_w * 0.05
var margin_top  = gui_y + 16; // previously gui_h * 0.05
var line_gap    = gui_h * 0.045;

// === TEXT PREP ===
var text_chapter = "Kabanata: " + chap_title;
var text_gawain  = "Gawain:";
var text_title   = q.title;
var text_desc    = q.description;

// === Measure widest text ===
draw_set_font(fnt_sps_obj);
var w1 = string_width(text_chapter);
var w2 = string_width(text_gawain);
draw_set_font(fnt_sps_title);
var w3 = string_width(text_title);
draw_set_font(fnt_sps_desc);
var w4 = string_width(text_desc);

var text_w = max(w1, w2, w3, w4);
var text_h = line_gap * 4; // fits 4 lines (chapter + gawain + title + desc)

// === BACKGROUND PANEL ===
var pad_x = 20;
var pad_y = 15;

draw_set_alpha(0.5);
draw_set_color(c_black);
draw_rectangle(
    margin_left - pad_x,
    margin_top - pad_y,
    margin_left + text_w + pad_x,
    margin_top + text_h + pad_y,
    false
);

// === DRAW TEXT ===
draw_set_alpha(1);
draw_set_color(c_white);
draw_set_halign(fa_left);
draw_set_valign(fa_top);

// Chapter
draw_set_font(fnt_sps_obj);
draw_text(margin_left, margin_top, text_chapter);

// "Gawain:"
draw_set_font(fnt_sps_obj);
draw_text(margin_left, margin_top + line_gap, text_gawain);

// Objective title
draw_set_font(fnt_sps_title);
draw_text(margin_left, margin_top + line_gap * 2, text_title);

// Objective description
draw_set_font(fnt_sps_desc);
draw_text(margin_left, margin_top + line_gap * 3, text_desc);
