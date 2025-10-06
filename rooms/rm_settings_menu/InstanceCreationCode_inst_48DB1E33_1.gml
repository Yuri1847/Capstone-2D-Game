function room_start_UI_Folder(){
	sc_visible_layer(["settings_menu_layer"]);
	with(obj_slider_bar){
		obj_slider_bar.isEnabled = true;
	}
}

function room_end_UI_Folder(){
	sc_invisible_layer(["settings_menu_layer"]);
		with(obj_slider_bar){
		obj_slider_bar.isEnabled = false;
	}
}