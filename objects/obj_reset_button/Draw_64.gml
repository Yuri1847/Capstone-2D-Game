/// @description Draw Reset Game button (retro style)

//draw_set_font(fnt); // use your retro font
draw_set_halign(fa_center);
draw_set_valign(fa_middle);

// Button base
draw_set_alpha(1);
draw_set_color(hovered ? c_red : c_dkgray);
draw_rectangle(btn_x - btn_w/2, btn_y - btn_h/2, btn_x + btn_w/2, btn_y + btn_h/2, false);

// Text
draw_set_color(c_white);
draw_text(btn_x, btn_y, "RESET GAME");

// --- Confirmation popup ---
if (confirm_reset) {
    fade_alpha = clamp(fade_alpha + 0.05, 0, 1);

    var gui_w = display_get_gui_width();
    var gui_h = display_get_gui_height();

    // Dim background
    draw_set_alpha(0.6 * fade_alpha);
    draw_set_color(c_black);
    draw_rectangle(0, 0, gui_w, gui_h, false);

    // Popup panel
    draw_set_alpha(1 * fade_alpha);
    draw_set_color(make_color_rgb(50, 50, 50));
    draw_rectangle(gui_w * 0.3, gui_h * 0.4, gui_w * 0.7, gui_h * 0.6, false);

    draw_set_color(c_white);
    draw_text(gui_w * 0.5, gui_h * 0.45, "Are you sure?");
    draw_text(gui_w * 0.5, gui_h * 0.52, "[Y] Yes   |   [N] No");

    // Key handling
    if (keyboard_check_pressed(ord("Y"))) {
        sc_reset_game();
        confirm_reset = false;
    }

    if (keyboard_check_pressed(ord("N"))) {
        confirm_reset = false;
    }
}
