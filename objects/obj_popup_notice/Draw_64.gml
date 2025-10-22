var area = scr_get_camera_gui_area();
var cx = area.x + (area.w * 0.5);
var cy = area.y + (area.h * 0.5);

draw_set_font(fnt_popup);
draw_set_color(c_white);

// Get text size
var text_w = string_width(popup_text);
var text_h = string_height(popup_text);

// Padding around text
var pad_x = 40;
var pad_y = 20;

// Target popup size based on text
var popup_w = text_w + pad_x * 2;
var popup_h = text_h + pad_y * 2;

// Apply horizontal expansion animation
var current_w = popup_w * width_scale;
var current_h = popup_h;

// --- Draw popup background expanding from center ---
draw_set_alpha(alpha);

// Only draw if visible enough
if (width_scale > 0.01) {
    var spr_w = sprite_get_width(spr_popup);
    var spr_h = sprite_get_height(spr_popup);
    var scale_x = current_w / spr_w;
    var scale_y = current_h / spr_h;

    draw_sprite_ext(spr_popup, 0, cx, cy, scale_x, scale_y, 0, c_white, alpha);
}

// --- Draw text ---
if (width_scale > 0.8) { // Only once mostly expanded
    var text_x = cx - text_w * 0.5;
    var text_y = cy - text_h * 0.5;
    draw_set_alpha(alpha);
    draw_text(text_x, text_y, popup_text);
}

draw_set_alpha(1);
