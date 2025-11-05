if(!isEnabled) exit;
// obj_toggle_button - Draw GUI Event
draw_set_font(fn_ui_loading_progress)
draw_set_color(c_white);
draw_text(x_pos+60, y_pos-30, "Movement Controller");

// Left button
var left_subimg  = (toggle_state == 1) ? 1 : 0;
draw_sprite(spr_toggle_left_button, left_subimg, x_pos, y_pos);

// Right button
var right_subimg = (toggle_state == 0) ? 1 : 0;
draw_sprite(spr_toggle_right_button, right_subimg, x_pos + btn_w, y_pos);
