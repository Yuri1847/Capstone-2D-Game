/// STEP EVENT

// === GUI AREA REFERENCE ===
var area = scr_get_camera_gui_area();
var gui_x = area.x;
var gui_y = area.y;
var gui_w = area.w;
var gui_h = area.h;

// --- Layout base ---
var cx = gui_x + gui_w * 0.5;
var cy = gui_y + gui_h * 0.5;
var panel_w = gui_w * 0.8;
var panel_h = gui_h * 0.8;
var opt_w = panel_w * 0.8;
var opt_x = cx - opt_w * 0.5;
var start_y = cy - panel_h * 0.1;

// --- Buttons ---
var submit_w = opt_w * 0.6;
var submit_h = btn_height;
var submit_x = cx - submit_w * 0.5;
var submit_y = start_y + array_length(options) * (btn_height + btn_spacing) + btn_spacing * 2;

var close_w = 120;
var close_h = 48;
var close_x = gui_x + gui_w - close_w - 40;
var close_y = gui_y + gui_h - close_h - 40;

// --- Hint Button (TOP-LEFT) ---
var hint_w = 160;
var hint_h = 48;
var hint_x = gui_x + 40;
var hint_y = gui_y + 40;


// ==================================================================
// === SUBMIT PRESS FLASH TIMER ===
if (submit_press_timer > 0) {
    submit_press_timer -= 1;
    submit_pressed = true;
} else submit_pressed = false;


// ==================================================================
// === DETERMINE CURRENT VIRTUE (for GUI display) ===
if (array_length(quiz_data) > 0) {
    var q = quiz_data[question_index];
    if (variable_struct_exists(q, "virtue")) {
        current_virtue = q.virtue;
    } else {
        current_virtue = "unknown";
    }
}


// ==================================================================
// === INPUT HANDLING ===
var max_fingers = 5;
for (var i = 0; i < max_fingers; i++) {
    if (device_mouse_check_button_pressed(i, mb_left)) {
        var tx = device_mouse_x_to_gui(i);
        var ty = device_mouse_y_to_gui(i);

        // === TAP TO CONTINUE (SUMMARY SCREEN) ===
        if (summary_visible) {
            if (summary_tap_delay <= 0) {
                continue_pressed = true;

                if (quiz_score >= 3) {
                    // ✅ PASS: warp to next chapter / location
                    global.warp_spawn_x = global.quiz_target_x;
                    global.warp_spawn_y = global.quiz_target_y;

                    var t = instance_create_layer(0, 0, "ins_transition", obj_transition);
                    t.fading_out = true;
                    t.next_room = global.quiz_target_room;

                    global.quiz_pending_warp = false;
                    global.quiz_active = false;
                } else {
                    // ❌ FAIL: retry quiz
                    show_toast("Bagsak na pagsusulit, ulitin ang pagsusulit.");

                    // Reset all relevant globals
                    global.quiz_pending_warp = false;
                    global.quiz_active = false;
                    global.quiz_target_room = noone;

                    // Reset quiz controller state
                    with (obj_quiz_controller) {
                        quiz_done = false;
                        quiz_score = 0;
                        question_index = 0;
                        summary_visible = false;
                        showing_result = false;
                        hint_revealed = false;
                        hint_display_text = "";
                    }

                    // Return to the previous room
                    if (variable_global_exists("prev_room")) {
                        global.warp_spawn_x = global.prev_x;
                        global.warp_spawn_y = global.prev_y;

                        var t = instance_create_layer(0, 0, "ins_transition", obj_transition);
                        t.fading_out = true;
                        t.next_room = global.prev_room;
                    } else {
                        // fallback: reload current room
                        room_goto(room);
                    }

                    // Destroy the current quiz GUI instance
                    instance_destroy();
                }
            }
        }

        // === OPTIONS ===
        if (!summary_visible) {
            for (var j = 0; j < array_length(options); j++) {
                var opt_y = start_y + j * (btn_height + btn_spacing);
                if (point_in_rectangle(tx, ty, opt_x, opt_y, opt_x + opt_w, opt_y + btn_height)) {
                    selected = j;
                }
            }
        }

        // === SUBMIT / NEXT ===
        if (!summary_visible && point_in_rectangle(tx, ty, submit_x, submit_y, submit_x + submit_w, submit_y + submit_h)) {
            submit_pressed = true;
            submit_press_timer = room_speed * 0.1;

            if (selected == -1) {
                result_sprite = noone;
                result_text = "Please select an answer!";
                showing_result = false;
            } else {
                if (selected == correct_index) {
                    result_sprite = spr_quiz_correct;
                    quiz_score += 1;
                    if (quiz_score >= 5) show_toast("Galing! Perfect score!!");
                } else {
                    result_sprite = spr_quiz_wrong;
                }
                showing_result = true;
                result_timer = room_speed * 2;
            }
        }

        // === CLOSE ===
        if (!summary_visible && point_in_rectangle(tx, ty, close_x, close_y, close_x + close_w, close_y + close_h)) {
            close_pressed = true;
            global.quiz_active = false;
            global.quiz_pending_warp = false;

            var t = instance_create_layer(0, 0, "ins_transition", obj_transition);
            t.fading_out = true;

            if (variable_global_exists("prev_room")) {
                t.next_room = global.prev_room;
                global.warp_spawn_x = global.prev_x;
                global.warp_spawn_y = global.prev_y;
            } else t.next_room = room;
			
            instance_destroy();
        }

        // === HINT BUTTON ===
        if (!summary_visible && point_in_rectangle(tx, ty, hint_x, hint_y, hint_x + hint_w, hint_y + hint_h)) {
            hint_pressed = true;
            var q = quiz_data[question_index];

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
    }
}


// === RELEASE STATE RESET ===
if (mouse_check_button_released(mb_left)) {
    submit_pressed = false;
    close_pressed = false;
    hint_pressed = false;
    continue_pressed = false;
}


// ==================================================================
// === RESULT TIMER HANDLING ===
if (showing_result) {
    result_timer -= 1;

    if (result_timer <= 0) {
        if (question_index + 1 < total_questions) {
            hint_revealed = false;
            hint_display_text = "";
            quiz_show(quiz_data, question_index + 1);
        } else {
            // ✅ Finished all questions — show summary instead of warp
            showing_result = false;
            summary_visible = true;
            summary_tap_delay = 15; // small delay before tap works
        }
    }
}

// === SUMMARY TAP DELAY TIMER ===
if (summary_visible && summary_tap_delay > 0) {
    summary_tap_delay -= 1;
}
