

// === 2️⃣ Align the cutscene to the camera view ===
var area = scr_get_camera_gui_area();


// === 3️⃣ Create the sequence ===
var seq = layer_sequence_create("ins_cutscene", area.x, area.y, sq_intro);

