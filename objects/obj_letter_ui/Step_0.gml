/// STEP EVENT

var area = scr_get_camera_gui_area();
hover_confirm = false;

if (_tap_timer > 0) _tap_timer -= 1;

//--------------------------------------
// INPUT SCANNING (multi-touch support)
//--------------------------------------
var max_fingers = 5;
var any_tap = false;
for (var f = 0; f < max_fingers; f++) {
    if (device_mouse_check_button_pressed(f, mb_left)) {
        any_tap = true;
    }
}

//--------------------------------------
// STATE: Title → Instruction → Play → Summary
//--------------------------------------
if (state == "title") {
    if (any_tap && _tap_timer <= 0) {
        state = "instruction";
        _tap_timer = _tap_cooldown;
    }
    return;
}
else if (state == "instruction") {
    if (any_tap && _tap_timer <= 0) {
        state = "play";
        _tap_timer = _tap_cooldown;
    }
    return;
}
else if (state == "summary") {
    if (any_tap && _tap_timer <= 0) {
        if (instance_exists(dialog_ref))
            scr_dialogue_action_complete(dialog_ref);
        instance_destroy();
    }
    return;
}

//--------------------------------------
// PLAY STATE: Choice Selection
//--------------------------------------
var choice_x1 = area.x + area.w * 0.1;
var choice_x2 = area.x + area.w * 0.9;
var y_mid1_end = area.y + area.h * 0.40;
var h_mid2 = area.h * 0.40;
var choice_y = y_mid1_end + h_mid2 * 0.15;
var choice_h = 56;
var spacing = 16;

for (var f2 = 0; f2 < max_fingers; f2++) {
    var mx2 = device_mouse_x_to_gui(f2);
    var my2 = device_mouse_y_to_gui(f2);

    for (var c = 0; c < 3; c++) {
        var y_rect1 = choice_y + c * (choice_h + spacing);
        var y_rect2 = y_rect1 + choice_h;

        if (mx2 > choice_x1 && mx2 < choice_x2 && my2 > y_rect1 && my2 < y_rect2) {
            if (device_mouse_check_button_pressed(f2, mb_left))
                selected_choice = c;
        }
    }
}

//--------------------------------------
// CONFIRM BUTTON LOGIC
//--------------------------------------
var confirm_w = 200;
var confirm_h = 48;
var confirm_x = area.x + (area.w - confirm_w) * 0.5;
var confirm_y = area.y + area.h - confirm_h - 20;

for (var f3 = 0; f3 < max_fingers; f3++) {
    var mx3 = device_mouse_x_to_gui(f3);
    var my3 = device_mouse_y_to_gui(f3);

    if (mx3 > confirm_x && mx3 < confirm_x + confirm_w && my3 > confirm_y && my3 < confirm_y + confirm_h) {
        hover_confirm = true;

        if (device_mouse_check_button_pressed(f3, mb_left)) {
            if (selected_choice != -1) {

                //--------------------------------------
                // ENSURE GLOBAL STRUCTS EXIST
                //--------------------------------------
                if (is_undefined(global.file_handling_data)) global.file_handling_data = {};
                var fd = global.file_handling_data;
                if (is_undefined(fd.reflections)) fd.reflections = {};

                //--------------------------------------
                // GATHER REFLECTION DATA
                //--------------------------------------
                if (!is_undefined(reflection_id)) {
                    var virtue = "";
                    if (selected_choice == 0) virtue = "Justice";
                    else if (selected_choice == 1) virtue = "Wisdom";
                    else if (selected_choice == 2) virtue = "Humility";

                    var stats_struct = { justice: 0, wisdom: 0, humility: 0 };
                    if (variable_global_exists("reflection_data")) {
                        if (variable_struct_exists(global.reflection_data, reflection_id)) {
                            var ref_data = global.reflection_data[$ reflection_id];
                            if (variable_struct_exists(ref_data, "choice_stats") && is_array(ref_data.choice_stats)) {
                                if (selected_choice >= 0 && selected_choice < array_length(ref_data.choice_stats)) {
                                    stats_struct = ref_data.choice_stats[selected_choice];
                                }
                            }
                        }
                    }

                    //--------------------------------------
                    // SAVE REFLECTION ENTRY
                    //--------------------------------------
                    fd.reflections[$ reflection_id] = {
                        choice_index: selected_choice,
                        virtue: virtue,
                        stats: stats_struct
                    };

                    //--------------------------------------
                    // RECALCULATE TOTALS
                    //--------------------------------------
                    var total_justice = 0;
                    var total_wisdom = 0;
                    var total_humility = 0;
                    var keys = variable_struct_get_names(fd.reflections);

                    for (var i = 0; i < array_length(keys); i++) {
                        var entry = fd.reflections[$ keys[i]];
                        if (variable_struct_exists(entry, "stats")) {
                            total_justice  += entry.stats.justice;
                            total_wisdom   += entry.stats.wisdom;
                            total_humility += entry.stats.humility;
                        }
                    }

                    //--------------------------------------
                    // CALCULATE TICKETS (5 points = 1 ticket)
                    //--------------------------------------
                    fd.justice_tickets  = floor(total_justice / 5);
                    fd.wisdom_tickets   = floor(total_wisdom / 5);
                    fd.humility_tickets = floor(total_humility / 5);
                    fd.tickets = fd.justice_tickets + fd.wisdom_tickets + fd.humility_tickets;

                    //--------------------------------------
                    // STORE TOTALS FOR UI
                    //--------------------------------------
                    fd.total_justice  = total_justice;
                    fd.total_wisdom   = total_wisdom;
                    fd.total_humility = total_humility;

                    //--------------------------------------
                    // BUILD SUMMARY TEXT
                    //--------------------------------------
                    _summary_text =
                        "Summary\n\n" +
                        "Justice: " + string(fd.total_justice) +
                        "\nWisdom: " + string(fd.total_wisdom) +
                        "\nHumility: " + string(fd.total_humility) +
                        "\n\nTickets: " + string(fd.tickets) +
                        "\n\nTap anywhere to continue.";

                    //--------------------------------------
                    // TRANSITION TO SUMMARY STATE
                    //--------------------------------------
                    state = "summary";
                    _tap_timer = _tap_cooldown;
                }
            }
        }
    }
}
