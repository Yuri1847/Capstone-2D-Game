/// obj_ui_popup - Step
if (visible) {
    // decrement timer
    if (timer > 0) {
        timer -= 1;
        // when timer reaches fade threshold start fading
        if (timer <= fade_time) {
            alpha = clamp(timer / fade_time, 0, 1);
        } else {
            alpha = 1;
        }
    } else {
        // hidden once timer <= 0
        visible = false;
        alpha = 0;
    }
}
