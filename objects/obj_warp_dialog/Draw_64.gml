//if(!isEnabled) exit;
var spr_height = sprite_get_height(spr_dialog_box_button);
var spr_width = sprite_get_width(spr_dialog_box_button);

// obj_dialog_box - Draw GUI Event
if (dialog_active)
{
    // Draw dialog box (centered)
    draw_sprite(spr_warp_dialog_board, 0, dialog_x, dialog_y);
	draw_text(dialog_x+350, dialog_y+80, "Key ")
    
	draw_set_font(fn_ui_state_slot_descripton);
	draw_set_halign(fa_center);
    draw_set_valign(fa_middle);
    draw_set_color(c_white);
    // Draw buttons
    draw_sprite_stretched(spr_dialog_box_button, 0, (btn_yes_x-btn_width)-15, (btn_y-btn_height), 80, spr_height);
    draw_sprite_stretched(spr_dialog_box_button, 0, (btn_no_x-btn_width)-15, (btn_y-btn_height), 80, spr_height);
	
    // Draw button text
    draw_text(btn_yes_x, btn_y, "Unlock");
    draw_text(btn_no_x, btn_y, "Cancel");
}