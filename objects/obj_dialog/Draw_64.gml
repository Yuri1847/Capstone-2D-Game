// === GUI dimensions ===
var gui_w = display_get_gui_width();
var gui_h = display_get_gui_height();

// === Dialogue layout settings ===
var portrait_size = 256; // height of portrait
var _boxh = portrait_size; // make box same height as portrait
var _dy = gui_h - _boxh; // bottom-aligned
var padding = 32;

// === Current message ===
var _msg = messages[current_message];
var _name = _msg.name;
var _text = draw_message;

// === Check portrait existence ===
var has_portrait = variable_struct_exists(_msg, "portrait");
var _portrait = has_portrait ? _msg.portrait : noone;

// === Detect speaker ===
var player_name = "Crisostomo Ibarra";
var is_player = (_name == player_name);
var is_narration = (_name == "" || _name == "Narration");

// === Margins based on portrait side ===
var left_margin = 0;
var right_margin = 0;

if (has_portrait && sprite_exists(_portrait) && !is_narration) {
    if (is_player) left_margin = portrait_size;
    else right_margin = portrait_size;
}

// === Compute box position & size ===
var _dx = left_margin;
var _boxw = gui_w - left_margin - right_margin;

// === Draw dialogue box ===
draw_sprite_stretched(spr_dialog_box, 0, _dx, _dy, _boxw, _boxh);

// === Draw portraits (aligned bottom with box) ===
if (has_portrait && sprite_exists(_portrait) && !is_narration) {
    if (is_player) {
        // Player portrait on LEFT edge
        draw_sprite_stretched(_portrait, 0, 0, _dy, portrait_size, portrait_size);
    } else {
        // NPC portrait on RIGHT edge
        draw_sprite_stretched(_portrait, 0, gui_w - portrait_size, _dy, portrait_size, portrait_size);
    }
}

// === Text styling ===
draw_set_font(fn_dial);
draw_set_valign(fa_top);
draw_set_color(c_black);

if (is_narration) {
    // === NARRATION MODE ===
    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);
    
    var text_x = gui_w * 0.5;          // horizontal center
    var text_y = _dy + _boxh * 0.5;    // vertical center of the box
    var text_w = gui_w - (padding * 4);
    
    draw_text_ext(text_x, text_y, _text, -1, text_w);
}else {
    // === Dialogue Mode ===
    draw_set_halign(fa_left);

    var text_x = _dx + padding;
    var name_y = _dy + padding;
    var text_y = name_y + string_height(_name) + padding * 0.5;
    var text_w = _boxw - (padding * 2);

    // Speaker name
    draw_text(text_x, name_y, _name);

    // Dialogue text
    draw_text_ext(text_x, text_y, _text, -1, text_w);
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