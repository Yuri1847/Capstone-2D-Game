// obj_landscapeandroidview - Create Event
if (os_type == os_android || os_type == os_ios) {
    window_set_fullscreen(true);
}

var dw = 1280;
var dh = 720;

// --- CAMERA VIEW ---
var cam_w = 640;
var cam_h = 360;
var cam = camera_create_view(0, 0, cam_w, cam_h, 0, noone, -1, -1, -1, -1);

// --- VIEWPORT ---
view_enabled = true;
view_visible[0] = true;
view_camera[0] = cam;
view_wport[0] = dw;
view_hport[0] = dh;

// --- SURFACE ---
surface_resize(application_surface, dw, dh);

// --- GUI SCALING ---
display_set_gui_maximize();

// --- Prevent duplicates ---
if (instance_number(obj_Landscape_Android_View) > 1) instance_destroy();


/*
//streched littul bit

/// CREATE EVENT — obj_landscape_android_view
/// Purpose: Auto-adjusts camera to fill any landscape screen (no black bars)

// --- DEVICE SETTINGS ---
if (os_type == os_android || os_type == os_ios) {
    window_set_fullscreen(true);
    display_set_gui_maximize();
}

// --- DESIGN RESOLUTION (your target design size) ---
global.design_width  = 1280;
global.design_height = 720;

// --- GET DEVICE SCREEN INFO ---
var display_w = display_get_width();
var display_h = display_get_height();
var display_ratio = display_w / display_h;
var design_ratio  = global.design_width / global.design_height;

// --- CALCULATE CAMERA SIZE TO FILL SCREEN ---
var cam_w = global.design_width;
var cam_h = global.design_height;

if (display_ratio > design_ratio) {
    // Device is wider than 16:9 (e.g., 20:9 phones)
    cam_w = global.design_height * display_ratio; // widen camera
} else if (display_ratio < design_ratio) {
    // Device is taller (rare for landscape)
    cam_h = global.design_width / display_ratio; // extend vertically if needed
}

// --- CREATE CAMERA ---
var cam = camera_create_view(0, 0, cam_w, cam_h, 0, noone, -1, -1, -1, -1);

// --- ENABLE VIEWPORT ---
view_enabled = true;
view_visible[0] = true;
view_camera[0] = cam;

// --- RESIZE APPLICATION SURFACE TO MATCH CAMERA ---
surface_resize(application_surface, cam_w, cam_h);

// --- GUI SCALING (keeps UI like joysticks consistent) ---
display_set_gui_maximize();

// --- OPTIONAL: STORE CAMERA IN A GLOBAL VARIABLE (for easy access) ---
global.main_camera = cam;

// --- OPTIONAL: DEBUG OUTPUT ---
show_debug_message("Camera set to: " + string(cam_w) + "x" + string(cam_h));
show_debug_message("Screen ratio: " + string(display_ratio));


*/

/*
//original

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
*/
