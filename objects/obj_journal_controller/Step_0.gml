
if (visible) {
    var mx = device_mouse_x_to_gui(0);
    var my = device_mouse_y_to_gui(0);

    var sw = display_get_gui_width();
	var sh = display_get_gui_height();
    var num_tabs = array_length(tab_titles);
    var tab_w = sw / num_tabs; // each tab same width
	
	

    for (var i = 0; i < num_tabs; i++) {
        var xq = i * tab_w;
        var yq = tab_y;

        if (mouse_check_button_pressed(mb_left) && point_in_rectangle(mx, my, xq, yq, xq + tab_w, yq + tab_h)) {
            current_tab = tab_keys[i];
        }
    }
	
	

 

	//back button
    var back_x = back_margin;
    var back_y = sh - back_h - back_margin;

    // Check click on Back
    if (mouse_check_button_pressed(mb_left)) {
        if (point_in_rectangle(mx, my, back_x, back_y, back_x + back_w, back_y + back_h)) {
            // Close the journal
            visible = false;
			with (obj_joystick_base) enabledJOY = true; // disables
			sc_visible_layer(["right_option_layer", "pause_button_layer"]);
            global.journal_open = false;
        }
    }
}



/*
// Toggle journal visibility with J key
if (keyboard_check_pressed(vk_space)) {
    global.journal_open = !global.journal_open;

    if (instance_exists(journal_controller_id)) {
        journal_controller_id.visible = global.journal_open;
    }
}*/


