/// Step Event
var area = scr_get_camera_gui_area();
hover_confirm = false;

var max_fingers = 5;
for (var i = 0; i < max_fingers; i++)
{
    var mx = device_mouse_x_to_gui(i);
    var my = device_mouse_y_to_gui(i);

    // === Choice button regions ===
    var choice_x1 = area.x + area.w * 0.1;
    var choice_x2 = area.x + area.w * 0.9;
    var y_mid1_end = area.y + area.h * 0.40;
    var h_mid2 = area.h * 0.40;
    var choice_y = y_mid1_end + h_mid2 * 0.15;
    var choice_h = 56;
    var spacing = 16;

    for (var c = 0; c < 3; c++)
    {
        var y_rect1 = choice_y + c * (choice_h + spacing);
        var y_rect2 = y_rect1 + choice_h;

        // Detect click for selection
        if (mx > choice_x1 && mx < choice_x2 && my > y_rect1 && my < y_rect2)
        {
            if (device_mouse_check_button_pressed(i, mb_left))
                selected_choice = c;
        }
    }

    // === Confirm button region ===
    var h_total = area.h;
    var h_top    = h_total * 0.20;
    var h_mid1   = h_total * 0.20;
    var h_mid2   = h_total * 0.40;
    var h_bottom = h_total * 0.20;
    var y_mid1_end   = area.y + h_top + h_mid1;
    var y_mid2_end   = y_mid1_end + h_mid2;

    var stat_y = y_mid2_end + h_bottom * 0.25;

    var confirm_w = 200;
    var confirm_h = 48;
    var confirm_x = area.x + area.w - confirm_w - 100;
    var confirm_y = stat_y + 20;

    if (mx > confirm_x && mx < confirm_x + confirm_w && my > confirm_y && my < confirm_y + confirm_h)
    {
        hover_confirm = true;

        if (device_mouse_check_button_pressed(i, mb_left))
        {
            if (selected_choice != -1)
            {
                // === Ensure global struct exists ===
                if (is_undefined(global.file_handling_data))
                    global.file_handling_data = {};

                if (is_undefined(global.file_handling_data.reflections))
                    global.file_handling_data.reflections = {};

                // === Save result ===
				if (!is_undefined(reflection_id))
				{
				    var result_text = choice_list[selected_choice];
				    var virtue = "";

				    switch (selected_choice)
				    {
				        case 0: virtue = "Justice"; break;
				        case 1: virtue = "Wisdom"; break;
				        case 2: virtue = "Humility"; break;
				    }

				    // Safety: ensure reflections is a struct
				    if (is_array(global.file_handling_data.reflections) || is_undefined(global.file_handling_data.reflections)) {
				        global.file_handling_data.reflections = {};
				    }

				    // Save data properly
				    global.file_handling_data.reflections[$ reflection_id] = {
					    choice_index: selected_choice,
					    virtue: virtue,
					    choice_text: result_text,
					};



				    show_debug_message("✅ Saved reflection: " + string(reflection_id) + " → " + virtue);
				}


                // === Close UI and continue ===
                if (instance_exists(dialog_ref))
                    scr_dialogue_action_complete(dialog_ref);

                instance_destroy();
                break;
            }
        }
    }
}
