// Timeline intro setup
timeline_done = false;
alpha = 0;
fade_speed = 0.05;

// Create the timeline card centered on GUI
var gui_w = display_get_gui_width();
var gui_h = display_get_gui_height();
timeline_card = instance_create_layer(gui_w / 2, gui_h / 2, "UI", obj_timeline_card);
timeline_card.image_alpha = 0;

show_debug_message("Challenge Timeline started.");
