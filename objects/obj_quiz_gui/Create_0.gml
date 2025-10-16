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
