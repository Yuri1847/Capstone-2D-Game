if (room == rm_main_menu) exit;

var gui_w = display_get_gui_width();
var gui_h = display_get_gui_height();

// === Diary button (only if closed) ===
if (!show_diary) {
    var bx = gui_w - margin_right - (button_w / 2);
    var by = margin_top + (button_h / 2);
    draw_sprite(button_sprite, 0, bx, by);
    exit;
}

// === Panel ===
var pw = gui_w * 0.9;
var ph = gui_h * 0.9;
var px = (gui_w - pw) / 2;
var py = (gui_h - ph) / 2;

draw_sprite_stretched(panel_sprite, 0, px, py, pw, ph);

// Colors
var col_header = make_color_rgb(45, 45, 65);
var col_tabbar = make_color_rgb(55, 55, 85);
var col_tab_active = make_color_rgb(95, 95, 145);
var col_body   = make_color_rgb(25, 25, 25);
var col_footer = make_color_rgb(45, 45, 65);

// ----------------------------------------------------------
// HEADER
// ----------------------------------------------------------
var header_h = 72;
draw_set_color(col_header);
draw_rectangle(px, py, px + pw, py + header_h, false);

// Title
draw_set_color(c_white);
draw_set_halign(fa_left);
draw_set_valign(fa_middle);
draw_text(px + 32, py + header_h / 2, "PROFILE");

// Close button
var close_size = 48;
var close_x = px + pw - close_size - 32;
var close_y = py + (header_h - close_size) / 2;
draw_set_color(make_color_rgb(70, 70, 100));
draw_roundrect_ext(close_x, close_y, close_x + close_size, close_y + close_size, 8, 8, false);
draw_set_color(c_white);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_text(close_x + close_size / 2, close_y + close_size / 2, "✕");

// ----------------------------------------------------------
// TAB BAR
// ----------------------------------------------------------
var tab_h = 56;
var tab_y = py + header_h;
var tab_count = array_length(tab_names);
var tab_spacing = pw / tab_count;

for (var i = 0; i < tab_count; i++) {
    var tx1 = px + (tab_spacing * i);
    var tx2 = tx1 + tab_spacing;

    // Highlight selected tab
    if (i == current_tab)
        draw_set_color(col_tab_active);
    else
        draw_set_color(col_tabbar);

    draw_rectangle(tx1, tab_y, tx2, tab_y + tab_h, false);

    draw_set_color(c_white);
    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);
    draw_text((tx1 + tx2) / 2, tab_y + tab_h / 2, tab_names[i]);
}

// ----------------------------------------------------------
// BODY CONTENT
// ----------------------------------------------------------
var body_y = tab_y + tab_h;
var footer_h = 72;
var body_h = ph - header_h - tab_h - footer_h;

draw_set_color(col_body);
draw_rectangle(px, body_y, px + pw, body_y + body_h, false);

// Custom content per tab
draw_set_color(c_white);
draw_set_halign(fa_left);
draw_text(px + 48, body_y + 48, "📜 " + tab_names[current_tab]);

switch (current_tab) {
    case 0:
        draw_text(px + 48, body_y + 96, "Kabanata: Listahan ng mga kabanata na iyong nadaanan...");
        break;
    case 1:
        draw_text(px + 48, body_y + 96, "Tauhan: Mga karakter na iyong nakilala sa paglalakbay...");
        break;
    case 2:
        draw_text(px + 48, body_y + 96, "Tala: Mga tala, sulat, o obserbasyon mo sa pakikipagsapalaran...");
        break;
    case 3:
        draw_text(px + 48, body_y + 96, "Gantimpala: Mga gantimpalang iyong natamo sa mga pagsubok...");
        break;
    case 4:
        draw_text(px + 48, body_y + 96, "Pagmumuni: Mga pagninilay at aral na iyong natutunan...");
        break;
}

// ----------------------------------------------------------
// FOOTER BUTTONS
// ----------------------------------------------------------
var footer_y = py + ph - footer_h;
draw_set_color(col_footer);
draw_rectangle(px, footer_y, px + pw, footer_y + footer_h, false);

var btn_w = 200;
var btn_h = 48;
var balik_x = px + 48;
var balik_y = footer_y + (footer_h - btn_h) / 2;
var susunod_x = px + pw - btn_w - 48;
var susunod_y = balik_y;

