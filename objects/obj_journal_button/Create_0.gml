//base layout for ui
// --- Create Event ---
var cam = view_camera[0];
var cam_w = camera_get_view_width(cam);
var cam_h = camera_get_view_height(cam);

// Get GUI size (for scaling if needed)
var gui_w = display_get_gui_width();
var gui_h = display_get_gui_height();

// Find how GUI scales relative to visible camera
var scale_x = gui_w / cam_w;
var scale_y = gui_h / cam_h;

// Setup
button_margin = 32;
button_size = sprite_get_width(spr_journal_button);
hovered = false;

// ✅ Position using camera size, scaled to GUI space
button_x = (cam_w - button_size - button_margin) * scale_x;
button_y = button_margin * scale_y;



// Find the journal controller
journal_controller_id = instance_find(obj_journal_controller, 0);

// Make sure journal starts hidden
if (instance_exists(journal_controller_id)) {
    with (journal_controller_id) visible = false;
}
global.journal_open = false;

