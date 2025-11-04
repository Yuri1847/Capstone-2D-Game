// Draw GUI Event of obj_joystick_base

var scale = global.joystick_scale;

draw_sprite_ext(spr_joystick_base, 0, x, y, scale, scale, 0, c_white, 1);
draw_sprite_ext(spr_joystick_cursor, 0, x + joyX, y + joyY, scale, scale, 0, c_white, 1);


// 🔆 Draw highlight glow if active
// 🔆 Draw highlight glow if active
if (highlight_alpha > 0)
{
    // Optional pulse so alpha breathes gently
    var pulse = 0.75 + 0.25 * sin(current_time / 50);

    draw_set_alpha(highlight_alpha * pulse);

    // Draw the animated glow sprite
    // The sprite’s animation frames already create the “moving” glow
    draw_sprite_ext(
        spr_highlight_glow,
        floor(current_time / 50) mod sprite_get_number(spr_highlight_glow), // cycle frames manually if not automatic
        x, y,
        scale * 1.8, scale * 1.8,
        0,
        c_white,
        1
    );

    draw_set_alpha(1);
}


