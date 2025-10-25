/// Step Event
// Get GUI area (so it scales with camera)
var area = scr_get_camera_gui_area();
var gui_w = area.w;
var gui_h = area.h;

var btn_x = gui_w * 0.5 - btn_w * 0.5;
var btn_y = gui_h * 0.6;

btn_hover = point_in_rectangle(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), btn_x, btn_y, btn_x + btn_w, btn_y + btn_h);

// Detect click
if (btn_hover && device_mouse_check_button_pressed(0, mb_left)) {
    
    // ✅ Tell the dialogue that the popup action is done
    if (instance_exists(dialog_ref)) {
        scr_dialogue_action_complete(dialog_ref);
    }

    // ✅ Destroy popup (close the GUI)
    instance_destroy();
}
