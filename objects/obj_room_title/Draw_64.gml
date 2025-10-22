// GUI camera area
var area = scr_get_camera_gui_area();
var ax = area.x;
var ay = area.y;
var aw = area.w;

// Center X, top margin offset
var cx = ax + aw * 0.5;
var margin_top = 96;

// Font and text setup
draw_set_font(popup_font);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);

// Measure text
var text_w = string_width(title_text);
var text_h = string_height(title_text);

// Popup size based on text + padding
var pad_x = 28;
var pad_y = 12;
var popup_w = text_w + pad_x * 2;
var popup_h = text_h + pad_y * 2;

// Expansion animation
var current_w = popup_w * width_scale;
var current_h = popup_h;
if (current_w < 2) current_w = 2;

// Sprite info
var spr_w = sprite_get_width(spr_popRN);
var spr_h = sprite_get_height(spr_popRN);
if (spr_w <= 0) spr_w = popup_w;
if (spr_h <= 0) spr_h = popup_h;

// Scale relative to sprite
var scale_x = current_w / spr_w;
var scale_y = current_h / spr_h;

// Popup center Y (since origin = middle-center)
var cy = ay + margin_top + (current_h * 0.5);

// --- Draw ---
if (alpha > 0 && width_scale > 0.01) {
    // Draw background centered on cx, cy
    draw_set_alpha(alpha);
    draw_sprite_ext(spr_popRN, 0, cx, cy, scale_x, scale_y, 0, c_white, alpha);

    // --- Center text exactly over sprite ---
    draw_set_alpha(alpha);
    draw_set_color(c_white);

    // Text is perfectly centered because we use fa_center/fa_middle
    draw_text(cx, cy, title_text);

    // Reset
    draw_set_alpha(1);
    draw_set_halign(fa_left);
    draw_set_valign(fa_top);
}
