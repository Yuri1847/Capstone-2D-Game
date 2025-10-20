switch (state) {
    case "fade_in":
        alpha += fade_speed;
        if (alpha >= 1) { alpha = 1; state = "hold"; }
        break;

    case "hold":
        timer++;
        if (timer >= hold_time) state = "fade_out";
        break;

    case "fade_out":
        alpha -= fade_speed;
        if (alpha <= 0) instance_destroy();
        break;
}
