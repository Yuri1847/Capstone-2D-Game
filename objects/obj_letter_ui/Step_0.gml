/// Step Event

var area = scr_get_camera_gui_area();

var max_fingers = 5;
for (var i = 0; i < max_fingers; i++)
{
    if (device_mouse_check_button_pressed(i, mb_left))
    {
        var mx = device_mouse_x_to_gui(i);
        var my = device_mouse_y_to_gui(i);

        // === Choice button regions (same layout as Draw GUI) ===
        var choice_x1 = area.x + area.w * 0.1;
        var choice_x2 = area.x + area.w * 0.9;
        var y_mid1_end = area.y + area.h * 0.40; // top 20% + next 20%
        var h_mid2 = area.h * 0.40;
        var choice_y = y_mid1_end + h_mid2 * 0.15;
        var choice_h = 56;
        var spacing = 16;

        for (var c = 0; c < 3; c++)
        {
            var y_rect1 = choice_y + c * (choice_h + spacing);
            var y_rect2 = y_rect1 + choice_h;

            if (mx > choice_x1 && mx < choice_x2 &&
                my > y_rect1 && my < y_rect2)
            {
                selected_choice = c; // store choice index (0=A, 1=B, 2=C)
                break;
            }
        }

        // === Confirm button region ===
       var confirm_w = 200;
		var confirm_h = 48;
		var confirm_x = area.x + area.w - confirm_w - 100;
		var confirm_y = area.y + area.h * 0.80 + 20;



        if (mx > confirm_x && mx < confirm_x + confirm_w &&
            my > confirm_y && my < confirm_y + confirm_h)
        {
            // Dialogue continues when confirmed
            if (instance_exists(dialog_ref))
                scr_dialogue_action_complete(dialog_ref);

            instance_destroy(); // Close this UI
            break;
        }
    }
}
