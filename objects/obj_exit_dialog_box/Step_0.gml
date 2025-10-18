if(!isEnabled) exit;
// obj_dialog_box - Step Event
if (dialog_active)
{
	
    var mx = device_mouse_x_to_gui(0);
    var my = device_mouse_y_to_gui(0);

    // Detect tap release (better for Android)
    if (mouse_check_button_released(mb_left))
    {
        // YES button area
        if (point_in_rectangle(mx, my,
            btn_yes_x - btn_width/2, btn_y - btn_height/2,
            btn_yes_x + btn_width/2, btn_y + btn_height/2))
        {
            // Exit the game completely
			global.isExit = true;
			room_goto(rm_splash_screen); // reset game state visually
			//show_debug_message("yes")
        }

        // NO button area
        else if (point_in_rectangle(mx, my,
            btn_no_x - btn_width/2, btn_y - btn_height/2,
            btn_no_x + btn_width/2, btn_y + btn_height/2))
        {
			sc_visible_layer(["pause_layer"])
			isEnabled = false;
            if(!isEnabled) exit;
			//show_debug_message("no")
        }
    }
}