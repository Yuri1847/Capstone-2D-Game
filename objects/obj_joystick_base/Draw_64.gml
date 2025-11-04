// Draw GUI Event of obj_joystick_base

var scale = global.joystick_scale;

draw_sprite_ext(spr_joystick_base, 0, x, y, scale, scale, 0, c_white, 1);
draw_sprite_ext(spr_joystick_cursor, 0, x + joyX, y + joyY, scale, scale, 0, c_white, 1);


if (highlight_alpha > 0)
{
    // 🕐 Make pulse slower by reducing frequency
    var pulse = 0.75 + 0.25 * sin(current_time / 300); // was 50 → now 300 (≈6x slower)

    draw_set_alpha(highlight_alpha * pulse);

    // 🌀 Slow down frame cycling as well
    var frame_speed = 150; // higher = slower animation
    var frame = floor(current_time / frame_speed) mod sprite_get_number(spr_highlight_glow);

    draw_sprite_ext(
        spr_highlight_glow,
        frame,
        x, y,
        scale * 1.8, scale * 1.8,
        0,
        c_white,
        1
    );

    draw_set_alpha(1);
}



