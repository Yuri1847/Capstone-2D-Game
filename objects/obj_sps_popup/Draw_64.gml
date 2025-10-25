/// obj_ui_popup - Draw GUI
if (!visible) return;

// get camera GUI area (returns x,y,w,h in GUI coords)
var area = scr_get_camera_gui_area();
var ax = area.x;
var ay = area.y;
var aw = area.w;
var ah = area.h;

// prepare text
draw_set_font(fnt_global_extraBoldDisplay);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);

// measure text (one line)
var txt = string(text);
var txt_w = string_width(txt);
var txt_h = string_height(txt);

// compute panel size (based on text size + padding)
var panel_w = txt_w + (pad_x * 2);
var panel_h = txt_h + (pad_y * 2);

// clamp panel to at most area dimensions (optional)
if (panel_w > aw - 32) panel_w = aw - 32;
if (panel_h > ah - 32) panel_h = ah - 32;

// center the panel in the camera GUI area
var panel_x = ax + (aw - panel_w) / 2;
var panel_y = ay + (ah - panel_h) / 2;

// draw panel (use current alpha)
draw_set_alpha(alpha * 0.95); // slightly translucent
draw_sprite_stretched(spr_sps_panel, 0, panel_x, panel_y, panel_w, panel_h);

// draw text
draw_set_alpha(alpha);
draw_set_color(c_white);
draw_text(panel_x + (panel_w / 2), panel_y + (panel_h / 2), txt);

// reset draw state
draw_set_alpha(1);
draw_set_color(c_white);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
