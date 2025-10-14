// --- End Step Event (Touch-based Dialogue System) ---
if (current_message < 0) exit;

// safety check
if (current_message >= array_length(messages)) {
    with (obj_katulong) npc_can_move = true;
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
