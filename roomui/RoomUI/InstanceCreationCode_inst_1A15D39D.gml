function clickButton(){
	// settings button Pause_layer
	with(obj_settings_options){
	obj_settings_options.isEnabled = true;
	}
	sc_visible_layer(["settings_layer"])
	sc_invisible_layer(["pause_layer"])
}