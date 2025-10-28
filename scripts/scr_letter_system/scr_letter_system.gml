function scr_letter_system(_dialog)
{
    if (!instance_exists(_dialog)) return;

    var ui = instance_create_layer(0, 0, "ins_gui", obj_letter_ui);
    ui.dialog_ref = _dialog; // store which dialogue called it
}
