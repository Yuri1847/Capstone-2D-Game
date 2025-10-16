function sc_set_bgm(new_bgm) {
    // If no music is playing, start immediately
    if (!variable_global_exists("BM_id") || global.BM_id == noone) {
        global.BM_id = audio_play_sound(new_bgm, 0, true);
        audio_sound_gain(global.BM_id, 0, 0);
        current_bgm = new_bgm;
        return;
    }

    // If the new music is different from the currently playing one
    if (new_bgm != current_bgm) {
        target_bgm = new_bgm;
        is_fading_out = true;
    }
}