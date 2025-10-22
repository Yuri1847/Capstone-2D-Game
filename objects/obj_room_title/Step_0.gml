// Fade in/out state machine
switch (state) {
    case "fade_in":
        alpha += fade_speed;
        if (alpha >= 1) {
            alpha = 1;
            state = "hold";
        }
        break;

    case "hold":
        timer++;
        if (timer >= hold_time) {
            state = "fade_out";
        }
        break;

    case "fade_out":
        alpha -= fade_speed;
        if (alpha <= 0) {
            instance_destroy();
        }
        break;
}

// Horizontal expansion animation (always lerp to 1)
if (width_scale < target_width_scale) {
    width_scale = lerp(width_scale, target_width_scale, transition_speed);
}
// minor clamp to prevent infinitesimal leftover
if (width_scale > 0.999) width_scale = 1;
