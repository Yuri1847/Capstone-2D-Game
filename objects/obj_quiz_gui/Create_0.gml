/// @description Initialize quiz GUI
visible = false; // hidden until function is called

// --- Basic quiz data ---
question = "";
options = [];
correct_index = -1;
selected = -1;
quiz_score = 0;

// --- Result display ---
showing_result = false;
result_text = "";
result_timer = 0;
result_sprite = noone;

// --- Layout setup ---
gui_w = display_get_gui_width();
gui_h = display_get_gui_height();

panel_w = gui_w * 0.8;
panel_h = gui_h * 0.6;

cx = gui_w * 0.5;
cy = gui_h * 0.5;

btn_height = 60;
btn_spacing = 20;
start_y = cy - (panel_h * 0.5) + 150;

// --- Submit button setup ---
var spr_w = sprite_get_width(spr_quiz_submit);
var spr_h = sprite_get_height(spr_quiz_submit);

// Make button larger — double width and slightly taller
submit_w = spr_w * 2;
submit_h = spr_h * 1.2;

// Bottom-right corner positioning
submit_x = gui_w - submit_w - 64;
submit_y = gui_h - submit_h - 64;

submit_press_timer = 0;
submit_pressed = false;

// --- Close button setup ---
close_w = 120;
close_h = 48;
close_x = gui_w - close_w - 40; // top-right corner
close_y = 40;
close_pressed = false;

// --- Hint system ---
virtue = "";
hint_text = "";
hint_revealed = false;
hint_pressed = false;
hint_display_text = "";
hint_button_y = start_y + (btn_height + btn_spacing) * 3 + 60;

// --- Summary state ---
summary_visible = false;
continue_pressed = false;

// ==================================================================
// ✅ NEW: SAFE INITIALIZATION to avoid "quiz_data not set" errors
// ==================================================================
if (!variable_instance_exists(id, "quiz_data")) {
    quiz_data = [];
}
question_index = 0;
total_questions = 0;

// Track current virtue for Draw GUI
current_virtue = "unknown";

// ==================================================================
// ✅ Optional: Initialize warp/quiz globals to ensure clean state
// ==================================================================
if (!variable_global_exists("quiz_active")) global.quiz_active = false;
if (!variable_global_exists("quiz_pending_warp")) global.quiz_pending_warp = false;
