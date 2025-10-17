
if (visible) {
    var mx = device_mouse_x_to_gui(0);
    var my = device_mouse_y_to_gui(0);

    var sw = display_get_gui_width();
    var num_tabs = array_length(tab_titles);
    var tab_w = sw / num_tabs; // each tab same width

    for (var i = 0; i < num_tabs; i++) {
        var xq = i * tab_w;
        var yq = tab_y;

        if (mouse_check_button_pressed(mb_left) && point_in_rectangle(mx, my, xq, yq, xq + tab_w, yq + tab_h)) {
            current_tab = tab_keys[i];
        }
    }
}




// Toggle journal visibility with J key
if (keyboard_check_pressed(vk_space)) {
    global.journal_open = !global.journal_open;

    if (instance_exists(journal_controller_id)) {
        journal_controller_id.visible = global.journal_open;
    }
}


