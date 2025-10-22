/// @description Draw Journal UI
if (!visible) exit;

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
var tab_h = top_h * 0.8; // slightly smaller than full 10%
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

// Example: draw some content inside content area
// Only draw if inside content area
var text_x = content_x + 20;
var text_y = content_y + 20;
if (text_y >= content_y && text_y <= content_y + content_h) {
    draw_set_color(c_black);
    draw_set_halign(fa_left);
    draw_set_valign(fa_top);
    draw_text(text_x, text_y, "Current Tab: " + string(current_tab));
}

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

/*
switch (current_tab) {
    case "profile":
        draw_text(area.x + 100, area.y + top_space_h + 120, "Name: " + string(global.file_handling_data.player_name));
        draw_text(area.x + 100, area.y + top_space_h + 160, "Level:");
        draw_text(area.x + 100, area.y + top_space_h + 200, "Knowledge:");
        break;

    case "challenge":
        var y_start = area.y + top_space_h + 120;
        var chapters = [
            "Chapter 1: Crisostomo Ibarra",
            "Chapter 2: Hapunan",
            "Chapter 3: Erehe at Filibustero",
            "Chapter 4: Liwanag sa Gabing Madilim",
            "Chapter 5: Ligawan sa Asotea",
            "Chapter 6: Ang mga Alaala"
        ];
        for (var c = 0; c < array_length(chapters); c++) {
            draw_text(area.x + 100, y_start + c * 40, chapters[c]);
        }
        break;

    case "notes":
        draw_text(area.x + 100, area.y + top_space_h + 120, "Unlocked Notes:");
        break;

    case "inventory":
        draw_text(area.x + 100, area.y + top_space_h + 120, "Artifacts:");
        draw_text(area.x + 120, area.y + top_space_h + 160, "- Jose Rizal's Book");
        draw_text(area.x + 120, area.y + top_space_h + 200, "- Old Map of San Diego");
        break;
}
*/