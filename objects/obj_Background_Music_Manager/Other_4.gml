if (!variable_global_exists("BM_id")) {
    global.BM_id = audio_play_sound(snd_background_music, 0, true);
    
    // Check if slider exists and has a value
    if (instance_exists(obj_slider_bar)) {
        audio_sound_gain(global.BM_id, obj_slider_bar.slider_bm_value, 0);
    }
}