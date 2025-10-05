if(!isEnabled) exit;
//Background Music
draw_set_font(fn_ui_loading_progress)
draw_set_color(c_white);
draw_text(slider_bm_x+60, slider_bm_y-30, "Background Music");
draw_sprite(spr_slider_bar, 0, slider_bm_x, slider_bm_y);
draw_sprite_stretched(spr_slider_progress, 0 ,slider_bm_x,slider_bm_y-3, slider_bm_value * slider_width, 3);
// icon position
var icon_bm_x = slider_bm_x + (slider_bm_value * slider_width);
var icon_bm_y = slider_bm_y + (slider_height/2) - sprite_get_height(spr_slider_icon)/2;

draw_sprite(spr_slider_icon, 0, icon_bm_x, icon_bm_y);

// draw percent text above or beside the slider
var percent_bm = round(slider_bm_value * 100);
draw_set_valign(fa_middle)
draw_text(slider_bm_x + slider_width+40, slider_bm_y, string(percent_bm) + "%");



//Sound Effect
draw_text(slider_sfx_x+40, slider_sfx_y-30, "Sound Effect");
draw_sprite(spr_slider_bar, 0, slider_sfx_x, slider_sfx_y);
draw_sprite_stretched(spr_slider_progress, 0 ,slider_sfx_x,slider_sfx_y-3, slider_sfx_value * slider_width, 3);
// icon position
var icon_sfx_x = slider_sfx_x + (slider_sfx_value * slider_width);
var icon_sfx_y = slider_sfx_y + (slider_height/2) - sprite_get_height(spr_slider_icon)/2;

draw_sprite(spr_slider_icon, 0, icon_sfx_x, icon_sfx_y);

// draw percent text above or beside the slider
var percent_sfx = round(slider_sfx_value * 100);
draw_set_valign(fa_middle)
draw_text(slider_sfx_x + slider_width+40, slider_sfx_y, string(percent_sfx) + "%");