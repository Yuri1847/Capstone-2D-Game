function sc_Inventory() constructor {
	
	inventory_items = [];
	
	 function setItem(_name, _quantity, _sprite){
		array_push(inventory_items, {
			name: _name,
			quantity: _quantity,
			sprite: _sprite,
		});
	}
	
	function searchItem(_name){
		for (var i = 0; i < array_length(inventory_items); i++){
			if (_name == inventory_items[i].name) {
				return i;
			}
		}
		return -1;
	}
	
	function addItem(_name, _quantity, _sprite) {
		var index = searchItem(_name);
		
		if(index >= 0){
			inventory_items[index].quantity += _quantity;
		} else {
			setItem(_name, _quantity, _sprite);
		}
	}
	
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
	
	function hasItem(_name, _quantity) {
		var index = searchItem(_name);
		
		if(index >= 0) {
			return inventory_items[index].quantity >= _quantity;
		}
		
		return false;
	}
	
	function removeItem(index) {
		array_delete(inventory_items, index, 1);
	}
	
	function getItem() {
		return inventory_items;
	}
	
	function toString() {
		return json_stringify(inventory_items);
	}

}