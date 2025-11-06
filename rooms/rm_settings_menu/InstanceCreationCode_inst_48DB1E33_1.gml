function room_start_UI_Folder(){
	sc_visible_layer(["settings_menu_layer"]);
	with(obj_settings_options){
		obj_settings_options.isEnabled = true;
	}
}

function room_end_UI_Folder(){
	sc_invisible_layer(["settings_menu_layer"]);
		with(obj_settings_options){
		obj_settings_options.isEnabled = false;
	}
}