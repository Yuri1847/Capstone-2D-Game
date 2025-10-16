/// obj_timeline_ui - Draw GUI
draw_set_alpha(1);

/// Panel background (semi-transparent)
draw_set_color(c_black);
draw_set_alpha(0.7);
draw_rectangle(panel_x, panel_y, panel_x + panel_w, panel_y + panel_h, false);

/// Inner white card
draw_set_alpha(1);
draw_set_color(c_white);
var inner_x = panel_x + 8;
var inner_y = panel_y + 8;
var inner_w = panel_w - 16;
var inner_h = panel_h - 16;
draw_rectangle(inner_x, inner_y, inner_x + inner_w, inner_y + inner_h, false);

/// Title and meta
draw_set_halign(fa_center);
draw_set_valign(fa_top);
if (font_title != -1) draw_set_font(font_title);
draw_set_color(c_black);
draw_text(panel_x + panel_w/2, panel_y + 12, title_text);
if (font_body != -1) draw_set_font(font_body);
draw_set_color(c_gray);
draw_text(panel_x + panel_w/2, panel_y + 40, subtitle_text);
draw_set_color(c_black);
draw_text(panel_x + panel_w/2, panel_y + 60, purpose_text);

/// Draw slots outline (empty positions)
for (var s = 0; s < array_length(slots); ++s) {
    var sx = slots[s].x;
    var sy = slots[s].y;
    draw_set_alpha(0.12);
    draw_rectangle(sx, sy, sx + card_w, sy + card_h, true);
    draw_set_alpha(1);
}

/// Draw cards (bottom to top)
draw_set_halign(fa_left);
draw_set_valign(fa_middle);
for (var i = 0; i < array_length(card_objects); ++i) {
    var c = card_objects[i];
    // shadow
    draw_set_alpha(0.12);
    draw_rectangle(c.x + 4, c.y + 6, c.x + c.w + 4, c.y + c.h + 6, true);
    draw_set_alpha(1);
    // card background
    draw_set_color(c_white);
    draw_rectangle(c.x, c.y, c.x + c.w, c.y + c.h, true);
    // border (thin)
    draw_set_color(c_black);
    draw_rectangle(c.x + 1, c.y + 1, c.x + c.w - 1, c.y + c.h - 1, true);
    // text
    draw_set_color(c_black);
    var tx = c.x + 12;
    var ty = c.y + c.h/2;
    draw_text(tx, ty, c.text);
}

/// success / failure overlays
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
if (success) {
    draw_set_alpha(success_alpha);
    draw_set_color(c_green);
    draw_text(panel_x + panel_w/2, panel_y + panel_h - 32, "✔ Correct — Timeline complete");
    draw_set_alpha(1);
} else if (failure_alpha > 0) {
    draw_set_alpha(failure_alpha);
    draw_set_color(c_red);
    draw_text(panel_x + panel_w/2, panel_y + panel_h - 32, "Try again");
    draw_set_alpha(1);
}
