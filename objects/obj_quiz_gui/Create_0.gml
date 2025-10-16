/// @description Initialize quiz GUI
visible = false; // hidden until function is called

question = "";
options = [];
correct_index = -1;
selected = -1;
/*
btn_height = 60;
btn_spacing = 15;

font_size = 28;
panel_w = 800;
panel_h = 400;
*/
// new variables to avoid undefined errors
showing_result = false;
result_text = "";
result_timer = 0;

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

selected = -1;
showing_result = false;


// --- Submit button setup ---
var spr_w = sprite_get_width(spr_quiz_submit);
var spr_h = sprite_get_height(spr_quiz_submit);

// Make button larger — double width and slightly taller
submit_w = spr_w * 2;
submit_h = spr_h * 1.2;

// Bottom-right corner positioning
submit_x = display_get_gui_width() - submit_w - 64; // 20px margin from right
submit_y = display_get_gui_height() - submit_h - 64; // 20px margin from bottom

submit_pressed = false;

