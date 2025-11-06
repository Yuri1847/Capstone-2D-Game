function clickButton(){
	//back Button Settings Layer
	sc_visible_layer(["pause_layer"]);
	sc_invisible_layer(["settings_layer"]);
	with(obj_settings_options){
	obj_settings_options.isEnabled = false;
	}
}