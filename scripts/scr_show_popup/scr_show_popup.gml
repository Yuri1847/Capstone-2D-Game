function scr_show_popup(_message) {
    var p = instance_create_layer(0, 0, "ins_gui", obj_popup_notice);
    p.popup_text = _message;
}
