function submit_quiz() {
    if (selected >= 0) {
        // Example: show result or start fade
        showing_result = true;
        result_timer = 60; // about 1 second at 60 FPS

        // Optional: sound or feedback
        //audio_play_sound(snd_submit, 1, false);
    }
}
