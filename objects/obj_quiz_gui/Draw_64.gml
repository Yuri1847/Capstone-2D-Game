if (!visible) exit;

// background overlay
draw_set_alpha(0.6);
draw_rectangle_color(0, 0, display_get_gui_width(), display_get_gui_height(), c_black, c_black, c_black, c_black, false);
draw_set_alpha(1);

// center panel
var cx = display_get_gui_width() / 2;
var cy = display_get_gui_height() / 2;

draw_set_color(make_color_rgb(240, 240, 240));
draw_roundrect(cx - panel_w/2, cy - panel_h/2, cx + panel_w/2, cy + panel_h/2, false); // ✅ fixed

// draw question
draw_set_color(c_black);
draw_set_font(-1);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_text(cx, cy - panel_h/2 + 80, question);

// draw options
var start_y = cy - panel_h/2 + 150;
for (var i = 0; i < array_length(options); i++) {
    var opt_y = start_y + i * (btn_height + btn_spacing);
    var opt_w = panel_w * 0.8;
    var opt_x = cx - opt_w/2;

    // highlight if selected
    if (i == selected) draw_set_color(c_yellow);
    else draw_set_color(c_white);

    draw_roundrect(opt_x, opt_y, opt_x + opt_w, opt_y + btn_height, false); // ✅ fixed
    draw_set_color(c_black);
    draw_text(cx, opt_y + btn_height / 2, options[i]);
}
