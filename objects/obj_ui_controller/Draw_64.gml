if (room == rm_main_menu) exit;

var gui_w = display_get_gui_width();
var gui_h = display_get_gui_height();

// === Diary button (only if closed) ===
if (!show_diary) {
    // Correct position for center-origin sprite
	var bx = gui_w - margin_right - button_w / 2;
	var by = margin_top + button_h / 2;
	draw_sprite(button_sprite, 0, bx, by);

    exit;
}

// === Diary Panel ===
var pw = gui_w * 0.9;
var ph = gui_h * 0.9;
var px = (gui_w - pw) / 2;
var py = (gui_h - ph) / 2;

// Draw panel sprite stretched
draw_sprite_stretched(panel_sprite, 0, px, py, pw, ph);

// Colors
var col_header = make_color_rgb(45, 45, 65);
var col_tabbar = make_color_rgb(55, 55, 85);
var col_body   = make_color_rgb(25, 25, 25);
var col_footer = make_color_rgb(45, 45, 65);

// ----------------------------------------------------------
// HEADER
// ----------------------------------------------------------
var header_h = 72;
draw_set_color(col_header);
draw_rectangle(px, py, px + pw, py + header_h, false);

// Title (aligned left)
draw_set_font(-1); // default font
draw_set_halign(fa_left);
draw_set_valign(fa_middle);
draw_set_color(c_white);
draw_text(px + 32, py + header_h / 2, "📖  Diario ng Paglalakbay");

// Close button (larger, 48×48)
var close_size = 48;
var close_x = px + pw - close_size - 32;
var close_y = py + (header_h - close_size) / 2;

// Draw a rounded button bg
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
draw_set_color(col_tabbar);
draw_rectangle(px, tab_y, px + pw, tab_y + tab_h, false);

var tab_names = ["Kabanata", "Tauhan", "Tala", "Gantimpala", "Pagmumuni"];
var tab_count = array_length(tab_names);
var tab_spacing = pw / tab_count;

draw_set_color(c_white);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);

for (var i = 0; i < tab_count; i++) {
    var tab_center_x = px + (tab_spacing * i) + tab_spacing / 2;
    draw_text(tab_center_x, tab_y + tab_h / 2, tab_names[i]);
}

// ----------------------------------------------------------
// BODY
// ----------------------------------------------------------
var body_y = tab_y + tab_h;
var footer_h = 72;
var body_h = ph - header_h - tab_h - footer_h;

draw_set_color(col_body);
draw_rectangle(px, body_y, px + pw, body_y + body_h, false);

draw_set_color(c_white);
draw_set_halign(fa_left);
draw_text(px + 48, body_y + 48, "📜 Page content or scrollable text goes here...");
draw_text(px + 48, body_y + 96, "Current page: " + string(current_page + 1));

// ----------------------------------------------------------
// FOOTER
// ----------------------------------------------------------
var footer_y = py + ph - footer_h;
draw_set_color(col_footer);
draw_rectangle(px, footer_y, px + pw, footer_y + footer_h, false);

// Buttons width
var btn_w = 200;
var btn_h = 48;

// Balik (Left)
var balik_x = px + 48;
var balik_y = footer_y + (footer_h - btn_h) / 2;

// Susunod (Right)
var susunod_x = px + pw - btn_w - 48;
var susunod_y = balik_y;

// Draw buttons
draw_set_color(make_color_rgb(70, 70, 100));
draw_roundrect_ext(balik_x, balik_y, balik_x + btn_w, balik_y + btn_h, 8, 8, false);
draw_roundrect_ext(susunod_x, susunod_y, susunod_x + btn_w, susunod_y + btn_h, 8, 8, false);


draw_set_color(c_white);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_text(balik_x + btn_w / 2, balik_y + btn_h / 2, "< Balik");
draw_text(susunod_x + btn_w / 2, susunod_y + btn_h / 2, "Susunod >");
