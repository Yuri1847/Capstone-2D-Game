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
	
	
	 // Draw Back Button
    var back_x = back_margin;
    var back_y = sh - back_h - back_margin;

    var mx = device_mouse_x_to_gui(0);
    var my = device_mouse_y_to_gui(0);
	

    var hovered = point_in_rectangle(mx, my, back_x, back_y, back_x + back_w, back_y + back_h);

    draw_set_alpha(hovered ? 0.8 : 1);
    draw_sprite_stretched(spr_journal_back, 0, back_x, back_y, back_w, back_h);
    draw_set_alpha(1);
	
	// --- Draw "Back" text centered safely ---
	var prev_halign = draw_get_halign();
	var prev_valign = draw_get_valign();
	var prev_color  = draw_get_color();
	
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	draw_set_color(c_white);
	draw_text(back_x + back_w / 2, back_y + back_h / 2, "Back");
	
	// ✅ Restore original settings (important!)
	draw_set_halign(prev_halign);
	draw_set_valign(prev_valign);
	draw_set_color(prev_color);
	draw_set_alpha(1);
	
}


// Draw active tab content
switch (current_tab) {
    case "profile":
        draw_text(100, 200, "Name: " + global.file_handling_data.player_name);
        draw_text(100, 240, "Level:");
        draw_text(100, 280, "Knowledge:");
        break;
    case "challenge":
        draw_text(100, 200, "Chapter 1: Crisostomo Ibarra");
	   draw_text(100, 240, "Chapter 2: Hapunan");
	   draw_text(100, 240, "Chapter 3: Erehe at Filibustero");
	   draw_text(100, 240, "Chapter 4: Liwanag sa Gabing Madilim");
	   draw_text(100, 240, "Chapter 5: Ligawan sa Asotea");
	   draw_text(100, 240, "Chapter 6: Ang mga Alala");
        break;
    case "notes":
        draw_text(100, 200, "Unlocked Notes:");
        //draw_text(100, 240, "- The Friar’s Feast");
        //draw_text(100, 260, "- Letters of Maria Clara");
        break;
    case "Tutorial":
        //draw_text(100, 200, "Artifacts:");
        //draw_text(120, 240, "- Jose Rizal's Book");
        //draw_text(120, 260, "- Old Map of San Diego");
        break;
}
