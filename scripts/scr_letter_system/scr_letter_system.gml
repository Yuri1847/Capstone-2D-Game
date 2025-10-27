/// scr_letter_system(_dialog)
function scr_letter_system(_dialog)
{
    if (!instance_exists(_dialog)) return;

    // Create your letter/reflection UI
    var ui = instance_create_layer(0, 0, "ins_gui", obj_letter_ui);

    // Pass the dialogue instance so UI can resume it later
    ui.dialog_ref = _dialog;
}
