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



//showting result
// --- handle result + warp transition ---
if (showing_result) {
    result_timer -= 1;

    if (result_timer <= 0) {
        // Move to next question if any left
        if (question_index + 1 < total_questions) {
			
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
							// Move player back (adjust coordinates)
							with (obj_player) {
								x = 1055;
								y = 738;
							}
							break;
					    case "rm_chapter3_hapunan": 
							// Move player back (adjust coordinates)
							with (obj_player) {
								x = 884;
								y = 673;
							}
							break;
					}

					// Reset quiz state so player can retry
					global.quiz_pending_warp = false;
					global.quiz_target_room = noone;
					global.quiz_target_x = 0;
					global.quiz_target_y = 0;

					// Allow reactivation on next collision
					with (obj_warp) {
					    quiz_active = false;
					}

					// Reset quiz variables
					with (obj_quiz_controller) {
					    quiz_done = false;
					}

					// Destroy GUI so it can be recreated next time
					instance_destroy();
				}

	            // ✅ Finally, clear the warp flag
	            global.quiz_pending_warp = false;
	        }
        }
    }
}




// --- Mouse or key input ---
// --- Make sure defaults exist ---
if (!variable_instance_exists(id, "showing_result")) showing_result = false;

// --- Only handle input if result not showing ---
if (!showing_result) {
    var max_fingers = 5; // supports up to 5 simultaneous touches

    for (var i = 0; i < max_fingers; i++) {
        if (device_mouse_check_button_pressed(i, mb_left)) {
            // Get touch position in GUI coordinates
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

            // --- Check submit button (bottom-right) ---
            if (point_in_rectangle(tx, ty, submit_x, submit_y, submit_x + submit_w, submit_y + submit_h)) {
                submit_pressed = true;
				 submit_press_timer = room_speed * 0.1; // ✅ flash for 0.1 seconds

                // ✅ Handle submission logic here
                if (!showing_result) {
                    if (selected == -1) {
                        // Nothing selected — optional feedback
                        result_sprite = noone;
                        result_text = "Please select an answer!";
                        result_timer = room_speed * 1;
                        showing_result = false;
                    } else {
                        // ✅ Show correct/wrong sprite depending on answer
                        if (selected == correct_index) {
                            result_sprite = spr_quiz_correct;
							quiz_score += 1;
							
							if(quiz_score >= 5){
								show_toast("Galing nakakuha ka ng perfect score!!")
							}
							
							
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


