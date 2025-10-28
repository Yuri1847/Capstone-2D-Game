/// @description Draw Journal UI
if (!visible) exit;

draw_set_font(fnt_global_reg);


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

draw_set_color(c_black);
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
	    var base_x = content_x + padding_x;
	    var base_y = y_start;

	    draw_text(base_x, base_y, "Name: " + string(global.file_handling_data.player_name));
	    //draw_text(base_x, base_y + 40, "Level: " + string(global.file_handling_data.player_level));
	    draw_text(base_x, base_y + 80, "Knowledge:");

	    // --- Reflection Stats Section ---
	    var total_justice = 0;
	    var total_wisdom = 0;
	    var total_humility = 0;

	    if (variable_global_exists("file_handling_data")) {
	        var reflections = global.file_handling_data.reflections;
	        if (is_undefined(reflections)) reflections = {};

	        var keys = variable_struct_get_names(reflections);

	        // Draw section title
	        var y_offset = base_y + 160;
	        draw_text(base_x, y_offset, "✦ Reflection Journal ✦");
	        y_offset += 40;

	        for (var i = 0; i < array_length(keys); i++) {
	            var key = keys[i];
	            var entry = reflections[$ key];

	            // --- Draw reflection record ---
	            var log_text = key + ": " + entry.virtue + " — " + entry.choice_text;
	            draw_text(base_x, y_offset + i * 40, log_text);

	            // --- Add stats if stored ---
	            if (variable_struct_exists(entry, "stats")) {
	                var s = entry.stats;
	                total_justice += s.justice;
	                total_wisdom += s.wisdom;
	                total_humility += s.humility;
	            }
	        }

	        // --- Draw totals at bottom ---
	        y_offset += array_length(keys) * 40 + 60;
	        draw_text(base_x, y_offset, "⚖️ Justice: " + string(total_justice));
	        draw_text(base_x, y_offset + 40, "🧠 Wisdom: " + string(total_wisdom));
	        draw_text(base_x, y_offset + 80, "🙇 Humility: " + string(total_humility));
	    }
	break;


    case "challenge":
	    //------------------------------------------
	    // PREP SCROLLABLE SURFACE
	    //------------------------------------------
	    var _surf = surface_create(content_w, content_h);
	    surface_set_target(_surf);
	    draw_clear_alpha(c_black, 0);

	    var padding_x = 20;
	    var y_start = 20 + scroll_y;
	    var y_offset = 0;

	    var panel_inner_pad = 32; // inner padding for inside panel
	    var text_width = content_w - (padding_x * 2) - (panel_inner_pad * 2) - 20;
	    var obj_panel_h = sprite_get_height(spr_obj_panel);

	    draw_set_color(c_white);

	    //------------------------------------------
	    // AUTO GROUP QUESTS PER CHAPTER
	    //------------------------------------------
	    var quests_per_chapter = [];
	    var current_chapter = 0;
	    var total_quests = array_length(global.story_quests);

	    // Detect chapters automatically based on gaps or manual grouping
	    var chapter_sizes = [6, 7, 5, 5, 6, 6]; // chapter 1–6
	    var quest_index = 0;

	    for (var ch = 0; ch < array_length(chapter_sizes); ch++) {
	        var chapter_array = [];
	        for (var i = 0; i < chapter_sizes[ch]; i++) {
	            if (quest_index >= total_quests) break;
	            array_push(chapter_array, global.story_quests[quest_index]);
	            quest_index++;
	        }
	        array_push(quests_per_chapter, chapter_array);
	    }

	    //------------------------------------------
	    // LOOP THROUGH CHAPTERS
	    //------------------------------------------
	    for (var c = 0; c < array_length(quests_per_chapter); c++) {
	        var chapter = quests_per_chapter[c];
	        if (array_length(chapter) == 0) continue;

	        //------------------------------------------
	        // COMPUTE PANEL HEIGHT
	        //------------------------------------------
	        var objectives_h = array_length(chapter) * (obj_panel_h + 10);
	        var static_text_h = 60; // title height
	        var chap_panel_h = static_text_h + objectives_h + (panel_inner_pad * 2);

	        //------------------------------------------
	        // DRAW CHAPTER PANEL BACKGROUND
	        //------------------------------------------
	        var chapter_y = y_start + y_offset;
	        draw_sprite_stretched(
	            spr_chap_panel,
	            0,
	            padding_x - 10,
	            chapter_y - 10,
	            content_w - (padding_x * 2) + 20,
	            chap_panel_h
	        );

	        //------------------------------------------
	        // DRAW CHAPTER TEXT CONTENT
	        //------------------------------------------
	        var text_x = padding_x + panel_inner_pad;
	        var text_y = chapter_y + panel_inner_pad;

	        // Chapter title
	        draw_set_color(c_white);
	        draw_text(text_x, text_y, "Kabanata " + string(c + 1));
	        text_y += 40;

	        //------------------------------------------
	        // OBJECTIVES LIST
	        //------------------------------------------
	        for (var i = 0; i < array_length(chapter); i++) {
	            var obj = chapter[i];
	            var obj_y = text_y + (i * (obj_panel_h + 10));

	            if (obj_y >= -60 && obj_y <= content_h - 20) {
	                var obj_inner_pad = 8;
	                var obj_panel_w = content_w - (padding_x * 2) - 60;
	                var obj_panel_x = text_x;
	                var obj_panel_y = obj_y;

	                // Draw objective panel background
	                draw_sprite_stretched(
	                    spr_obj_panel,
	                    0,
	                    obj_panel_x,
	                    obj_panel_y,
	                    obj_panel_w,
	                    obj_panel_h
	                );

	                // Draw objective text with completion box
	                var text_pad_x = obj_panel_x + obj_inner_pad;
	                var text_pad_y = obj_panel_y + obj_inner_pad;
	                var status = obj.completed ? "[✓]" : "[ ]";

	                draw_set_color(obj.completed ? make_color_rgb(0, 200, 0) : c_white);
	                draw_text(text_pad_x, text_pad_y, status + " " + obj.title);
	            }
	        }

	        //------------------------------------------
	        // GAP BETWEEN CHAPTER PANELS
	        //------------------------------------------
	        y_offset += chap_panel_h + 40;
	    }

	    //------------------------------------------
	    // SCROLL AREA
	    //------------------------------------------
	    scroll_content_height = y_offset + 100;
	    surface_reset_target();

	    //------------------------------------------
	    // DRAW SCROLLED CONTENT
	    //------------------------------------------
	    draw_surface_part(_surf, 0, 0, content_w, content_h, content_x, content_y);
	    surface_free(_surf);
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

