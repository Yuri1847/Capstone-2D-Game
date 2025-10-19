/// obj_story_ui - Draw GUI
if (!variable_global_exists("story_quests")) exit;

var q = scr_story_get_current();

// Get GUI size
var gui_w = display_get_gui_width();
var gui_h = display_get_gui_height();

// Margins & spacing
var margin_left = gui_w * 0.2;
var margin_top  = gui_h * 0.05;
var line_gap    = gui_h * 0.04;

// === TEXT MEASURE ===
// Compose all text lines first
var text_gawain = "Gawain:";
var text_title  = q.title;
var text_desc   = q.description;

// Measure widths (we’ll use the widest one)
draw_set_font(fnt_sps_obj);
var w1 = string_width(text_gawain);
draw_set_font(fnt_sps_title);
var w2 = string_width(text_title);
draw_set_font(fnt_sps_desc);
var w3 = string_width(text_desc);

var text_w = max(w1, w2, w3);
var text_h = line_gap * 3; // roughly three lines of text (you can adjust if needed)

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

// Gawain
draw_set_font(fnt_sps_obj);
draw_text(margin_left, margin_top, text_gawain);

// Title
draw_set_font(fnt_sps_title);
draw_text(margin_left, margin_top + line_gap, text_title);

// Description
draw_set_font(fnt_sps_desc);
draw_text(margin_left, margin_top + line_gap * 2, text_desc);
