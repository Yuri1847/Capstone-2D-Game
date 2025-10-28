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
				//------------------------------------------
				// WHEN PLAYER MAKES A REFLECTION CHOICE
				//------------------------------------------
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

				    // === Ensure global data exists ===
				    if (!variable_global_exists("file_handling_data")) global.file_handling_data = {};
				    if (is_array(global.file_handling_data.reflections) || is_undefined(global.file_handling_data.reflections)) {
				        global.file_handling_data.reflections = {};
				    }

				    // --- Ticket counters setup ---
				    if (!variable_struct_exists(global.file_handling_data, "tickets")) global.file_handling_data.tickets = 0;
				    if (!variable_struct_exists(global.file_handling_data, "justice_tickets")) global.file_handling_data.justice_tickets = 0;
				    if (!variable_struct_exists(global.file_handling_data, "wisdom_tickets")) global.file_handling_data.wisdom_tickets = 0;
				    if (!variable_struct_exists(global.file_handling_data, "humility_tickets")) global.file_handling_data.humility_tickets = 0;

				    // --- Totals setup (for UI tracking) ---
				    if (!variable_struct_exists(global.file_handling_data, "total_justice")) global.file_handling_data.total_justice = 0;
				    if (!variable_struct_exists(global.file_handling_data, "total_wisdom")) global.file_handling_data.total_wisdom = 0;
				    if (!variable_struct_exists(global.file_handling_data, "total_humility")) global.file_handling_data.total_humility = 0;

				    // === Get reflection stats from global.reflection_data ===
				    var stats_struct = undefined;
				    if (variable_global_exists("reflection_data")) {
				        if (variable_struct_exists(global.reflection_data, reflection_id)) {
				            var ref_data = global.reflection_data[$ reflection_id];
				            if (variable_struct_exists(ref_data, "stats")) {
				                stats_struct = ref_data.stats;
				            }
				        }
				    }

				    // === Build save entry ===
				    var save_entry = {
				        choice_index: selected_choice,
				        virtue: virtue,
				        choice_text: result_text,
				        stats: stats_struct
				    };

				    // === Save reflection ===
				    global.file_handling_data.reflections[$ reflection_id] = save_entry;

				    // === MILESTONE & TICKET SYSTEM ===
				    var total_justice = 0;
				    var total_wisdom = 0;
				    var total_humility = 0;

				    var keys = variable_struct_get_names(global.file_handling_data.reflections);
				    for (var i = 0; i < array_length(keys); i++) {
				        var entry = global.file_handling_data.reflections[$ keys[i]];
				        if (variable_struct_exists(entry, "stats")) {
				            total_justice += entry.stats.justice;
				            total_wisdom += entry.stats.wisdom;
				            total_humility += entry.stats.humility;
				        }
				    }

				    // === Virtue milestones (5 points = 1 ticket) ===
				    while (total_justice >= 5) {
				        global.file_handling_data.justice_tickets += 1;
				        global.file_handling_data.tickets += 1;
				        total_justice -= 5;
				    }
				    while (total_wisdom >= 5) {
				        global.file_handling_data.wisdom_tickets += 1;
				        global.file_handling_data.tickets += 1;
				        total_wisdom -= 5;
				    }
				    while (total_humility >= 5) {
				        global.file_handling_data.humility_tickets += 1;
				        global.file_handling_data.tickets += 1;
				        total_humility -= 5;
				    }

				    // === SAVE RUNNING TOTALS FOR UI DISPLAY ===
				    global.file_handling_data.total_justice  = 0;
				    global.file_handling_data.total_wisdom   = 0;
				    global.file_handling_data.total_humility = 0;

				    for (var i = 0; i < array_length(keys); i++) {
				        var entry = global.file_handling_data.reflections[$ keys[i]];
				        if (variable_struct_exists(entry, "stats")) {
				            global.file_handling_data.total_justice  += entry.stats.justice;
				            global.file_handling_data.total_wisdom   += entry.stats.wisdom;
				            global.file_handling_data.total_humility += entry.stats.humility;
				        }
				    }
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
