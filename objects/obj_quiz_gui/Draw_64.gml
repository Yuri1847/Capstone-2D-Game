if (!visible) exit;

// --- Background ---
draw_set_color(make_color_rgb(240, 240, 240));
draw_rectangle(0, 0, gui_w, gui_h, false);

// --- Score & question info ---
draw_set_color(c_black);
draw_set_font(fn_quiz);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_text(cx, cy - panel_h / 2 + 40,
    "Passing Score: 3                  Score: " + string(quiz_score) + "/" + string(total_questions)
);

// --- Question text ---
draw_set_color(c_black);
draw_set_font(fn_quiz);
draw_text(cx, cy - panel_h / 2 + 80, question);

// --- Tickets ---
draw_set_halign(fa_left);
draw_set_color(c_black);
draw_text(40, 40, "🎟 Tickets  ⚖️" + string(global.file_handling_data.justice_tickets)
    + "  🧠" + string(global.file_handling_data.wisdom_tickets)
    + "  🙇" + string(global.file_handling_data.humility_tickets));

// --- Hint display ---
if (!showing_result && variable_instance_exists(id, "hint_display_text") && hint_display_text != "") {
    draw_set_halign(fa_center);
    draw_set_color(c_black);
    draw_text(cx, start_y - 50, hint_display_text);
}

// --- Hint instruction ---
if (!showing_result && (!variable_instance_exists(id, "hint_revealed") || !hint_revealed)) {
    draw_set_halign(fa_center);
    draw_set_color(c_gray);
    draw_text(cx, cy - panel_h / 2 + 120, "Press [H] to use 1 virtue ticket for a hint");
}

// --- Options ---
for (var i = 0; i < array_length(options); i++) {
    var opt_w = panel_w * 0.8;
    var opt_x = cx - opt_w * 0.5;
    var opt_y = start_y + i * (btn_height + btn_spacing);

    draw_set_color(make_color_rgb(255, 255, 255));
    draw_rectangle(opt_x, opt_y, opt_x + opt_w, opt_y + btn_height, false);
    draw_set_color(c_black);
    draw_rectangle(opt_x, opt_y, opt_x + opt_w, opt_y + btn_height, true);

    if (i == selected) {
        draw_set_alpha(0.4);
        draw_set_color(c_green);
        draw_rectangle(opt_x, opt_y, opt_x + opt_w, opt_y + btn_height, false);
        draw_set_alpha(1);
    }

    draw_set_color(c_black);
    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);
    draw_text(cx, opt_y + btn_height * 0.5, options[i]);
}

// --- Show result text ---
if (!showing_result) {
    draw_set_color(c_red);
    draw_set_halign(fa_center);
    draw_text(cx, cy + panel_h / 2, result_text);
}

// --- Submit button ---
draw_set_color(make_color_rgb(30, 144, 255));
draw_rectangle(submit_x, submit_y, submit_x + submit_w, submit_y + submit_h, false);

if (submit_pressed) {
    draw_set_alpha(0.4);
    draw_set_color(c_white);
    draw_rectangle(submit_x, submit_y, submit_x + submit_w, submit_y + submit_h, false);
    draw_set_alpha(1);
}

draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_color(c_white);

var button_label = "Submit";
if (question_index + 1 < total_questions) button_label = "Next";
draw_text(submit_x + submit_w / 2, submit_y + submit_h / 2, button_label);

// --- ⚡ NEW: Draw Close button ---
close_w = 120;
close_h = 48;
close_x = submit_x - close_w - 20;
close_y = submit_y;

draw_set_color(make_color_rgb(220, 53, 69)); // red
draw_rectangle(close_x, close_y, close_x + close_w, close_y + close_h, false);

if (close_pressed) {
    draw_set_alpha(0.4);
    draw_set_color(c_white);
    draw_rectangle(close_x, close_y, close_x + close_w, close_y + close_h, false);
    draw_set_alpha(1);
}

draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_color(c_white);
draw_text(close_x + close_w / 2, close_y + close_h / 2, "Close");

// --- Result feedback icon ---
if (showing_result && result_sprite != noone) {
    var box_w = 150;
    var box_h = 150;
    var result_x = cx - box_w / 2;
    var result_y = start_y - box_h - 40;

    if (result_sprite == spr_quiz_correct) draw_set_color(c_green);
    else if (result_sprite == spr_quiz_wrong) draw_set_color(c_red);
    else draw_set_color(c_yellow);

    draw_rectangle(result_x, result_y, result_x + box_w, result_y + box_h, false);
}
