var area = scr_get_camera_gui_area();
seq_inst = layer_sequence_create("ins_cutscene", area.x, area.y, seq_chap1);

cutscene_start_time = current_time;
//original 15 sec for android 20sec +5
cutscene_duration = 20000; //rule when windows = 15sec same with seq duration but on android and 5 sec more
if (variable_global_exists("nextRoom")) {
    next_room = global.nextRoom;
} else {
    next_room = rm_chapter2_crisostomo_ibarra; 
}
sc_invisible_layer(["right_option_layer", "pause_button_layer"]);
instance_deactivate_all(true); 
