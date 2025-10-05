/*if (!variable_global_exists("BM_id")) {
    global.BM_id = audio_play_sound(sd_background_music, 0, true);
    
    // Check if slider exists and has a value
    if (instance_exists(obj_slider_bar)) {
        audio_sound_gain(global.BM_id, obj_slider_bar.slider_bm_value, 0);
    }
}*/

//Place it inside a object button click event
/*var sfx_id = audio_play_sound(sd_sound_effect, 1, false);

// apply slider’s volume immediately
if (instance_exists(obj_slider_bar)) {
    audio_sound_gain(sfx_id, obj_slider_bar.slider_sfx_value, 0);
}

// random pitch
audio_sound_pitch(sfx_id, random_range(0.95, 1.05));*/