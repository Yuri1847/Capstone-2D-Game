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

draw_set_color(#433017);
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
	    //------------------------------------------
	    // PREP SCROLLABLE SURFACE
	    //------------------------------------------
	    var _surf = surface_create(content_w, content_h);
	    surface_set_target(_surf);
	    draw_clear_alpha(#433017, 1);

	    var padding_x = 20;
	    var y_start = 20 + scroll_y;
	    var y_offset = 0;

	    var panel_inner_pad = 32;
	    var line_gap = 40;
	    var gap = 40;

	    draw_set_color(c_white);

	    //------------------------------------------
	    // 1️⃣ PROFILE HEADER
	    //------------------------------------------
	    var text_x = padding_x + panel_inner_pad;
	    var text_y = y_start + panel_inner_pad;

	    var por_x = text_x;
	    var por_y = text_y;
	    var por_size = 160;
	    draw_sprite_stretched(spr_por_ibarra, 0, por_x, por_y, por_size, por_size);

	    // Align name text at portrait bottom
	    var name_x = por_x + por_size + 20;
	    var text_height = string_height("A");
	    var name_y = por_y + por_size - text_height;
	    draw_text(name_x, name_y, string(global.file_handling_data.player_name));

	    var header_h = 140;
	    y_offset += header_h + gap;

	    //------------------------------------------
	    // 2️⃣ TOTALS SECTION (Virtue Progress)
	    //------------------------------------------
	    var tx = padding_x + panel_inner_pad;
	    var ty = y_start + y_offset + panel_inner_pad;

	    // --- Ensure totals exist ---
	    if (!variable_struct_exists(global.file_handling_data, "total_justice"))  global.file_handling_data.total_justice  = 0;
	    if (!variable_struct_exists(global.file_handling_data, "total_wisdom"))   global.file_handling_data.total_wisdom   = 0;
	    if (!variable_struct_exists(global.file_handling_data, "total_humility")) global.file_handling_data.total_humility = 0;

	    var total_justice  = global.file_handling_data.total_justice;
	    var total_wisdom   = global.file_handling_data.total_wisdom;
	    var total_humility = global.file_handling_data.total_humility;

	    var max_value = 5;
	    var justice_ratio  = clamp(total_justice  / max_value, 0, 1);
	    var wisdom_ratio   = clamp(total_wisdom   / max_value, 0, 1);
	    var humility_ratio = clamp(total_humility / max_value, 0, 1);

	    // --- Alignment Fixes ---
	    var label_w = string_width("Humility:"); // widest label
	    var number_w = string_width(string(max_value)); // max number width
	    var label_gap = 20;
	    var num_gap = 20;

	    var bar_x = tx + label_w + label_gap + number_w + num_gap;
	    var bar_w = (content_w - padding_x * 2 - panel_inner_pad * 2) - (label_w + label_gap + number_w + num_gap);
	    var bar_h = 20;

	    // --- Justice ---
	    draw_set_color(c_white);
	    draw_text(tx, ty, "Justice:");
	    draw_text(tx + label_w + label_gap, ty, string(total_justice));
	    draw_set_color(make_color_rgb(60, 60, 60));
	    draw_rectangle(bar_x, ty + 4, bar_x + bar_w, ty + 4 + bar_h, false);
	    draw_set_color(make_color_rgb(255, 215, 0));
	    draw_rectangle(bar_x, ty + 4, bar_x + (bar_w * justice_ratio), ty + 4 + bar_h, false);

	    // --- Wisdom ---
	    draw_set_color(c_white);
	    draw_text(tx, ty + 40, "Wisdom:");
	    draw_text(tx + label_w + label_gap, ty + 40, string(total_wisdom));
	    draw_set_color(make_color_rgb(60, 60, 60));
	    draw_rectangle(bar_x, ty + 44, bar_x + bar_w, ty + 44 + bar_h, false);
	    draw_set_color(make_color_rgb(100, 200, 255));
	    draw_rectangle(bar_x, ty + 44, bar_x + (bar_w * wisdom_ratio), ty + 44 + bar_h, false);

	    // --- Humility ---
	    draw_set_color(c_white);
	    draw_text(tx, ty + 80, "Humility:");
	    draw_text(tx + label_w + label_gap, ty + 80, string(total_humility));
	    draw_set_color(make_color_rgb(60, 60, 60));
	    draw_rectangle(bar_x, ty + 84, bar_x + bar_w, ty + 84 + bar_h, false);
	    draw_set_color(make_color_rgb(180, 255, 180));
	    draw_rectangle(bar_x, ty + 84, bar_x + (bar_w * humility_ratio), ty + 84 + bar_h, false);

	    // --- Milestone ticks ---
	    draw_set_color(c_white);
	    for (var i = 1; i < max_value; i++) {
	        var tick_x = bar_x + (bar_w * (i / max_value));
	        draw_line(tick_x, ty + 4, tick_x, ty + 4 + bar_h);
	        draw_line(tick_x, ty + 44, tick_x, ty + 44 + bar_h);
	        draw_line(tick_x, ty + 84, tick_x, ty + 84 + bar_h);
	    }

	    // --- Auto-reset at 5 ---
	    if (total_justice >= max_value)  global.file_handling_data.total_justice  = 0;
	    if (total_wisdom  >= max_value)  global.file_handling_data.total_wisdom   = 0;
	    if (total_humility>= max_value)  global.file_handling_data.total_humility = 0;

	    var totals_h = 140;
	    y_offset += totals_h + gap;

	    //------------------------------------------
	    // 3️⃣ TICKETS SECTION
	    //------------------------------------------
	    var tx2 = padding_x + panel_inner_pad;
	    var ty2 = y_start + y_offset + panel_inner_pad;

	    draw_text(tx2, ty2, "Tickets Summary:");
	    draw_text(tx2, ty2 + 40, "Justice Tickets: " + string(global.file_handling_data.justice_tickets));
	    draw_text(tx2, ty2 + 80, "Wisdom Tickets: " + string(global.file_handling_data.wisdom_tickets));
	    draw_text(tx2, ty2 + 120, "Humility Tickets: " + string(global.file_handling_data.humility_tickets));
	    draw_text(tx2, ty2 + 160, "Total Tickets: " + string(global.file_handling_data.tickets));

	    var ticket_h = 200;
	    y_offset += ticket_h + gap;

	    //------------------------------------------
	    // 4️⃣ REFLECTION JOURNAL
	    //------------------------------------------
	    var reflections = global.file_handling_data.reflections;
	    var keys = variable_struct_get_names(reflections);

	    var text_x2 = padding_x + panel_inner_pad;
	    var text_y2 = y_start + y_offset + panel_inner_pad;
	    draw_text(text_x2, text_y2, "✦ Reflection Journal ✦");
	    text_y2 += 40;

	    for (var i = 0; i < array_length(keys); i++) {
		    var key   = keys[i];
		    var entry = reflections[$ key];

		    // --- Safety Checks ---
		    if (!is_struct(entry)) continue;

		    var virtue_name  = (variable_struct_exists(entry, "virtue"))      ? entry.virtue      : "Unknown";
		    var choice_text  = (variable_struct_exists(entry, "choice_text")) ? entry.choice_text : "—";
		    var stats_struct = (variable_struct_exists(entry, "stats"))       ? entry.stats       : undefined;

		    var stat_text = "";
		    if (is_struct(stats_struct)) {
		        stat_text = string_format(stats_struct.justice, 1, 0) + "/" +
		                    string_format(stats_struct.wisdom, 1, 0) + "/" +
		                    string_format(stats_struct.humility, 1, 0);
		    }

		    // Example output:
		    // ibarra_damaso: Justice — 🟥 [A] Speak up...  (5/2/1)
		    var log_text = key + ": " + virtue_name + " — " + choice_text;
		    if (stat_text != "") log_text += "   (" + stat_text + ")";

		    draw_text(text_x2, text_y2 + (i * 40), log_text);
		}


	    var reflection_h = (array_length(keys) * 40) + 200;
	    y_offset += reflection_h + gap;

	    //------------------------------------------
	    // SCROLL AREA END
	    //------------------------------------------
	    scroll_content_height = y_offset + 100;
	    surface_reset_target();
	    draw_surface_part(_surf, 0, 0, content_w, content_h, content_x, content_y);
	    surface_free(_surf);
	break;





    case "challenge":
	    //------------------------------------------
	    // PREP SCROLLABLE SURFACE
	    //------------------------------------------
	    var _surf = surface_create(content_w, content_h);
	    surface_set_target(_surf);
	    draw_clear_alpha(c_white, 0);

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
		draw_set_color(c_white);
        draw_text(content_x + padding_x, y_start, "Unlocked Notes:");
        break;

    case "inventory":
		draw_set_color(c_white);
        draw_text(content_x + padding_x, y_start, "Artifacts:");
        draw_text(content_x + padding_x + 20, y_start + 40, "- Jose Rizal's Book");
        draw_text(content_x + padding_x + 20, y_start + 80, "- Old Map of San Diego");
        break;
}

