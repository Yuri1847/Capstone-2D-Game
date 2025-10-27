/// obj_letter_ui - Create Event

// Get GUI camera area
var area = scr_get_camera_gui_area();
x = area.x;
y = area.y;
w = area.w;
h = area.h;

// Reference to the dialogue (set from scr_letter_system)
dialog_ref = noone;


// Create close button area
close_w = 160;
close_h = 64;
close_x = x + w - close_w - 32;
close_y = y + h - close_h - 32;
