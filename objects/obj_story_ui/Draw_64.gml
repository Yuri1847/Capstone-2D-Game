/// obj_story_ui - Draw GUI (Objectives panel, one-line description, dynamic size)

// === Safety checks ===
if (!variable_global_exists("story_quests")) exit;
if (!variable_global_exists("current_story_index")) exit;

var q = scr_story_get_current();
if (q == undefined) exit;

// === GUI visible area ===
var area = scr_get_camera_gui_area();
var ax = area.x;
var ay = area.y;
var aw = area.w;
var ah = area.h;

// === Margins ===
var margin_left = ax + 32;
var margin_top  = ay + 32;

// === Text content ===
var text_label = "Objective:";
var text_obj   = string(q.title);
var text_desc  = string(q.description);

// === Fonts ===
var font_label = fnt_sps_obj;
var font_text  = fnt_sps_desc;

// === Padding & spacing ===
var pad_x = 32;
var pad_y = 24;
var spacing = 6;

// === Measure text widths ===
draw_set_font(font_label);
var w_label = string_width(text_label);
var w_obj   = string_width(text_obj);
draw_set_font(font_text);
var w_desc  = string_width(text_desc);

// === Measure text heights ===
draw_set_font(font_label);
var h_label = string_height(text_label);
var h_obj   = string_height(text_obj);
draw_set_font(font_text);
var h_desc  = string_height(text_desc);

// === Compute final inner dimensions ===
var text_w = max(w_label, w_obj, w_desc);
var text_h = h_label + spacing + h_obj + spacing + h_desc;

// === Panel size (dynamic) ===
var panel_w = text_w + (pad_x * 2);
var panel_h = text_h + (pad_y * 2);

// Keep inside visible area
if (margin_left + panel_w > ax + aw)
    margin_left = (ax + aw) - panel_w - 16;
if (margin_top + panel_h > ay + ah)
    margin_top = (ay + ah) - panel_h - 16;

// === Draw background panel ===
draw_set_alpha(0.5);
draw_set_color(c_white);
draw_sprite_stretched(
    spr_sps_panel, 0,
    margin_left,
    margin_top,
    panel_w,
    panel_h
);

// === Draw text ===
var text_x = margin_left + pad_x;
var text_y = margin_top + pad_y;

draw_set_alpha(1);
draw_set_color(c_white);
draw_set_halign(fa_left);
draw_set_valign(fa_top);

// Label
draw_set_font(font_label);
draw_text(text_x, text_y, text_label);
text_y += h_label + spacing;

// Objective
draw_text(text_x, text_y, text_obj);
text_y += h_obj + spacing;

// Description (one line only)
draw_set_font(font_text);
draw_text(text_x, text_y, text_desc);

// === Reset draw state ===
draw_set_alpha(1);
draw_set_color(c_white);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
