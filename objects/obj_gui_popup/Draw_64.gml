/// Draw GUI Event
var area = scr_get_camera_gui_area();
var gui_w = area.w;
var gui_h = area.h;

// Background dim
draw_set_color(c_black);
draw_set_alpha(0.6);
draw_rectangle(0, 0, gui_w, gui_h, false);
draw_set_alpha(1);

// Popup panel
var panel_w = gui_w * 0.6;
var panel_h = gui_h * 0.4;
var panel_x = (gui_w - panel_w) / 2;
var panel_y = (gui_h - panel_h) / 2;

draw_set_color(c_white);
draw_roundrect(panel_x, panel_y, panel_x + panel_w, panel_y + panel_h, false);

draw_set_color(c_black);
draw_text(panel_x + 20, panel_y + 20, title);
draw_text_ext(panel_x + 20, panel_y + 60, text, -1, panel_w - 40);

// Button
var btn_x = gui_w * 0.5 - btn_w * 0.5;
var btn_y = gui_h * 0.6;

draw_set_color(btn_hover ? c_yellow : c_silver);
draw_roundrect(btn_x, btn_y, btn_x + btn_w, btn_y + btn_h, false);
draw_set_color(c_black);
draw_text(btn_x + 20, btn_y + 12, button_text);
