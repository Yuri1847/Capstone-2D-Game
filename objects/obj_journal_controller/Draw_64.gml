if (visible) {
	draw_set_font(fnt_journal);
	
	
    var sw = display_get_gui_width();
	var sh = display_get_gui_height();
	var num_tabs = array_length(tab_titles);

	// --- NEW ---
	// 90% of screen width for tabs
	var total_tab_width = sw * 0.92;
	var margin_x = (sw - total_tab_width) / 2;
	var tab_w = total_tab_width / num_tabs;


    // Draw background (journal page)
    draw_sprite_stretched(spr_journal_bg, 0, 0, 0, sw, sh);

    for (var i = 0; i < num_tabs; i++) {
	    var xq = margin_x + (i * tab_w);
	    var yq = tab_y;
    
	    // Draw each stretched tab
	    if (current_tab == tab_keys[i]) {
	        draw_set_alpha(1);
	    } else {
	        draw_set_alpha(0.7);
	    }
	    draw_sprite_stretched(spr_tab, 0, xq, yq, tab_w, tab_h);

	    // Draw tab text centered
	    draw_set_color(c_white);
	    draw_set_halign(fa_center);
	    draw_set_valign(fa_middle);
	    draw_text(xq + tab_w / 2, yq + tab_h / 2, tab_titles[i]);
	}


    draw_set_alpha(1);
    draw_set_halign(fa_left);
    draw_set_valign(fa_top);

    // --- Example content per tab ---
    draw_set_color(c_black);
    draw_text(100, tab_y + tab_h + 40, "Current Tab: " + string(current_tab));
}


// Draw active tab content
switch (current_tab) {
    case "profile":
        draw_text(100, 200, "Name: Don Juan");
        draw_text(100, 240, "Level: 3 Scholar");
        draw_text(100, 280, "XP: 1200 / 1500");
        break;
    case "quiz":
        draw_text(100, 200, "Chapter 1: 90%");
        draw_text(100, 240, "Chapter 2: 85%");
        break;
    case "notes":
        draw_text(100, 200, "Unlocked Notes: 5 / 20");
        draw_text(100, 240, "- The Friar’s Feast");
        draw_text(100, 260, "- Letters of Maria Clara");
        break;
    case "inventory":
        draw_text(100, 200, "Artifacts:");
        draw_text(120, 240, "- Jose Rizal's Book");
        draw_text(120, 260, "- Old Map of San Diego");
        break;
}
