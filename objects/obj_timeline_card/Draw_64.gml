// Draw card background
draw_set_alpha(image_alpha);
draw_sprite_ext(sprite_index, 0, x, y, 1, 1, 0, c_white, image_alpha);
draw_set_alpha(1);

// Draw text
var text_y = y + sprite_get_height(sprite_index) / 2 + 32;
draw_set_font(fnt_default);
draw_set_halign(fa_center);
draw_text(x, text_y, title);
draw_text(x, text_y + 40, desc);

draw_set_halign(fa_left);
