var area = scr_get_camera_gui_area();
draw_text(area.x + 10, area.y + 10, "Inside visible area!");

draw_sprite(spr_journal_button,0,area.x,area.y);
