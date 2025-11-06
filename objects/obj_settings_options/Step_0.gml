if(!isEnabled) exit;
//Background Music
var mx_bm = device_mouse_x_to_gui(0);
var my_bm = device_mouse_y_to_gui(0);

if (mouse_check_button_pressed(mb_left)) {
    // check if clicked near the slider icon
    var icon_bm_x = slider_bm_x + (slider_bm_value * slider_width);
    var icon_bm_y = slider_bm_y + slider_height/2;
	
	// check if clicked near the slider width
	var left_rec_bm_x = (slider_bm_value * slider_width);
	var right_rec_bm_x = slider_width - (slider_bm_value * slider_width);
	
    if (point_in_rectangle(mx_bm, my_bm, icon_bm_x-left_rec_bm_x, icon_bm_y-20, icon_bm_x+right_rec_bm_x, icon_bm_y+20)) {
        is_bm_dragging = true;
    }
}

if (mouse_check_button_released(mb_left)) {
    is_bm_dragging = false;
}

// dragging update
if (is_bm_dragging) {
    slider_bm_value = (mx_bm - slider_bm_x) / slider_width;
    slider_bm_value = clamp(slider_bm_value, 0, 1);
    
    if (global.BM_id != noone) {
        audio_sound_gain(global.BM_id, slider_bm_value, 0);
    }
	global.settings_data.audio.background_music_value = slider_bm_value;
	settings_save_game();
}

if (variable_global_exists("BM_id")) {
    audio_sound_gain(global.BM_id, slider_bm_value, 0);
}




//Sound Effect
var mx_sfx = device_mouse_x_to_gui(0);
var my_sfx = device_mouse_y_to_gui(0);

if (mouse_check_button_pressed(mb_left)) {
    // check if clicked near the slider icon
    var icon_sfx_x = slider_sfx_x + (slider_sfx_value * slider_width);
    var icon_sfx_y = slider_sfx_y + slider_height/2;
	
	// check if clicked near the slider width
	var left_rec_sfx_x = (slider_sfx_value * slider_width);
	var right_rec_sfx_x = slider_width - (slider_sfx_value * slider_width);
	
    if (point_in_rectangle(mx_sfx, my_sfx, icon_sfx_x-left_rec_sfx_x, icon_sfx_y-20, icon_sfx_x+right_rec_sfx_x, icon_sfx_y+20)) {
        is_sfx_dragging = true;
    }
}

if (mouse_check_button_released(mb_left)) {
    is_sfx_dragging = false;
}

// dragging update
if (is_sfx_dragging) {
    slider_sfx_value = (mx_sfx - slider_sfx_x) / slider_width;
    slider_sfx_value = clamp(slider_sfx_value, 0, 1);
	global.settings_data.audio.sound_effect_value = slider_sfx_value;
	settings_save_game();
}




// obj_toggle_button  Step Event
var mx = device_mouse_x_to_gui(0);
var my = device_mouse_y_to_gui(0);

// Calculate hover for left and right button
click_left  = (mx > x_pos && mx < x_pos + btn_w && my > y_pos && my < y_pos + btn_h);
click_right = (mx > x_pos + btn_w && mx < x_pos + btn_w * 2 && my > y_pos && my < y_pos + btn_h);

// Handle clicks
if (mouse_check_button_pressed(mb_left)) {
    if (click_left){  
		toggle_state = 1;
		global.switchMovementControll = true;
		
		global.settings_data.Movement_Controller.switchMovementControll = global.switchMovementControll;
		global.settings_data.Movement_Controller.toggle_state = toggle_state;
		settings_save_game()
	} else if (click_right){
		toggle_state = 0;
		global.switchMovementControll = false;
		
		global.settings_data.Movement_Controller.switchMovementControll = global.switchMovementControll;
		global.settings_data.Movement_Controller.toggle_state = toggle_state;
		settings_save_game()
	}
}

