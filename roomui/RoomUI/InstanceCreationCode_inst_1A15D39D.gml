function clickButton(){
	// settings button Pause_layer
	with(obj_slider_bar){
	obj_slider_bar.isEnabled = true;
	}
	sc_visible_layer(["settings_layer"])
	sc_invisible_layer(["pause_layer"])
}