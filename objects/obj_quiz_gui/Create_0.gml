


/// @description Initialize quiz GUI
visible = false; // hidden until function is called

question = "";
options = [];
correct_index = -1;
selected = -1;

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

quiz_score = 0;


// --- Submit button setup ---
var spr_w = sprite_get_width(spr_quiz_submit);
var spr_h = sprite_get_height(spr_quiz_submit);

// Make button larger — double width and slightly taller
submit_w = spr_w * 2;
submit_h = spr_h * 1.2;

// Bottom-right corner positioning
submit_x = display_get_gui_width() - submit_w - 64; // 20px margin from right
submit_y = display_get_gui_height() - submit_h - 64; // 20px margin from bottom
submit_press_timer = 0;
submit_pressed = false;

//result 
result_sprite = noone;





submit_pressed = false;

// ✅ NEW: for hints
virtue = "";
hint_text = "";
hint_revealed = false;
hint_button_y = start_y + (btn_height + btn_spacing) * 3 + 60; // position below options
// --- Close button pressed flag ---
close_pressed = false;

// --- Close button setup ---
close_w = 120;
close_h = 48;
close_x = gui_w - close_w - 40; // top-right corner, 40px from edge
close_y = 40;


hint_pressed = false;


hint_display_text = "";

summary_visible = false;
continue_pressed = false;

