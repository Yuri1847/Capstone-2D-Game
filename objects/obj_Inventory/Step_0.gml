if(!isEnabled) exit;

var mx = device_mouse_x_to_gui(0);
var my = device_mouse_y_to_gui(0);
	
var inventory_items = inventory.getItem();
var x_pos = 0;
var y_pos = 0;
	
if(mouse_check_button_released(mb_left)) {		
//INVENTORY	
		for (var row = 0; row < inventory_rows; row++) {				
			y_pos = ui_padding_y + (row * (ui_inventory_slot_margin + ui_inventory_slot));
			for (var column = 0; column < inventory_columns; column++) {
				x_pos = ui_padding_x + (column * (ui_inventory_slot_margin + ui_inventory_slot));
				
				if(sc_is_between(mx, x_pos, x_pos + ui_inventory_slot)) {
					if(sc_is_between(my, y_pos, y_pos + ui_inventory_slot)) {
						var inventory_index = (row * inventory_columns) + column;
						
						if(inventory_index <= array_length(inventory_items) - 1) {
							
							show_debug_message($"Using {inventory_items[inventory_index].name}");
							inventory.subtractItem(inventory_items[inventory_index].name, 1);
							
						}  else {						
							
							show_debug_message("No inventory item here !");
							
						}
					}
				}
			}
		}
}