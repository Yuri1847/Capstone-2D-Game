function Inventory() constructor {
	
	//create array for container each item
	inventory_items = [];
	
	//To set each Item
	 function setItem(_name, _quantity, _sprite){
		array_push(inventory_items, {
			name: _name,
			quantity: _quantity,
			sprite: _sprite,
		});
	}
	
	//To search each Item
	function searchItem(_name){
		for (var i = 0; i < array_length(inventory_items); i++){
			if (_name == inventory_items[i].name) {
				return i;
			}
		}
		return -1;
	}
	
	//To add each Item
	function addItem(_name, _quantity, _sprite) {
		var index = searchItem(_name);
		
		if(index >= 0){
			inventory_items[index].quantity += _quantity;
		} else {
			setItem(_name, _quantity, _sprite);
		}
	}
	
	//To subtract each Item
	function subtractItem(_name, _quantity){
		var index = searchItem(_name);
		
		if(index >= 0){
			if(hasItem(_name, _quantity)){
				inventory_items[index].quantity -= _quantity;
			
				if(inventory_items[index].quantity <= 0){
					removeItem(index);
				}
			}
		}
	}
	
	//To check if quantity is enoght or to remove item if quantity is 0 each Item
	function hasItem(_name, _quantity) {
		var index = searchItem(_name);
		
		if(index >= 0) {
			return inventory_items[index].quantity >= _quantity;
		}
		
		return false;
	}
	
	//To remove each Item
	function removeItem(index) {
		array_delete(inventory_items, index, 1);
	}
	
	//To get each item from Item array
	function getItem() {
		return inventory_items;
	}
	
	//To convert Item array container into JSON String 
	
	//Remember that this is important if you want to send an 
	//Item array for saving resources or for other objects that require 
	//items like quest items, or npc requirements etc.
	function toString() {
		return json_stringify(inventory_items);
	}

}