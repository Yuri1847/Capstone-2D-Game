if(!isEnabled) exit;
if (dialog_active)
{
	instance_deactivate_object(obj_ui_button)
    var mx = device_mouse_x_to_gui(0);
    var my = device_mouse_y_to_gui(0);

    // Detect tap release (for Android)
    if (mouse_check_button_released(mb_left))
    {
        // --- Get dialog box bounds (adjust padding as needed) ---
        var dialog_left   = x - sprite_get_width(spr_exit_dialog_box) / 2;
        var dialog_right  = x + sprite_get_width(spr_exit_dialog_box) / 2;
        var dialog_top    = y - sprite_get_height(spr_exit_dialog_box) / 2;
        var dialog_bottom = y + sprite_get_height(spr_exit_dialog_box) / 2;

        // --- YES button area ---
        if (point_in_rectangle(mx, my,
            btn_yes_x - btn_width/2, btn_y - btn_height/2,
            btn_yes_x + btn_width/2, btn_y + btn_height/2))
        {
            // Exit game or go to splash screen
            global.isExit = true;
            room_goto(rm_splash_screen);
        }

        // --- NO button area ---
        else if (point_in_rectangle(mx, my,
            btn_no_x - btn_width/2, btn_y - btn_height/2,
            btn_no_x + btn_width/2, btn_y + btn_height/2))
        {
			
			var room_name = room_get_name(room);
			switch (room_name) {
			    case "rm_main_menu": 
			        sc_visible_layer(["main_menu_layer"]);
				break;
				default:
			        sc_visible_layer(["pause_layer"]);
				break;
			}
			
            isEnabled = false;
            if (!isEnabled) exit; // close dialog
        }

        // --- Tap outside dialog area (block touch) ---
        else if (
            mx < dialog_left || mx > dialog_right ||
            my < dialog_top || my > dialog_bottom
        )
        {
            // Player tapped outside the box
            // Just absorb the click — do nothing
            // Prevent it from reaching gameplay buttons
            mouse_clear(mb_left);
			if (mouse_check_button_pressed(mb_left)) {
			    mouse_clear(mb_left);
			}
        }
    }
}