if(!isEnabled) exit;

var mx = device_mouse_x_to_gui(0);
var my = device_mouse_y_to_gui(0);

for (var i = 0; i < 3; i++) {
    var xx = ui_pos_x + ((state_slot_width + spaceBetweenItem) * i);
	
	draw_sprite(spr_ui_state_slot, global.settings_data.state_slot[i].background, xx, ui_pos_y);
	draw_set_font(fn_ui_state_slot_descripton)
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	draw_text(xx, ui_pos_y-150, state_slot_title[i]);
	draw_set_font(fn_ui_state_slot_descripton)
	draw_set_halign(fa_left);
	draw_set_valign(fa_middle);
	draw_text(xx-50, ui_pos_y-20, global.settings_data.state_slot[i].date);
	draw_text(xx-50, ui_pos_y+5, global.settings_data.state_slot[i].time);
    
}


