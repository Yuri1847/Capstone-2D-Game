draw_sprite_stretched(spr_ui_loading_progress, 0,x,y, (progress/progress_max) * width_bar, 14);
draw_text(x+420, y-1,string(progress)+" %");
draw_set_color(c_white)
draw_set_font(fn_ui_loading_progress);