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

/// Step Event – quiz logic + transition control

// --- answer selection ---
if (!showing_result) {
    // Move between options
    if (keyboard_check_pressed(vk_up)) selected = max(0, selected - 1);
    if (keyboard_check_pressed(vk_down)) selected = min(array_length(options) - 1, selected + 1);

    // Confirm choice with Space / Enter
    if (keyboard_check_pressed(vk_space) || keyboard_check_pressed(vk_enter)) {
        if (selected == correct_index) {
            result_text = "✅ Correct!";
        } else {
            result_text = "❌ Wrong! Correct answer: " + options[correct_index];
        }

        showing_result = true;
        result_timer = room_speed * 2; // show result for ~2 seconds
    }
}


// --- Mouse or key input ---
// --- Make sure defaults exist ---
if (!variable_instance_exists(id, "showing_result")) showing_result = false;

// --- Only handle input if result not showing ---
if (!showing_result) {
    var mx = device_mouse_x(0);
    var my = device_mouse_y(0);

    if (mouse_check_button_pressed(mb_left)) {
        for (var i = 0; i < array_length(options); i++) {
            var opt_y = start_y + i * (btn_height + btn_spacing);
            var opt_w = panel_w * 0.8;
            var opt_x = cx - opt_w / 2;

            if (mx > opt_x && mx < opt_x + opt_w && my > opt_y && my < opt_y + btn_height) {
                selected = i;
            }
        }
    }
}



// --- handle result + warp transition ---
if (showing_result) {
    result_timer -= 1;

    if (result_timer <= 0) {
        // if there’s a pending warp, fade to next room
        if (global.quiz_pending_warp) {
            var t = instance_create_layer(0, 0, "ins_transition", obj_transition);
            t.fading_out = true;
            t.next_room = global.quiz_target_room;

            global.quiz_pending_warp = false;
        }

        instance_destroy(); // remove the quiz GUI
    }
}

