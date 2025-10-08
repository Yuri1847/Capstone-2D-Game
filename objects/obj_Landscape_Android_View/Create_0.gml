if (os_type == os_android || os_type == os_ios) {
	display_set_gui_maximize();
    window_set_fullscreen(true);
}

//To set Landscape go Game Option -> Android -> General -> find Orientation then 
//unchecked Portrait and flipped portrait
//but this object can be use in the future

// --- DESIGN RESOLUTION (fixed size) ---
global.design_width  = 1280;
global.design_height = 720;

// Create a camera with that size
var cam = camera_create_view(0, 0, global.design_width, global.design_height, 0, noone, -1, -1, -1, -1);

// Enable viewport 0 and assign the camera
view_enabled = true;
view_visible[0] = true;
view_camera[0] = cam;

// Resize the application surface so black bars appear instead of stretching weirdly
surface_resize(application_surface, global.design_width, global.design_height);

// Make GUI scale correctly (for UI objects like joystick, inventory, quest)
display_set_gui_maximize();

