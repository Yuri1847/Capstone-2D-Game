// obj_dialog_box - Create Event
visible = true;
dialog_active = true;

// Button positions
btn_width  = sprite_get_width(spr_dialog_box_button);
btn_height = sprite_get_height(spr_dialog_box_button);

// Dialog position (centered)
dialog_x = (display_get_width() / 2 - 700/2);
dialog_y = (display_get_height() / 2 - 200/2);

// Button positions
btn_yes_x = dialog_x + 300;
btn_no_x  = dialog_x + 400;
btn_y     = dialog_y + 150;

isEnabled = false;