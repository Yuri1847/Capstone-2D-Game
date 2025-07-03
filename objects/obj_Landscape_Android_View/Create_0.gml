if (os_type == os_android || os_type == os_ios) {
	display_set_gui_maximize();
    window_set_fullscreen(true);
}

//To set Landscape go Game Option -> Android -> General -> find Orientation then 
//unchecked Portrait and flipped portrait
//but this object can be use in the future