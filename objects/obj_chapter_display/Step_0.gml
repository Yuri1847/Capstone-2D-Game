switch (state) {
    case 0: // Fade in
        alpha += 0.04;
        if (alpha >= 1) {
            alpha = 1;
            state = 1;
        }
    break;

    case 1: // Hold
        timer -= 1;
        if (timer <= 0) state = 2;
    break;

    case 2: // Fade out
        alpha -= 0.02;
        if (alpha <= 0) instance_destroy();
    break;
}
