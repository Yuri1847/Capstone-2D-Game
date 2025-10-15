// obj_testBoard → Collision with obj_player

if (!instance_exists(obj_gui_display)) {
    var gui = instance_create_layer(0, 0, "ins_historical_note", obj_gui_display);
    gui.data = info; // ✅ safe, same scope
} else {
    var gui = instance_find(obj_gui_display, 0);
    gui.data = info; // ✅ update existing one
}
