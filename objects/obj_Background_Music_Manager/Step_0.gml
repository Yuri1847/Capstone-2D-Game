// Wait for slider to exist and have its value ready
if (!volume_ready) {
    if (instance_exists(obj_settings_options)) {
        if (variable_instance_exists(obj_settings_options, "slider_bm_value")) {
            var vol = obj_settings_options.slider_bm_value;
            audio_sound_gain(global.BM_id, vol, 0);
            volume_ready = true;
        }
    } else if (variable_global_exists("settings_data")) {
        // fallback if no slider in this room
        var vol = global.settings_data.audio.background_music_value;
        audio_sound_gain(global.BM_id, vol, 0);
        volume_ready = true;
    }
}

// Handle fading between BGMs
if (is_fading_out) {
    if (variable_global_exists("BM_id")) {
        var current_gain = audio_sound_get_gain(global.BM_id);
        current_gain -= fade_speed;
        audio_sound_gain(global.BM_id, max(current_gain, 0), 0);

        // Make sure we remember which BGM we're fading from
        // (prevents re-triggering sc_set_bgm with wrong state)
        if (target_bgm != current_bgm) {
            current_bgm = target_bgm; // pre-update here
        }

        // Once faded out completely
        if (current_gain <= 0) {
            audio_stop_sound(global.BM_id);

            // Play the target BGM
            global.BM_id = audio_play_sound(target_bgm, 0, true);

            // Fade in from 0 to current slider value
            audio_sound_gain(global.BM_id, 0, 0);
            is_fading_out = false;
        }
    }
}

// Gradually fade in (optional)
if (!is_fading_out && variable_global_exists("BM_id")) {
    var cur_gain = audio_sound_get_gain(global.BM_id);
    var target_gain = instance_exists(obj_settings_options) ? obj_settings_options.slider_bm_value : 1;
    if (cur_gain < target_gain) {
        audio_sound_gain(global.BM_id, min(cur_gain + 0.02, target_gain), 0);
    }
}