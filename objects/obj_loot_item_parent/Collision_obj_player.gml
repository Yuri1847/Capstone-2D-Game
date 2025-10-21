obj_loot_button.isEnabled = true;
	
if (obj_loot_button.loot_button_pressed) {
    obj_loot_button.loot_button_pressed = false;
	if(item_name == "Key"){
		obj_Inventory.inventory.addItem(item_name, item_quantity, item_sprite);
		global.file_handling_data.items.key.isKey_looted = true;
		file_handling_save_game()
		instance_destroy()
	} if(item_name == "Trivia_card"){
		instance_destroy()
		obj_Inventory.inventory.addItem(item_name, item_quantity, item_sprite);
	} 
	
}