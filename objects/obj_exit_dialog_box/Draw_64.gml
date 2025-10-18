if(!isEnabled) exit;
// Draw the shadow background
draw_set_alpha(0.5);
draw_sprite_stretched(
    spr_dialog_box_shadow,
    0,
    0,
    0,
    display_get_gui_width(),
    display_get_gui_height()
);
draw_set_alpha(1);

// obj_dialog_box - Draw GUI Event
if (dialog_active)
{
    // Draw dialog box (centered)
    draw_sprite(spr_exit_dialog_box, 0, dialog_x, dialog_y);
    
	draw_set_font(fn_ui_state_slot_descripton);
	draw_set_halign(fa_center);
    draw_set_valign(fa_middle);
    draw_set_color(c_white);
    // Draw buttons
    draw_sprite(spr_dialog_box_button, 0, btn_yes_x, btn_y);
    draw_sprite(spr_dialog_box_button, 0, btn_no_x, btn_y);
    
    // Draw button text
    draw_text(btn_yes_x, btn_y, "Yes");
    draw_text(btn_no_x, btn_y, "No");
}