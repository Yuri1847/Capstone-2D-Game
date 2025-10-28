/// scr_letter_system(_dialog, _npc_id)
function scr_letter_system(_dialog, _npc_id)
{
    if (!instance_exists(_dialog)) return;

    var ui = instance_create_layer(0, 0, "ins_gui", obj_letter_ui);
    ui.dialog_ref = _dialog;
    ui.npc_id = _npc_id; // this will be "test"
}
