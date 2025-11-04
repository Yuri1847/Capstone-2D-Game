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
//draw_rectangle(gui_x, gui_y, gui_x + gui_w, gui_y + gui_h, false);
draw_sprite_stretched(spr_quiz_bg, 0, gui_x, gui_y, gui_w, gui_h)

// ================================================================
// === TOP HUD: HINT BUTTON + SCORE ===
draw_set_font(fn_quiz);
draw_set_valign(fa_middle);

// --- Hint Button (TOP-LEFT) ---
hint_w = 160;
hint_h = 48;
hint_x = gui_x + 80;
hint_y = gui_y + 80;

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

	/*
    // Background
    draw_set_color(c_white);
    draw_rectangle(opt_x, opt_y, opt_x + opt_w, opt_y + btn_height, false);

    // Border
    draw_set_color(c_black);
    draw_rectangle(opt_x, opt_y, opt_x + opt_w, opt_y + btn_height, true);
	*/
	
	//sprite button
	draw_sprite_stretched(spr_quiz_opt, 0 ,opt_x, opt_y, opt_w,btn_height)

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

    //if (result_sprite == spr_quiz_correct) draw_set_color(c_green);
	if (result_sprite == spr_quiz_correct) draw_sprite(result_sprite, 0 ,result_x,result_y);
    //else if (result_sprite == spr_quiz_wrong) draw_set_color(c_red);
	else if (result_sprite == spr_quiz_wrong) draw_sprite(result_sprite, 0 ,result_x,result_y);
    else draw_set_color(c_yellow);

    //draw_rectangle(result_x, result_y, result_x + box_w, result_y + box_h, false);
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
submit_w = opt_w * 0.2;
submit_h = btn_height;
submit_x = cx - submit_w * 0.5;
submit_y = last_opt_y + btn_height + btn_spacing * 2;

//draw_set_color(make_color_rgb(30, 144, 255));
//draw_rectangle(submit_x, submit_y, submit_x + submit_w, submit_y + submit_h, false);

//sprite button
draw_sprite_stretched(spr_quiz_submit, 0, submit_x, submit_y, submit_w, submit_h);

if (submit_pressed) {
    draw_set_alpha(0.4);
    draw_set_color(c_white);
    //draw_rectangle(submit_x, submit_y, submit_x + submit_w, submit_y + submit_h, false);
	draw_sprite_stretched(spr_quiz_submit, 0, submit_x, submit_y, submit_w, submit_h);
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
close_x = gui_x + gui_w - close_w - 80;
close_y = gui_y + gui_h - close_h - 80;

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

// ================================================================
// ================================================================
// === SUMMARY SCREEN ===
if (summary_visible) {
    draw_set_color(make_color_rgb(240, 240, 240));
    draw_rectangle(gui_x, gui_y, gui_x + gui_w, gui_y + gui_h, false);

    draw_set_color(c_black);
    draw_set_font(fn_quiz);
    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);

    // 🟦 Chapter info (fetched from obj_controller)
    var chap_no = global.chapter_number;
    var chap_title = string(global.chapter_title);
    var chap_summary = string(global.chapter_summary);

    // === Header Section ===
    draw_text(cx, cy - 220, "Chapter " + string(chap_no) + ": " + chap_title);
    draw_text(cx, cy - 180, "Quiz Summary");

    // === Chapter Description ===
    draw_set_font(fnt_global_extraBoldDisplay); // optional smaller font if you have one
    draw_text_wrap(cx, cy - 130, chap_summary, gui_w * 0.8);

    // === Quiz Score and Remarks ===
    draw_set_font(fn_quiz);
    draw_text(cx, cy - 40, "Your Score: " + string(quiz_score) + " / " + string(total_questions));

    var remark = "";
    if (quiz_score == total_questions) remark = "Perfect! Excellent work!";
    else if (quiz_score >= 3) remark = "Good job! You passed!";
    else remark = "You didn’t pass. Try again!";
    draw_text(cx, cy + 20, remark);

    // === Continue Button ===
    var cont_w = 240;
    var cont_h = 60;
    var cont_x = cx - cont_w * 0.5;
    var cont_y = cy + 120;

    draw_set_color(make_color_rgb(30, 144, 255));
    draw_rectangle(cont_x, cont_y, cont_x + cont_w, cont_y + cont_h, false);

    if (continue_pressed) {
        draw_set_alpha(0.4);
        draw_set_color(c_white);
        draw_rectangle(cont_x, cont_y, cont_x + cont_w, cont_y + cont_h, false);
        draw_set_alpha(1);
    }

    draw_set_color(c_white);
    draw_text(cx, cont_y + cont_h * 0.5, "Continue");
}
