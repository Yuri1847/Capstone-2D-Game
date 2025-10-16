var max_fingers = 5; // GameMaker supports up to 5 simultaneous touches

for (var i = 0; i < max_fingers; i++) {
    if (device_mouse_check_button(i, mb_left)) {
        
        // Convert touch coordinates to GUI layer
        var tx = device_mouse_x_to_gui(i);
        var ty = device_mouse_y_to_gui(i);
        
        // If touch is inside this button
        if (point_in_rectangle(tx, ty, x, y, x + sprite_width, y + sprite_height)) {
			//Place it inside a object button click event
			var sfx_id = audio_play_sound(snd_button_clicked, 1, false);
			// apply slider’s volume immediately
			if (instance_exists(obj_slider_bar)) {
			    audio_sound_gain(sfx_id, obj_slider_bar.slider_sfx_value, 0);
			}
			// random pitch
			audio_sound_pitch(sfx_id, random_range(0.95, 1.05));
			
			clickButton();
        }
    }
}	