var _dx = 0;
var _dy = gui_h * 0.7;
var _boxw = gui_w;
var _boxh = gui_h - _dy;

// draw box
draw_sprite_stretched(spr_box, 0, _dx, _dy, _boxw, _boxh);

// padding inside the box
var _pad = 24;
var _line_sep = 32;

_dx += _pad;
_dy += _pad;

draw_set_font(fn_dial);
draw_set_halign(fa_left);
draw_set_valign(fa_top);

// draw name
var _name = messages[current_message].name;
//draw_set_color(global.char_colors[$ _name]);
draw_text(_dx, _dy, _name);
//draw_set_color(c_white);


// move down for message
_dy += string_height(_name) + _line_sep;

// max text width inside box
var usable_width = _boxw - (_pad * 2);

// draw message
draw_text_ext(_dx, _dy, draw_message, -1, usable_width);
