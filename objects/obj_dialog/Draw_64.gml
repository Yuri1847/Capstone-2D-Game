// GUI size
var gui_w = display_get_gui_width();
var gui_h = display_get_gui_height();

// Dialogue box position
var _dx = 0;
var _dy = gui_h * 0.7;
var _boxw = gui_w;
var _boxh = gui_h - _dy;

// Draw background
draw_sprite_stretched(spr_dial_box, 0, _dx, _dy, _boxw, _boxh);

// Padding inside box
var padding = 32;
var text_x = _dx + padding;
var text_y = _dy + padding;

draw_set_font(fn_dial);
draw_set_halign(fa_left);
draw_set_valign(fa_top);

// Speaker name
var _name = messages[current_message].name;
draw_set_color(global.char_colors[$ _name]); // pull color of name 
draw_text(text_x, text_y, _name);
draw_set_color(c_white); // reset the name color

// Move down for message
text_y += 48;

// Usable width for wrapping (box width - left & right padding)
var usable_width = _boxw - (padding * 2);

// Draw wrapped text
draw_text_ext(text_x, text_y, draw_message, 32, usable_width);
