if(!isEnabled) exit;
//Background Music
draw_set_font(fn_ui_loading_progress)
draw_set_color(c_white);
draw_text(slider_bm_x+60, slider_bm_y-30, "Background Music");
draw_sprite(spr_slider_bar, 0, slider_bm_x, slider_bm_y);
draw_sprite_stretched(spr_slider_progress, 0 ,slider_bm_x,slider_bm_y-5, slider_bm_value * slider_width, 8);
// icon position
var icon_bm_x = slider_bm_x + (slider_bm_value * slider_width);
var icon_bm_y = slider_bm_y + (slider_height/2) - sprite_get_height(spr_slider_icon)/2;

draw_sprite(spr_slider_icon, 0, icon_bm_x, icon_bm_y-1);

// draw percent text above or beside the slider
var percent_bm = round(slider_bm_value * 100);
draw_set_valign(fa_middle)
draw_text(slider_bm_x + slider_width+40, slider_bm_y, string(percent_bm) + "%");



//Sound Effect
draw_text(slider_sfx_x+40, slider_sfx_y-30, "Sound Effect");
draw_sprite(spr_slider_bar, 0, slider_sfx_x, slider_sfx_y);
draw_sprite_stretched(spr_slider_progress, 0 ,slider_sfx_x,slider_sfx_y-5, slider_sfx_value * slider_width, 8);
// icon position
var icon_sfx_x = slider_sfx_x + (slider_sfx_value * slider_width);
var icon_sfx_y = slider_sfx_y + (slider_height/2) - sprite_get_height(spr_slider_icon)/2;

draw_sprite(spr_slider_icon, 0, icon_sfx_x, icon_sfx_y-1);

// draw percent text above or beside the slider
var percent_sfx = round(slider_sfx_value * 100);
draw_set_valign(fa_middle)
draw_text(slider_sfx_x + slider_width+40, slider_sfx_y, string(percent_sfx) + "%");




// obj_toggle_button - Draw GUI Event
draw_set_font(fn_ui_loading_progress)
draw_set_color(c_white);
draw_text(x_pos+75, y_pos-30, "Movement Controller");

// Left button
var left_subimg  = (toggle_state == 1) ? 1 : 0;
draw_sprite(spr_toggle_left_button, left_subimg, x_pos, y_pos);

// Right button
var right_subimg = (toggle_state == 0) ? 1 : 0;
draw_sprite(spr_toggle_right_button, right_subimg, x_pos + btn_w, y_pos);