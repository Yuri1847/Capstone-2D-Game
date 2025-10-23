current_bgm = snd_main_music; // default at start (main menu)
target_bgm = current_bgm;
fade_speed = 0.02; // fade speed per step (adjust to taste)
is_fading_out = false;

// Play default music only if not already playing
if (!variable_global_exists("BM_id")) {
    global.BM_id = audio_play_sound(current_bgm, 0, true);
}

// Don’t set volume yet — wait until Step Event
audio_sound_gain(global.BM_id, 1, 0); // temporary full volume
volume_ready = false; // flag to wait for slider