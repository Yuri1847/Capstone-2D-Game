function sc_nametag(_name){
	 var offset_y = 30; // constant pixels above NPC origin

	draw_set_font(fn_nametags);
    draw_set_halign(fa_center);
    draw_set_valign(fa_bottom);
    draw_set_color(c_white);
	

    draw_text(x, y - offset_y, _name);
}