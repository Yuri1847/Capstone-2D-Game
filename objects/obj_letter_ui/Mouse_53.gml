/// obj_letter_ui Global Left Press
var mx = device_mouse_x_to_gui(0);
var my = device_mouse_y_to_gui(0);

// click on choices bounding boxes
for (var i=0; i<array_length(choice_bbox); i++) {
    var b = choice_bbox[i];
    if (mx >= b.x && mx <= b.x + b.w && my >= b.y && my <= b.y + b.h) {
        selected_choice = i;
        
        return;
    }
}

// click Confirm button
var conf_x = ui_x + ui_w - 180;
var conf_y = ui_y + ui_h - 72;
var conf_w = 160; var conf_h = 48;
if (mx >= conf_x && mx <= conf_x + conf_w && my >= conf_y && my <= conf_y + conf_h) {
    if (selected_choice >= 0) scr_letter_submit(self);
}
