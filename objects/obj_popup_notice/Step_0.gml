// Fade in
if (alpha < 1) alpha = lerp(alpha, 1, 0.1);

// Horizontal expansion animation
if (width_scale < target_width_scale)
    width_scale = lerp(width_scale, target_width_scale, transition_speed);

// Close on click
if (mouse_check_button_pressed(mb_left)) {
    instance_destroy();
}
