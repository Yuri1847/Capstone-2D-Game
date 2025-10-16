if (!visible) exit;

draw_sprite_stretched(spr_quiz_bg, 0, 0, 0, gui_w, gui_h);

// Draw question
draw_set_color(c_black);
draw_set_font(fn_quiz);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_text(cx, cy - panel_h/2 + 80, question);


// Draw options
for (var i = 0; i < array_length(options); i++) {
    // Match the same layout math as in Step
    var opt_w = panel_w * 0.8;
    var opt_x = cx - opt_w * 0.5;
    var opt_y = start_y + i * (btn_height + btn_spacing);

    // Draw button background
    draw_sprite_stretched(spr_quiz_opt, 0, opt_x, opt_y, opt_w, btn_height);

    // Highlight selected option
    if (i == selected) {
        draw_set_alpha(0.4);
        draw_set_color(c_green);
        draw_rectangle(opt_x, opt_y, opt_x + opt_w, opt_y + btn_height, false);
        draw_set_alpha(1);
    }

    // Draw option text
    draw_set_color(c_black);
    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);
    draw_text(cx, opt_y + btn_height * 0.5, options[i]);
}


if (showing_result) {
    draw_set_color(c_white);
    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);
    draw_text(cx, cy + panel_h/2 - 60, result_text);
}
