/// @description Handle fading logic

// Fade out
if (fading_out) {
    fade_alpha += fade_speed;
    if (fade_alpha >= 1) {
        fade_alpha = 1;
        fading_out = false;

        // When fully faded, go to the next room
        if (next_room != noone) {
            room_goto(next_room);
            fading_in = true; // start fade-in after change

            
        }
    }
}
// Fade in
else if (fading_in) {
    fade_alpha -= fade_speed;
    if (fade_alpha <= 0) {
        fade_alpha = 0;
        fading_in = false;
    }
}

