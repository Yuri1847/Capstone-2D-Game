if(!isEnabled) exit;

// mouse position
var mx = device_mouse_x_to_gui(0);
var my = device_mouse_y_to_gui(0);

var inventory_items = inventory.getItem();
for(var row = 0; row < inventory_rows; row++){
	var y_pos = ui_padding_y + (row * (ui_inventory_slot_margin + ui_inventory_slot))
		for(var column = 0; column < inventory_columns; column++){
			var x_pos = ui_padding_x + (column * (ui_inventory_slot_margin + ui_inventory_slot))
			
			//draw each spr_slots in column
			draw_sprite(spr_slots, 0, x_pos, y_pos);
			var inventory_index = (row * inventory_columns) + column;
			if(inventory_index <= array_length(inventory_items) - 1) {
				// draw inventory sprite
				draw_sprite(inventory_items[inventory_index].sprite, 0, x_pos, y_pos);
			}
			
			
			//hover each spr_slots item
			if(sc_is_between(mx, x_pos, x_pos + ui_inventory_slot)) {
				if(sc_is_between(my, y_pos, y_pos + ui_inventory_slot)) {
					draw_set_color(#D5AC82)
					draw_set_alpha(0.2)
					draw_rectangle(x_pos+10, y_pos+10, (x_pos + ui_inventory_slot)-10, (y_pos + ui_inventory_slot)-10, false);
					draw_set_color(c_white);
					draw_set_alpha(1);
				}
			}
			
			//draw each item quantity
			if(inventory_index <= array_length(inventory_items) - 1) {
			draw_set_color(#232323)
			draw_set_alpha(1)
			draw_circle(
				x_pos + ui_inventory_slot,
				y_pos + ui_inventory_slot,
				14,
				false
			);
			
			draw_set_color(c_white);
			draw_set_alpha(1);
			draw_set_halign(fa_center);
			draw_set_valign(fa_middle);
			
			draw_text(
				x_pos + ui_inventory_slot,
				y_pos + ui_inventory_slot,
				inventory_items[inventory_index].quantity
			);
		}
			
		}
}