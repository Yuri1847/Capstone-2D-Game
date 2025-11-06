if (!global.enabledJOY) exit;

if(global.switchMovementControll){
	//JOYSTICK
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
} else {
	//D-PAD
	// Top row
	draw_sprite(spr_top_left_cb, 0, x0, y0);
	draw_sprite(spr_top_center_cb, 0, x0 + (max_w + gap), y0);
	draw_sprite(spr_top_right_cb, 0, x0 + (max_w + gap) * 2, y0);

	// Middle row
	draw_sprite(spr_middle_left_cb, 0, x0, y0 + (h_top + gap));
	draw_sprite(spr_middle_right_cb, 0, x0 + (max_w + gap) * 2, y0 + (h_top + gap));

	// Bottom row
	draw_sprite(spr_bottom_left_cb, 0, x0, y0 + (h_top + gap) + (h_mid + gap));
	draw_sprite(spr_bottom_center_cb, 0, x0 + (max_w + gap), y0 + (h_top + gap) + (h_mid + gap));
	draw_sprite(spr_bottom_right_cb, 0, x0 + (max_w + gap) * 2, y0 + (h_top + gap) + (h_mid + gap));

	// Optional debug rectangles
	/*draw_set_color(c_lime);
	if (moveUp)    draw_rectangle(x0 + (max_w + gap), y0, x0 + (max_w + gap) * 2, y0 + (h_top + gap), false);
	if (moveDown)  draw_rectangle(x0 + (max_w + gap), y0 + (h_top + gap) + (h_mid + gap), x0 + (max_w + gap) * 2, y0 + (h_top + gap) + (h_mid + gap) + h_bot, false);
	if (moveLeft)  draw_rectangle(x0, y0 + (h_top + gap), x0 + (max_w + gap), y0 + (h_top + gap) + (h_mid + gap), false);
	if (moveRight) draw_rectangle(x0 + (max_w + gap) * 2, y0 + (h_top + gap), x0 + (max_w + gap) * 3, y0 + (h_top + gap) + (h_mid + gap), false);
	draw_set_color(c_white);*/
}




