/// @desc Handles a reflection/letter action from dialogue.
/// @param _dialog
/// @param _action (struct: type, npc_id, letter_id, required)
function scr_letter_system(_dialog, _action) {
    // Safety
    if (!instance_exists(_dialog)) return;
    if (!is_struct(_action)) return scr_dialogue_action_complete(_dialog);

    var _npc_id   = _action.npc_id;
    var _letter_id = _action.letter_id;

    // Make sure global registry exists
    if (!variable_global_exists("letter_registry")) {
        global.letter_registry = {};
    }

    var _reg = global.letter_registry;

    // Check if NPC entry exists
    if (!variable_struct_exists(_reg, _npc_id)) {
        show_debug_message("[LetterSystem] Missing NPC: " + string(_npc_id));
        return scr_dialogue_action_complete(_dialog);
    }

    var _npc_letters = variable_struct_get(_reg, _npc_id);

    // Check if letter entry exists
    if (!variable_struct_exists(_npc_letters, _letter_id)) {
        show_debug_message("[LetterSystem] Missing Letter: " + string(_letter_id));
        return scr_dialogue_action_complete(_dialog);
    }

    var _letter = variable_struct_get(_npc_letters, _letter_id);

    // Mark as read
    _letter.read = true;

    // Spawn UI
    if (object_exists(obj_letter_ui)) {
        var _ui = instance_create_layer(0, 0, "ins_gui", obj_letter_ui);
        _ui.letter_data = _letter;
        _ui.dialog_ref = _dialog; // store dialog ref for callback
    }
}
