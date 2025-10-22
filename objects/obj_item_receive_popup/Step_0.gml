/// Step Event
switch (state) {
    case "fade_in":
        alpha += fade_speed;
        if (alpha >= 1) {
            alpha = 1;
            state = "showing";
        }
        break;

    case "showing":
        display_time--;
        if (display_time <= 0) {
            state = "fade_out";
        }
        break;

    case "fade_out":
        alpha -= fade_speed;
        if (alpha <= 0) {
            instance_destroy();
        }
        break;
}