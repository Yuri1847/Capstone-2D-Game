// === Exit if no message ===
if (current_message < 0) exit;

// === Get current message text ===
var _str = messages[current_message].msg;
var next = false;

// === Detect touch input anywhere on GUI area ===
var tapped = false;
var max_fingers = 5;

// Get camera GUI area
var area = scr_get_camera_gui_area();
var gui_x1 = area.x;
var gui_y1 = area.y;
var gui_x2 = area.x + area.w;
var gui_y2 = area.y + area.h;

for (var i = 0; i < max_fingers; i++) {
    if (device_mouse_check_button_pressed(i, mb_left)) {
        var tx = device_mouse_x_to_gui(i);
        var ty = device_mouse_y_to_gui(i);

        // Use camera GUI area instead of hardcoded 1280x720
        if (point_in_rectangle(tx, ty, gui_x1, gui_y1, gui_x2, gui_y2)) {
            tapped = true;
        }
    }
}

// === Handle typing and tapping logic ===
if (current_char < string_length(_str)) {
    // Still typing text
    if (tapped) {
        // Instantly complete the current line on tap
        current_char = string_length(_str);
    } else {
        // Continue typing effect
        current_char += char_speed;
    }
    draw_message = string_copy(_str, 0, current_char);
} else {
    // Text fully displayed — wait for next tap to continue
    if (tapped) {
        next = true;
    }

    // Go to next message or close dialogue
    if (next) {
        current_message++;
        if (current_message >= array_length(messages)) {
            with (obj_npc_parent) {
                npc_can_move = true;
            }
            // === SIMPLE DIALOGUE SEQUENCE CHECK ===
            scr_dialogue_seq();
            obj_Pause_manager.pause = false;
            obj_Pause_manager.update_pause();
            sc_visible_layer([
                "pause_button_layer",
                "right_option_layer",
            ]);
            if (instance_exists(obj_talk_button)) obj_talk_button.isEnabled = true;
            instance_destroy();
        } else {
            current_char = 0;
        }
    }
}



/*
// --- End Step Event (Touch-based Dialogue System) ---
if (current_message < 0) exit;

// safety check
if (current_message >= array_length(messages)) {
    with (obj_npc_parent) npc_can_move = true;
    instance_destroy();
    exit;
}

var _str = messages[current_message].msg;

// detect tap (with cooldown)
if (!variable_global_exists("tap_cooldown")) global.tap_cooldown = 0;
if (global.tap_cooldown > 0) global.tap_cooldown--;

var tapped = false;
for (var i = 0; i < 5; i++) {
    if (device_mouse_check_button_pressed(i, mb_left) && global.tap_cooldown <= 0) {
        tapped = true;
        global.tap_cooldown = 8; // small debounce
        break;
    }
}

// --- if still typing ---
if (current_char < string_length(_str)) {
    if (tapped) {
        // Tap while text is still typing → instantly reveal all
        current_char = string_length(_str);
    } else {
        // Continue typewriter effect
        current_char += char_speed;
    }

// --- if finished typing ---
} else if (tapped) {
    // Tap after full text → move to next message
    current_message++;

    if (current_message >= array_length(messages)) {
        with (obj_katulong) npc_can_move = true;
        instance_destroy();
		instance_activate_object(obj_joystick_base)
    } else {
        current_char = 0;
    }
}

// --- update draw_message ---
draw_message = string_copy(_str, 1, current_char);
*/





/*
// original code space key to trigger
if (current_message < 0) exit;

var _str = messages[current_message].msg;

if (current_char < string_length(_str)){
	current_char += char_speed * (1 + keyboard_check(input_key));
	draw_message = string_copy(_str, 0, current_char);
}

else if(keyboard_check_pressed(input_key)){
	current_message++;
	if (current_message >= array_length(messages)){
		with (obj_katulong) {
		    npc_can_move = true;
		}

		instance_destroy();
	}else{
		current_char = 0;
	}
}*/
