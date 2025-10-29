if (!visible) exit;

// --- Background ---
draw_sprite_stretched(spr_quiz_bg, 0, 0, 0, gui_w, gui_h);

// --- Draw number of question and score ---
draw_set_color(c_black);
draw_set_font(fn_quiz);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_text(cx, cy - panel_h/2 + 40, 
    "Passing Score: 3                  Score: "+string(quiz_score)+"/"+string(total_questions)
);

// --- Draw question text ---
draw_set_color(c_black);
draw_set_font(fn_quiz);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_text(cx, cy - panel_h/2 + 80, question);

// --- ⚡ Draw ticket counts ---
draw_set_halign(fa_left);
draw_set_color(c_black);
draw_text(40, 40, "🎟 Tickets  ⚖️"+string(global.file_handling_data.justice_tickets)
           + "  🧠"+string(global.file_handling_data.wisdom_tickets)
           + "  🙇"+string(global.file_handling_data.humility_tickets));

// --- ⚡ Draw hint if revealed ---
if (!showing_result && variable_instance_exists(id, "hint_display_text") && hint_display_text != "") {
    draw_set_halign(fa_center);
    draw_set_color(c_black);
    draw_text(cx, start_y - 50, hint_display_text);
}

// --- ⚡ Draw hint instruction if not yet used ---
if (!showing_result && (!variable_instance_exists(id, "hint_revealed") || !hint_revealed)) {
    draw_set_halign(fa_center);
    draw_set_color(c_gray);
    draw_text(cx, cy - panel_h/2 + 120, "Press [H] to use 1 virtue ticket for a hint");
}

// --- Draw options ---
for (var i = 0; i < array_length(options); i++) {
    var opt_w = panel_w * 0.8;
    var opt_x = cx - opt_w * 0.5;
    var opt_y = start_y + i * (btn_height + btn_spacing);

    // Button background
    draw_sprite_stretched(spr_quiz_opt, 0, opt_x, opt_y, opt_w, btn_height);

    // Highlight selected option
    if (i == selected) {
        draw_set_alpha(0.4);
        draw_set_color(c_green);
        draw_rectangle(opt_x, opt_y, opt_x + opt_w, opt_y + btn_height, false);
        draw_set_alpha(1);
    }

    // Option text
    draw_set_color(c_black);
    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);
    draw_text(cx, opt_y + btn_height * 0.5, options[i]);
}

// --- Show result text ---
if (!showing_result) {
    draw_set_color(c_red);
    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);
    draw_text(cx, cy + panel_h/2, result_text);
}

// --- Draw submit button ---
draw_sprite_stretched(spr_quiz_submit, 0, submit_x, submit_y, submit_w, submit_h);

// Optional press visual feedback
if (submit_pressed) {
    draw_set_alpha(0.4);
    draw_set_color(c_white);
    draw_rectangle(submit_x, submit_y, submit_x + submit_w, submit_y + submit_h, false);
    draw_set_alpha(1);
}

// Submit button text
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_color(c_white);

var button_label = "Submit";
if (question_index + 1 < total_questions) button_label = "Next";

draw_text(submit_x + submit_w / 2, submit_y + submit_h / 2, button_label);

// --- Draw result sprite ---
if (showing_result && result_sprite != noone) {
    var result_scale = 1.5;
    var spr_w = sprite_get_width(result_sprite) * result_scale;
    var spr_h = sprite_get_height(result_sprite) * result_scale;

    var result_x = cx - spr_w / 2;
    var result_y = start_y - spr_h - 40;

    draw_sprite_stretched(result_sprite, 0, result_x, result_y, spr_w, spr_h);
}
