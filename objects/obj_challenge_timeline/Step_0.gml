// Fade in the timeline
if (!timeline_done && alpha < 1) {
    alpha = min(1, alpha + fade_speed);
    if (instance_exists(timeline_card)) timeline_card.image_alpha = alpha;
}

// Continue when player presses Enter or clicks
if (!timeline_done && (keyboard_check_pressed(vk_enter) || mouse_check_button_pressed(mb_left))) {
    timeline_done = true;
}

// Fade out and go to next room
if (timeline_done) {
    alpha = max(0, alpha - fade_speed);
    if (instance_exists(timeline_card)) timeline_card.image_alpha = alpha;

    if (alpha <= 0) {
        if (instance_exists(timeline_card)) instance_destroy(timeline_card);

        // Room transition
        if (room_exists(global.next_room)) {
            room_goto(global.next_room);
            with (obj_player) {
                x = global.next_x;
                y = global.next_y;
                if (variable_instance_exists(id, "can_move")) can_move = true;
            }
        } else {
            show_debug_message("⚠️ Invalid next room: " + string(global.next_room));
        }

        instance_destroy();
    }
}
