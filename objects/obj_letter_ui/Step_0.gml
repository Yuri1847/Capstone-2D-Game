/// STEP EVENT
var area = scr_get_camera_gui_area();
hover_confirm = false;

if (_tap_timer > 0) _tap_timer -= 1;

// input scanning: support up to 5 touch points (or mouse)
var max_fingers = 5;
var any_tap = false;
for (var f = 0; f < max_fingers; f++)
{
    var mx = device_mouse_x_to_gui(f);
    var my = device_mouse_y_to_gui(f);

    // quick tap-anywhere detection (pressed)
    if (device_mouse_check_button_pressed(f, mb_left))
    {
        any_tap = true;
    }
}

// STATE: Title -> Instruction -> Play -> Summary
if (state == "title")
{
    // tap anywhere to continue to instruction
    if (any_tap && _tap_timer <= 0)
    {
        state = "instruction";
        _tap_timer = _tap_cooldown;
    }
    // don't process play UI while in title
    return;
}
else if (state == "instruction")
{
    if (any_tap && _tap_timer <= 0)
    {
        state = "play";
        _tap_timer = _tap_cooldown;
    }
    // don't process play UI while in instruction
    return;
}
else if (state == "summary")
{
    // Tap anywhere to close summary and clean up
    if (any_tap && _tap_timer <= 0)
    {
        // Close UI and continue
        if (instance_exists(dialog_ref))
            scr_dialogue_action_complete(dialog_ref);

        instance_destroy();
    }
    return;
}
// else state == "play" -> run your existing input logic for choices and confirm

// === PLAY STATE: process choice selection & confirm ===
// Layout references
var gui_x = area.x;
var gui_y = area.y;
var gui_w = area.w;
var gui_h = area.h;

// === Choice button regions ===
var choice_x1 = area.x + area.w * 0.1;
var choice_x2 = area.x + area.w * 0.9;
var y_mid1_end = area.y + area.h * 0.40;
var h_mid2 = area.h * 0.40;
var choice_y = y_mid1_end + h_mid2 * 0.15;
var choice_h = 56;
var spacing = 16;

for (var f2 = 0; f2 < max_fingers; f2++)
{
    var mx2 = device_mouse_x_to_gui(f2);
    var my2 = device_mouse_y_to_gui(f2);

    for (var c = 0; c < 3; c++)
    {
        var y_rect1 = choice_y + c * (choice_h + spacing);
        var y_rect2 = y_rect1 + choice_h;

        // Detect click for selection
        if (mx2 > choice_x1 && mx2 < choice_x2 && my2 > y_rect1 && my2 < y_rect2)
        {
            if (device_mouse_check_button_pressed(f2, mb_left))
                selected_choice = c;
        }
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

// check hover and presses for confirm (only in play state)
for (var f3 = 0; f3 < max_fingers; f3++)
{
    var mx3 = device_mouse_x_to_gui(f3);
    var my3 = device_mouse_y_to_gui(f3);

    if (mx3 > confirm_x && mx3 < confirm_x + confirm_w && my3 > confirm_y && my3 < confirm_y + confirm_h)
    {
        hover_confirm = true;

        if (device_mouse_check_button_pressed(f3, mb_left))
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

                            // Prefer per-choice stats if available
                            if (variable_struct_exists(ref_data, "choice_stats") && is_array(ref_data.choice_stats)) {
                                if (selected_choice >= 0 && selected_choice < array_length(ref_data.choice_stats)) {
                                    stats_struct = ref_data.choice_stats[selected_choice];
                                }
                            }

                            // Fallback to base stats if no per-choice defined
                            if (is_undefined(stats_struct) && variable_struct_exists(ref_data, "stats")) {
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
                    for (var kidx = 0; kidx < array_length(keys); kidx++) {
                        var entry = global.file_handling_data.reflections[$ keys[kidx]];
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

                    for (var kidx2 = 0; kidx2 < array_length(keys); kidx2++) {
                        var entry2 = global.file_handling_data.reflections[$ keys[kidx2]];
                        if (variable_struct_exists(entry2, "stats")) {
                            global.file_handling_data.total_justice  += entry2.stats.justice;
                            global.file_handling_data.total_wisdom   += entry2.stats.wisdom;
                            global.file_handling_data.total_humility += entry2.stats.humility;
                        }
                    }
                }

                // === Instead of destroying, move to summary state ===
                // Prepare summary text from global.file_handling_data (if available)
                if (variable_global_exists("file_handling_data")) {
                    var fd = global.file_handling_data;
                    var tj = (variable_struct_exists(fd, "total_justice") ? string(fd.total_justice) : "0");
                    var tw = (variable_struct_exists(fd, "total_wisdom") ? string(fd.total_wisdom) : "0");
                    var th = (variable_struct_exists(fd, "total_humility") ? string(fd.total_humility) : "0");
                    var tickets = (variable_struct_exists(fd, "tickets") ? string(fd.tickets) : "0");
                    _summary_text = "Summary\n\nJustice: " + tj + "\nWisdom: " + tw + "\nHumility: " + th + "\n\nTickets: " + tickets + "\n\nTap anywhere to continue.";
                } else {
                    _summary_text = "Summary\n\nNo data available.\n\nTap anywhere to continue.";
                }

                state = "summary";
                _tap_timer = _tap_cooldown;

                // reset selected_choice so UI doesn't keep showing highlight if needed later
                // selected_choice = -1; // optional, keep if you want
            }
        }
    }
}
