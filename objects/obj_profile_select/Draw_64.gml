/// obj_profile_select Draw GUI
var gw = display_get_gui_width();
var gh = display_get_gui_height();

draw_set_font(font_ui);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);

// Title
draw_set_color(c_white);
draw_text(gw * 0.5, gh * 0.12, "Select Profile");

// Draw slots
for (var i = 0; i < global.profile_count; ++i) {
    var yp = slot_y0 + i * (slot_h + slot_spacing);
    var slot = global.profiles[i];

    // background box
    draw_set_color(i == hover_slot ? c_gray : c_dkgray);
    draw_rectangle(slot_x1, yp, slot_x2, yp + slot_h, false);

    // text contents
    draw_set_color(c_white);
    var title = slot.name == "" ? "EMPTY SLOT" : slot.name;
    var sub = slot.last_save == "" ? (slot.name == "" ? "Create new profile" : "No saved data") : slot.last_save + "  •  " + slot.summary;
    draw_set_halign(fa_left);
    draw_text(slot_x1 + 16, yp + slot_h * 0.33, title);
    draw_set_color(c_ltgrey);
    draw_text(slot_x1 + 16, yp + slot_h * 0.66, sub);
}

// If right-clicked a filled slot -> draw delete confirmation
if (confirm_delete != -1) {
    var cx = gw * 0.5, cy = gh * 0.5;
    draw_set_color(make_color_rgb(0,0,0));
    draw_rectangle(0, 0, gw, gh, false);
    draw_set_color(c_white);
    draw_text(cx, cy - 24, "Delete this profile?");
    draw_text(cx, cy + 8, "Left-click to Confirm  •  Right-click to Cancel");

    // confirm actions
    if (mouse_check_button_pressed(mb_left)) {
        profile_slot_delete(confirm_delete);
        confirm_delete = -1;
    } else if (mouse_check_button_pressed(mb_right)) {
        confirm_delete = -1;
    }
}
