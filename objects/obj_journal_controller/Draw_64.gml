/// @description Draw Journal UI
if (!visible) exit;

draw_set_font(fnt_journal);

var sw = display_get_gui_width();
var sh = display_get_gui_height();
var num_tabs = array_length(tab_titles);

// --- Layout ---
var top_space_h = sh * 0.10; // 10% top margin
var total_tab_width = (sw * 0.5) * 0.92; // tabs occupy right half (92% padding)
var margin_x = sw * 0.5 + (sw * 0.5 - total_tab_width) / 2;
var tab_w = total_tab_width / num_tabs;

// --- Background (journal page) ---
draw_sprite_stretched(spr_journal_bg, 0, 0, top_space_h, sw, sh - top_space_h);


// --- Tabs (on right half of top space) ---
var tab_y = (top_space_h - tab_h) / 2;

for (var i = 0; i < num_tabs; i++) {
    var xq = margin_x + (i * tab_w);

    draw_set_alpha(current_tab == tab_keys[i] ? 1 : 0.6);
    draw_sprite_stretched(spr_tab, 0, xq, tab_y, tab_w, tab_h);

    draw_set_color(c_white);
    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);
    draw_text(xq + tab_w / 2, tab_y + tab_h / 2, tab_titles[i]);
}
draw_set_alpha(1);

// --- Tab content area ---
draw_set_color(c_black);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_text(100, top_space_h + 40, "Current Tab: " + string(current_tab));

// --- Back Button ---
var back_x = back_margin;
var back_y = sh - back_h - back_margin;

var mx = device_mouse_x_to_gui(0);
var my = device_mouse_y_to_gui(0);
var hovered = point_in_rectangle(mx, my, back_x, back_y, back_x + back_w, back_y + back_h);

draw_set_alpha(hovered ? 0.8 : 1);
draw_sprite_stretched(spr_journal_back, 0, back_x, back_y, back_w, back_h);
draw_set_alpha(1);

// --- "Back" label ---
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_color(c_white);
draw_text(back_x + back_w / 2, back_y + back_h / 2, "Back");

// --- Tab Content ---
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_color(c_black);

switch (current_tab) {
    case "profile":
        draw_text(100, top_space_h + 120, "Name: " + string(global.file_handling_data.player_name));
        draw_text(100, top_space_h + 160, "Level:");
        draw_text(100, top_space_h + 200, "Knowledge:");
        break;

    case "challenge":
        var y_start = top_space_h + 120;
        var chapters = [
            "Chapter 1: Crisostomo Ibarra",
            "Chapter 2: Hapunan",
            "Chapter 3: Erehe at Filibustero",
            "Chapter 4: Liwanag sa Gabing Madilim",
            "Chapter 5: Ligawan sa Asotea",
            "Chapter 6: Ang mga Alaala"
        ];
        for (var c = 0; c < array_length(chapters); c++) {
            draw_text(100, y_start + c * 40, chapters[c]);
        }
        break;

    case "notes":
        draw_text(100, top_space_h + 120, "Unlocked Notes:");
        break;

    case "inventory":
        draw_text(100, top_space_h + 120, "Artifacts:");
        draw_text(120, top_space_h + 160, "- Jose Rizal's Book");
        draw_text(120, top_space_h + 200, "- Old Map of San Diego");
        break;
}
