slider_width  = 286;
slider_height = sprite_get_height(spr_slider_bar);

//Background Music
//for mobile resolution
slider_bm_x = (display_get_width() / 2 - 320/2);
slider_bm_y = (display_get_height() / 2 - 232/2);

//for pc resolution
//slider_bm_x = (display_get_gui_width() / 2 - 320/2);
//slider_bm_y = (display_get_gui_height() / 2 - 47/2);

settings_load_game();

// value between 0 and 1
slider_bm_value = global.settings_data.audio.background_music_value;// start at 50%

// dragging
is_bm_dragging = false;

// apply starting volume if music is already playing
if (variable_global_exists("BM_id")) {
    audio_sound_gain(global.BM_id, slider_bm_value, 0);
}


//Sound Effect
slider_sfx_x = (slider_bm_x);
slider_sfx_y = (slider_bm_y+80);

// value between 0 and 1
slider_sfx_value = global.settings_data.audio.sound_effect_value;// start at 50%

// dragging
is_sfx_dragging = false;

isEnabled = false;



// obj_toggle_button - Create Event
// Position of the group of buttons (GUI space)
x_pos = slider_sfx_x;
y_pos = (slider_sfx_y+80);

// Each button's size
btn_w = 144;
btn_h = 36;

// Hover check
click_left  = false;
click_right = false;

if(!variable_global_exists("switchMovementControll")){
	global.switchMovementControll = true;
}

if(variable_global_exists("switchMovementControll") && variable_global_exists("settings_data")){
	settings_load_game()
	global.switchMovementControll = global.settings_data.Movement_Controller.switchMovementControll;
	toggle_state = global.settings_data.Movement_Controller.toggle_state;
}



