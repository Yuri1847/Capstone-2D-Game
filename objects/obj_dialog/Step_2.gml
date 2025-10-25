// === Exit if no message ===
if (current_message < 0) exit;

// === Get current message ===
var msg_struct = messages[current_message];
var _str = msg_struct.msg;
var next = false;

// === Detect tap input (uses GUI area) ===
var tapped = false;
var max_fingers = 5;

var area = scr_get_camera_gui_area();
var gui_x1 = area.x;
var gui_y1 = area.y;
var gui_x2 = area.x + area.w;
var gui_y2 = area.y + area.h;

for (var i = 0; i < max_fingers; i++) {
    if (device_mouse_check_button_pressed(i, mb_left)) {
        var tx = device_mouse_x_to_gui(i);
        var ty = device_mouse_y_to_gui(i);
        if (point_in_rectangle(tx, ty, gui_x1, gui_y1, gui_x2, gui_y2)) {
            tapped = true;
        }
    }
}

// === If an external action is running, freeze dialogue until it completes ===
if (_action_running) {
    // Optional: instantly show the full line while waiting
    draw_message = string_copy(_str, 0, string_length(_str));
    exit;
}

// === Typing effect logic ===
if (current_char < string_length(_str)) {
    if (tapped) {
        // Instantly complete the line
        current_char = string_length(_str);
    } else {
        current_char += char_speed;
    }
    draw_message = string_copy(_str, 0, current_char);
} else {
    // Text fully displayed
    if (tapped) next = true;

    // === When tapping to advance ===
    if (next) {

        // --- Check if current message has an action ---
        if (is_struct(msg_struct) && variable_struct_exists(msg_struct, "action")) {
            var _a = msg_struct.action;

            // only run once
            if (!variable_struct_exists(msg_struct, "action_done") || !msg_struct.action_done) {
                messages[current_message].action_done = true;

                // Run the action
                scr_dialogue_start_action(_a, id);

                // If required, stop dialogue until action completes
                if (_a.required) {
                    exit; // wait for scr_dialogue_action_complete() to resume
                }
            }
        }

        // --- Advance to next message ---
        current_message++;

        if (current_message >= array_length(messages)) {
            // === Dialogue Finished ===
            with (obj_npc_parent) {
                npc_can_move = true;
            }

            scr_dialogue_seq();

            obj_Pause_manager.pause = false;
            obj_Pause_manager.update_pause();

            sc_visible_layer(["pause_button_layer", "right_option_layer"]);

            if (instance_exists(obj_talk_button)) {
                obj_talk_button.isEnabled = true;
            }

            dialogue_active = false;
            instance_destroy(); // destroy this dialogue box
        } else {
            // Reset for next line
            current_char = 0;
        }
    }
}
