popup_text = "Objective Complete";
alpha = 0;
clicked = false;

// Animation control
width_scale = 0;           // Start collapsed (0 = no width)
target_width_scale = 1;    // Fully expanded
transition_speed = 0.1;

// GUI position
var area = scr_get_camera_gui_area();
x = area.x + (area.w * 0.5);
y = area.y + (area.h * 0.5);
