/*
// TEMP: End quiz when pressing Space
if (keyboard_check_pressed(vk_space)) {
    if (instance_exists(obj_quiz_controller)) {
        with (obj_quiz_controller) {
            quiz_done = true;
        }
    }
    instance_destroy(); // remove quiz GUI
}*/

// Handle submit press flash timer
if (submit_press_timer > 0) {
    submit_press_timer -= 1;
    submit_pressed = true;
} else {
    submit_pressed = false;
}

// ⚡ NEW: Handle H key press to use virtue ticket for hint
if (keyboard_check_pressed(ord("H")) && !showing_result) {
    var q = quiz_data[question_index];

    // Skip if no hint or already shown
    if (variable_struct_exists(q, "hint") && !variable_instance_exists(id, "hint_revealed")) {
        hint_revealed = false;
    }

    if (variable_struct_exists(q, "hint") && !hint_revealed) {
        var virtue = q.virtue;
        var hint_text = q.hint;

        var has_ticket = false;

        switch (virtue) {
            case "justice":
                if (global.file_handling_data.justice_tickets > 0) {
                    global.file_handling_data.justice_tickets -= 1;
                    has_ticket = true;
                } else show_toast("Walang Justice ticket!");
                break;

            case "wisdom":
                if (global.file_handling_data.wisdom_tickets > 0) {
                    global.file_handling_data.wisdom_tickets -= 1;
                    has_ticket = true;
                } else show_toast("Walang Wisdom ticket!");
                break;

            case "humility":
                if (global.file_handling_data.humility_tickets > 0) {
                    global.file_handling_data.humility_tickets -= 1;
                    has_ticket = true;
                } else show_toast("Walang Humility ticket!");
                break;
        }

        if (has_ticket) {
            hint_revealed = true;
            hint_display_text = "💡 Hint: " + hint_text;
            show_toast("Hint revealed!");
        }
    }
}

//showting result
// --- handle result + warp transition ---
if (showing_result) {
    result_timer -= 1;

    if (result_timer <= 0) {
        // Move to next question if any left
        if (question_index + 1 < total_questions) {

            // ⚡ Reset hint when next question starts
            hint_revealed = false;
            hint_display_text = "";

            quiz_show(quiz_data, question_index + 1);
        } else {
            // ✅ Finished all questions → trigger warp
            if (global.quiz_pending_warp) {

                //checking score
                if (quiz_score >= 3) {
                    // ✅ Passed
                    global.warp_spawn_x = global.quiz_target_x;
                    global.warp_spawn_y = global.quiz_target_y;

                    var t = instance_create_layer(0, 0, "ins_transition", obj_transition);
                    t.fading_out = true;
                    t.next_room = global.quiz_target_room;

                    global.quiz_pending_warp = false;
                    global.quiz_active = false; // ✅ mark quiz as finished

                } else {
                    // ❌ Score failed
                    show_toast("Bagsak na pagsusulit, Pakiusap uulitin ang pagsusulit.");

                    var room_name = room_get_name(room);

                    switch (room_name) {
                        case "rm_chapter2_crisostomo_ibarra":
                            with (obj_player) { x = 1055; y = 738; }
                            break;
                        case "rm_chapter3_hapunan":
                            with (obj_player) { x = 884; y = 673; }
                            break;
                    }

                    // Reset quiz state
                    global.quiz_pending_warp = false;
                    global.quiz_target_room = noone;
                    global.quiz_target_x = 0;
                    global.quiz_target_y = 0;

                    with (obj_warp) quiz_active = false;
                    with (obj_quiz_controller) quiz_done = false;

                    instance_destroy();
                }
                global.quiz_pending_warp = false;
            }
        }
    }
}

// --- Mouse or key input ---
if (!variable_instance_exists(id, "showing_result")) showing_result = false;

// --- Only handle input if result not showing ---
if (!showing_result) {
    var max_fingers = 5;

    for (var i = 0; i < max_fingers; i++) {
        if (device_mouse_check_button_pressed(i, mb_left)) {
            var tx = device_mouse_x_to_gui(i);
            var ty = device_mouse_y_to_gui(i);

            // --- Check all options ---
            for (var j = 0; j < array_length(options); j++) {
                var opt_w = panel_w * 0.8;
                var opt_x = cx - opt_w * 0.5;
                var opt_y = start_y + j * (btn_height + btn_spacing);

                if (point_in_rectangle(tx, ty, opt_x, opt_y, opt_x + opt_w, opt_y + btn_height)) {
                    selected = j;
                }
            }

            // --- Check submit button ---
            if (point_in_rectangle(tx, ty, submit_x, submit_y, submit_x + submit_w, submit_y + submit_h)) {
                submit_pressed = true;
                submit_press_timer = room_speed * 0.1;

                if (!showing_result) {
                    if (selected == -1) {
                        result_sprite = noone;
                        result_text = "Please select an answer!";
                        result_timer = room_speed * 1;
                        showing_result = false;
                    } else {
                        if (selected == correct_index) {
                            result_sprite = spr_quiz_correct;
                            quiz_score += 1;

                            if (quiz_score >= 5)
                                show_toast("Galing! Perfect score!!");
                        } else {
                            result_sprite = spr_quiz_wrong;
                        }

                        result_text = "";
                        result_timer = room_speed * 2;
                        showing_result = true;
                    }
                }
            }
        }
    }
}







/*
// --- handle result + warp transition ---
if (showing_result) {
    result_timer -= 1;

    if (result_timer <= 0) {
        // If there’s a pending warp, fade to next room
        if (global.quiz_pending_warp) {

            // ✅ Make sure the spawn coordinates are set FIRST
            global.warp_spawn_x = global.quiz_target_x;
            global.warp_spawn_y = global.quiz_target_y;

            // ✅ Then create the fade transition
            var t = instance_create_layer(0, 0, "ins_transition", obj_transition);
            t.fading_out = true;
            t.next_room = global.quiz_target_room;

            // ✅ Finally, clear the warp flag
            global.quiz_pending_warp = false;
        }

        // Clean up GUI after result display
        instance_destroy();
    }
}*/


