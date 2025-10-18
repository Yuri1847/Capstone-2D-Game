if (show_logo) {
    draw_sprite(spr_splash_logo, 0, (display_get_width()/2 - 732/2), (display_get_height()/2 - 560/2));
} else {
    // black screen
    draw_clear(c_black);
}