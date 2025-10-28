var area = scr_get_camera_gui_area();

draw_set_color(c_black);
draw_set_alpha(0.75);
draw_rectangle(area.x, area.y, area.x + area.w, area.y + area.h, false);
draw_set_alpha(1);

draw_set_color(c_white);
draw_text(area.x + 64, area.y + 64, "Letter from: " + string(npc_id));

draw_rectangle(close_x, close_y, close_x + close_w, close_y + close_h, false);
draw_text(close_x + 40, close_y + 20, "Close");
