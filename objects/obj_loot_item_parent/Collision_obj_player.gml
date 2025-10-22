obj_loot_button.isEnabled = true;

	
if (obj_loot_button.loot_button_pressed) {
    obj_loot_button.loot_button_pressed = false;
	
	var _layer = layer_get_id("GUI");
	if (_layer == -1) {
		_layer = layer_create(0, "GUI");
	}
	
	if(item_name == "Key"){
		obj_Inventory.inventory.addItem(item_name, item_quantity, item_sprite);
		global.file_handling_data.items.key.isKey_looted = true;
		file_handling_save_game()


		var popup = instance_create_layer(x, y, _layer, obj_item_receive_popup);
		popup.item_name = item_name;
		popup.item_sprite = spr_key;

		instance_destroy()
	} if(item_name == "Trivia_card"){
		
		var popup = instance_create_layer(x, y, _layer, obj_item_receive_popup);
		popup.item_name = "Trivia Card";
		popup.item_sprite = spr_trivia_card;
		
		instance_destroy()
		obj_Inventory.inventory.addItem(item_name, item_quantity, item_sprite);
	} 
	
}