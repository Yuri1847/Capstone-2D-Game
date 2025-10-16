/// obj_timeline_slot - Draw GUI Event

// Slot visual properties
var slot_width  = 180;
var slot_height = 64;

// Base colors
var col_fill    = make_color_rgb(245, 245, 245);
var col_outline = c_black;

// Draw filled rounded rectangle (GM2024 uses default radius)
draw_set_color(col_fill);
draw_roundrect(x - slot_width/2, y - slot_height/2, x + slot_width/2, y + slot_height/2, false);

// Draw outline
draw_set_color(col_outline);
draw_roundrect(x - slot_width/2, y - slot_height/2, x + slot_width/2, y + slot_height/2, true);

// Draw text
draw_set_color(c_black);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);

if (variable_instance_exists(id, "label")) {
    draw_text(x, y, label);
}
