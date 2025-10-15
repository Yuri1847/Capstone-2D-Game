// === GUI dimensions ===
var gui_w = display_get_gui_width();
var gui_h = display_get_gui_height();

// === Dialogue box position ===
var _dx = 0;
var _dy = gui_h * 0.7;
var _boxw = gui_w;
var _boxh = gui_h - _dy;

// === Draw dialogue box ===
draw_sprite_stretched(spr_dialog_box, 0, _dx, _dy, _boxw, _boxh);

// === Padding ===
var _pad = 32;
var _line_sep = 32;

// === Get current message ===
var _msg = messages[current_message];
var _name = _msg.name;
var _text = draw_message;

// ✅ Safely check if portrait exists
var _portrait = noone;
if (variable_struct_exists(_msg, "portrait")) {
    _portrait = _msg.portrait;
}


// === Get current message ===
var _msg = messages[current_message];
var _name = _msg.name;
var _text = draw_message;
var _portrait = _msg.portrait;

// === Portrait settings ===
var portrait_size = 256;
var portrait_y = _dy - (portrait_size * 0.2);

// === Detect narration ===
var is_narration = (_name == "" || _name == "Narration");

// === Player side detection ===
var player_name = "Crisostomo Ibarra";
var is_player = (_name == player_name);

// === Draw based on type ===
draw_set_font(fn_dial);
draw_set_valign(fa_top);
draw_set_color(c_black);

if (is_narration) {
    // --- NARRATION MODE ---
    draw_set_halign(fa_center);

    var text_x = gui_w * 0.5;
    var text_y = _dy + _pad;
    var text_w = _boxw - (_pad * 4);

    draw_text_ext(text_x, text_y, _text, -1, text_w);
    
} else {
    // --- DIALOGUE MODE ---
    draw_set_halign(fa_left);

    if (is_player) {
        // Player portrait LEFT, text RIGHT
        draw_sprite_stretched(_portrait, 0, _pad, portrait_y, portrait_size, portrait_size);
        var text_x = _pad * 2 + portrait_size;
        var text_w = _boxw - (portrait_size + _pad * 3);
        var text_y = _dy + _pad;
    } else {
        // NPC portrait RIGHT, text LEFT
        draw_sprite_stretched(_portrait, 0, _boxw - portrait_size - _pad, portrait_y, portrait_size, portrait_size);
        var text_x = _pad * 2;
        var text_w = _boxw - (portrait_size + _pad * 3);
        var text_y = _dy + _pad;
    }

    // Draw speaker name
    draw_text(text_x, text_y, _name);

    // Draw dialogue text
    var name_h = string_height(_name);
    draw_text_ext(text_x, text_y + name_h + _pad, _text, -1, text_w);
}















/*

var _dx = 0;
var _dy = gui_h * 0.7;
var _boxw = gui_w;
var _boxh = gui_h - _dy;

// draw box
draw_sprite_stretched(spr_dialog_box, 0, _dx, _dy, _boxw, _boxh);

// padding inside the box
var _pad = 32;
var _line_sep = 32;

_dx += _pad;
_dy += _pad;

draw_set_font(fn_dial);
draw_set_halign(fa_left);
draw_set_valign(fa_top);

// draw name
var _name = messages[current_message].name;
//draw_set_color(global.char_colors[$ _name]);
draw_set_color(c_black);
draw_text(_dx, _dy, _name);
//draw_set_color(c_silver);


// move down for message
_dy += string_height(_name) + _pad;

// max text width inside box
var usable_width = _boxw - (_pad * 4);

// draw message
draw_text_ext(_dx, _dy, draw_message, -1, usable_width);
*/