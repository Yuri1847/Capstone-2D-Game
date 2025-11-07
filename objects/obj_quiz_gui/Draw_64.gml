/// DRAW GUI EVENT
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
draw_sprite_stretched(spr_quiz_bg, 0, gui_x, gui_y, gui_w, gui_h);

// ================================================================
// === TOP HUD: HINT BUTTON + SCORE ===
draw_set_font(fn_quiz);
draw_set_valign(fa_middle);

// --- Hint Button (TOP-LEFT) ---
var hint_w = 160;
var hint_h = 48;
var hint_x = gui_x + 80;
var hint_y = gui_y + 80;

// Dynamic color based on virtue
var hint_col = c_yellow;
var hint_label = "";
switch (current_virtue) {
    case "justice":
        hint_col = make_color_rgb(255, 215, 0); // gold
        hint_label = "⚖️ Hints: " + string(global.file_handling_data.justice_tickets);
        break;
    case "wisdom":
        hint_col = make_color_rgb(100, 149, 237); // blue
        hint_label = "🧠 Hints: " + string(global.file_handling_data.wisdom_tickets);
        break;
    case "humility":
        hint_col = make_color_rgb(144, 238, 144); // green
        hint_label = "🙇 Hints: " + string(global.file_handling_data.humility_tickets);
        break;
    default:
        hint_label = "🧩 Hints: ?";
        break;
}

// Button background
draw_set_color(hint_col);
draw_rectangle(hint_x, hint_y, hint_x + hint_w, hint_y + hint_h, false);

// Pressed highlight
if (hint_pressed) {
    draw_set_alpha(0.4);
    draw_set_color(c_white);
    draw_rectangle(hint_x, hint_y, hint_x + hint_w, hint_y + hint_h, false);
    draw_set_alpha(1);
}

// Hint text
draw_set_color(c_black);
draw_set_halign(fa_center);
draw_text(hint_x + hint_w * 0.5, hint_y + hint_h * 0.5, hint_label);

// --- Score text (TOP-RIGHT) ---
draw_set_halign(fa_right);
draw_set_valign(fa_top);
draw_set_color(c_black);
draw_text(gui_x + gui_w - 80, gui_y + 88,
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

    draw_sprite_stretched(spr_quiz_opt, 0 ,opt_x, opt_y, opt_w, btn_height);

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
    draw_sprite(result_sprite, 0, result_x, result_y);
}

// ================================================================
// === RESULT TEXT (below options) ===
if (!showing_result) {
    draw_set_color(c_red);
    draw_set_halign(fa_center);
    draw_text(cx, cy + area.h * 0.25, result_text);
}

// ================================================================
// === SUBMIT / NEXT BUTTON ===
var submit_w = opt_w * 0.2;
var submit_h = btn_height;
var submit_x = cx - submit_w * 0.5;
var submit_y = last_opt_y + btn_height + btn_spacing * 2;

draw_sprite_stretched(spr_quiz_submit, 0, submit_x, submit_y, submit_w, submit_h);
if (submit_pressed) {
    draw_set_alpha(0.4);
    draw_set_color(c_white);
    draw_sprite_stretched(spr_quiz_submit, 0, submit_x, submit_y, submit_w, submit_h);
    draw_set_alpha(1);
}

draw_set_color(c_white);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
var button_label = (question_index + 1 < total_questions) ? "Next" : "Submit";
draw_text(submit_x + submit_w * 0.5, submit_y + submit_h * 0.5, button_label);

// ================================================================
// === SUMMARY SCREEN ===
if (summary_visible) {
    draw_sprite_stretched(spr_quiz_bg, 0, gui_x, gui_y, gui_w, gui_h);

    draw_set_color(c_black);
    draw_set_font(fn_quiz);
    draw_set_halign(fa_center);
    draw_set_valign(fa_top);

    var chap_no = global.chapter_number;
    var chap_title = string(global.chapter_title);
    var chap_summary = string(global.chapter_summary);

    var y_offset = gui_y + 60;
    draw_text(cx, y_offset, "Chapter " + string(chap_no) + ": " + chap_title);
    y_offset += 40;
    draw_text(cx, y_offset, "Quiz Summary");

    var summary_wrap_width = gui_w * 0.8;
    y_offset += 40;
    draw_text_wrap(cx, y_offset, chap_summary, summary_wrap_width);

    var lines = string_count("\n", string_wrap(chap_summary, summary_wrap_width)) + 1;
    var summary_height = lines * 26;
    y_offset += summary_height + 40;

    var remark = "";
    if (quiz_score == total_questions) remark = "Perfect! Excellent work!";
    else if (quiz_score >= 3) remark = "Good job! You passed!";
    else remark = "You didn’t pass. Try again!";

    draw_text(cx, y_offset, "Your Score: " + string(quiz_score) + " / " + string(total_questions));
    y_offset += 40;
    draw_text(cx, y_offset, remark);

    draw_set_color(c_dkgray);
    draw_set_font(fn_quiz);
    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);
    draw_text(cx, gui_y + gui_h - 60, "Tap to continue");
}
