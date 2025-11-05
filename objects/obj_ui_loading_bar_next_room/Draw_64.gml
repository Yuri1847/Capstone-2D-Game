draw_sprite(spr_ui_loading_frame, 0 ,load_x, load_y);
draw_sprite_stretched(spr_ui_loading_progress_next_room, 0,load_x,load_y, (progress/progress_max) * width_bar, 14);
draw_text(load_x+420, load_y,string(progress)+" %");
draw_set_color(c_white)
draw_set_font(fn_ui_loading_progress);