/// @description Draw Journal UI
if (!visible) exit;

draw_set_font(fnt_journal);

// --- Safe visible GUI area ---
var area = scr_get_camera_gui_area();
var sw = area.w;
var sh = area.h;

// --- Layout percentages ---
var top_h = sh * 0.10;
var mid_h = sh * 0.80;
var bot_h = sh * 0.10;

// --- Draw background (covers whole area) ---
draw_sprite_stretched(spr_journal_bg, 0, area.x, area.y, area.w, area.h);

// --------------------------------------------------------------------
// TOP: TABS (10%)
// --------------------------------------------------------------------
var num_tabs = array_length(tab_titles);
var tab_h = top_h * 0.8; // slightly smaller than top area
var tab_y = area.y + (top_h - tab_h) / 2;
var tab_w = area.w / num_tabs;

for (var i = 0; i < num_tabs; i++) {
    var tab_x = area.x + (i * tab_w);

    draw_set_alpha(current_tab == tab_keys[i] ? 1 : 0.6);
    draw_sprite_stretched(spr_tab, 0, tab_x, tab_y, tab_w, tab_h);

    draw_set_color(c_white);
    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);
    draw_text(tab_x + tab_w / 2, tab_y + tab_h / 2, tab_titles[i]);
}
draw_set_alpha(1);

// --------------------------------------------------------------------
// MIDDLE: MAIN CONTENT AREA (80%)
// --------------------------------------------------------------------
var content_x = area.x;
var content_y = area.y + top_h;
var content_w = area.w;
var content_h = mid_h;

draw_set_color(c_white);
draw_rectangle(content_x, content_y, content_x + content_w, content_y + content_h, false);

// Horizontal padding inside content area
var padding_x = 20;  

// Starting Y offset for content
var y_start = content_y + 20;  

// --------------------------------------------------------------------
// BOTTOM: BACK BUTTON (10%)
// --------------------------------------------------------------------
var back_w = 200;
var back_h = bot_h * 0.8;
var back_x = area.x + 40;
var back_y = area.y + sh - back_h - ((bot_h - back_h) / 2);

var mx = device_mouse_x_to_gui(0);
var my = device_mouse_y_to_gui(0);
var hovered = point_in_rectangle(mx, my, back_x, back_y, back_x + back_w, back_y + back_h);

draw_set_alpha(hovered ? 0.8 : 1);
draw_sprite_stretched(spr_journal_back, 0, back_x, back_y, back_w, back_h);
draw_set_alpha(1);

draw_set_color(c_white);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_text(back_x + back_w / 2, back_y + back_h / 2, "Back");

// --------------------------------------------------------------------
// TAB CONTENT DRAWING (inside content area)
// --------------------------------------------------------------------
draw_set_color(c_black);
draw_set_halign(fa_left);
draw_set_valign(fa_top);

switch (current_tab) {
    case "profile":
        draw_text(content_x + padding_x, y_start, "Name: " + string(global.file_handling_data.player_name));
        draw_text(content_x + padding_x, y_start + 40, "Level:");
        draw_text(content_x + padding_x, y_start + 80, "Knowledge:");
        break;

    case "challenge":
        var chapters = [
            "Chapter 1: Crisostomo Ibarra",
            "Chapter 2: Hapunan",
            "Chapter 3: Erehe at Filibustero",
            "Chapter 4: Liwanag sa Gabing Madilim",
            "Chapter 5: Ligawan sa Asotea",
            "Chapter 6: Ang mga Alaala"
        ];
        for (var c = 0; c < array_length(chapters); c++) {
            var item_y = y_start + c * 40;
            // Only draw if inside content area
            if (item_y >= content_y && item_y <= content_y + content_h - 20) {
                draw_text(content_x + padding_x, item_y, chapters[c]);
            }
        }
        break;

    case "notes":
        draw_text(content_x + padding_x, y_start, "Unlocked Notes:");
        break;

    case "inventory":
        draw_text(content_x + padding_x, y_start, "Artifacts:");
        draw_text(content_x + padding_x + 20, y_start + 40, "- Jose Rizal's Book");
        draw_text(content_x + padding_x + 20, y_start + 80, "- Old Map of San Diego");
        break;
}
