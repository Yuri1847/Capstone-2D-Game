if (!visible) exit;

// ================================================================
// === CAMERA GUI AREA ===
var area = scr_get_camera_gui_area();
var gui_x = area.x;
var gui_y = area.y;
var gui_w = area.w;
var gui_h = area.h;

var cx = gui_x + gui_w * 0.5;
var cy = gui_y + gui_h * 0.5;

// ================================================================
// === BACKGROUND ===
draw_set_color(make_color_rgb(240, 240, 240));
draw_rectangle(gui_x, gui_y, gui_x + gui_w, gui_y + gui_h, false);

// ================================================================
// === TOP HUD: HINT BUTTON + SCORE ===
draw_set_font(fn_quiz);
draw_set_valign(fa_middle);

// --- Hint Button (TOP-LEFT) ---
hint_w = 160;
hint_h = 48;
hint_x = gui_x + 40;
hint_y = gui_y + 40;

// Button background
draw_set_color(make_color_rgb(255, 193, 7)); // yellow
draw_rectangle(hint_x, hint_y, hint_x + hint_w, hint_y + hint_h, false);

// Pressed highlight
if (hint_pressed) {
    draw_set_alpha(0.4);
    draw_set_color(c_white);
    draw_rectangle(hint_x, hint_y, hint_x + hint_w, hint_y + hint_h, false);
    draw_set_alpha(1);
}

// Text inside button (shows all ticket counts)
draw_set_color(c_black);
draw_set_halign(fa_center);
draw_text(
    hint_x + hint_w * 0.5,
    hint_y + hint_h * 0.5,
    "🧠 Hint  ⚖️" + string(global.file_handling_data.justice_tickets)
    + "  🧠" + string(global.file_handling_data.wisdom_tickets)
    + "  🙇" + string(global.file_handling_data.humility_tickets)
);

// --- Score text (TOP-RIGHT) ---
draw_set_halign(fa_right);
draw_set_valign(fa_top);
draw_set_color(c_black);
draw_text(gui_x + gui_w - 40, gui_y + 48,
    "Passing: 3    Score: " + string(quiz_score) + "/" + string(total_questions)
);

// ================================================================
// === QUESTION AREA ===
draw_set_color(c_black);
draw_set_font(fn_quiz);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);

var question_y = cy - area.h * 0.25;
draw_text(cx, question_y, question);

// ================================================================
// === HINT DISPLAY ===
if (!showing_result && hint_display_text != "") {
    draw_set_color(c_black);
    draw_text(cx, question_y + 50, hint_display_text);
}

// ================================================================
// === OPTIONS ===
var opt_w = gui_w * 0.8;
var opt_x = cx - opt_w * 0.5;
var opt_start_y = cy - gui_h * 0.05;
var last_opt_y = 0;

for (var i = 0; i < array_length(options); i++) {
    var opt_y = opt_start_y + i * (btn_height + btn_spacing);
    last_opt_y = opt_y;

    // Background
    draw_set_color(c_white);
    draw_rectangle(opt_x, opt_y, opt_x + opt_w, opt_y + btn_height, false);

    // Border
    draw_set_color(c_black);
    draw_rectangle(opt_x, opt_y, opt_x + opt_w, opt_y + btn_height, true);

    // Selected highlight
    if (i == selected) {
        draw_set_alpha(0.4);
        draw_set_color(c_green);
        draw_rectangle(opt_x, opt_y, opt_x + opt_w, opt_y + btn_height, false);
        draw_set_alpha(1);
    }

    // Option text
    draw_set_color(c_black);
    draw_text(cx, opt_y + btn_height * 0.5, options[i]);
}

// ================================================================
// === RESULT FEEDBACK ===
if (showing_result && result_sprite != noone) {
    var box_w = 150;
    var box_h = 150;
    var result_x = cx - box_w / 2;
    var result_y = cy - area.h * 0.35;

    if (result_sprite == spr_quiz_correct) draw_set_color(c_green);
    else if (result_sprite == spr_quiz_wrong) draw_set_color(c_red);
    else draw_set_color(c_yellow);

    draw_rectangle(result_x, result_y, result_x + box_w, result_y + box_h, false);
}

// ================================================================
// === RESULT TEXT (below options) ===
if (!showing_result) {
    draw_set_color(c_red);
    draw_set_halign(fa_center);
    draw_text(cx, cy + area.h * 0.25, result_text);
}

// ================================================================
// === SUBMIT / NEXT BUTTON (aligned with choices) ===
submit_w = opt_w * 0.6;
submit_h = btn_height;
submit_x = cx - submit_w * 0.5;
submit_y = last_opt_y + btn_height + btn_spacing * 2;

draw_set_color(make_color_rgb(30, 144, 255));
draw_rectangle(submit_x, submit_y, submit_x + submit_w, submit_y + submit_h, false);

if (submit_pressed) {
    draw_set_alpha(0.4);
    draw_set_color(c_white);
    draw_rectangle(submit_x, submit_y, submit_x + submit_w, submit_y + submit_h, false);
    draw_set_alpha(1);
}

draw_set_color(c_white);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
var button_label = (question_index + 1 < total_questions) ? "Next" : "Submit";
draw_text(submit_x + submit_w * 0.5, submit_y + submit_h * 0.5, button_label);

// ================================================================
// === CLOSE BUTTON (BOTTOM-RIGHT) ===
close_w = 120;
close_h = 48;
close_x = gui_x + gui_w - close_w - 40;
close_y = gui_y + gui_h - close_h - 40;

draw_set_color(make_color_rgb(220, 53, 69));
draw_rectangle(close_x, close_y, close_x + close_w, close_y + close_h, false);

if (close_pressed) {
    draw_set_alpha(0.4);
    draw_set_color(c_white);
    draw_rectangle(close_x, close_y, close_x + close_w, close_y + close_h, false);
    draw_set_alpha(1);
}

draw_set_color(c_white);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_text(close_x + close_w * 0.5, close_y + close_h * 0.5, "Close");
