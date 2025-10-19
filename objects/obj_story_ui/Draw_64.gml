/// obj_story_ui - Draw GUI
if (!variable_global_exists("story_quests")) exit;

var q = scr_story_get_current();

// Get GUI size
var gui_w = display_get_gui_width();
var gui_h = display_get_gui_height();

// Margins & spacing
var margin_left = gui_w * 0.2;   // 2% from left
var margin_top  = gui_h * 0.05;   // 3% from top
var line_gap    = gui_h * 0.04;   // vertical spacing between lines

// Draw setup
draw_set_font(fnt_sps_obj);
draw_set_color(c_black);
draw_set_alpha(1);

// Ensure left alignment
draw_set_halign(fa_left);
draw_set_valign(fa_top);

// Draw text (anchored top-left)
draw_text(margin_left, margin_top, "Gawain:");
draw_set_font(fnt_sps_title);
draw_text(margin_left, margin_top + line_gap, q.title);
draw_set_font(fnt_sps_desc);
draw_text(margin_left, margin_top + line_gap * 2, q.description);
