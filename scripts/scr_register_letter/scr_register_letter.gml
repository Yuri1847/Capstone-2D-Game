/// @desc Registers a letter for an NPC.
/// @param npc_id
/// @param letter_id
/// @param title
/// @param pages (array of strings)
function scr_register_letter(_npc_id, _letter_id, _title, _pages) {
    // Ensure the global registry exists
    if (!variable_global_exists("letter_registry")) {
        global.letter_registry = {};
    }

    var _reg = global.letter_registry;

    // Create NPC entry if not exists
    if (!variable_struct_exists(_reg, _npc_id)) {
        variable_struct_set(_reg, _npc_id, {});
    }

    var _npc_letters = variable_struct_get(_reg, _npc_id);

    // Register the letter under that NPC
    variable_struct_set(_npc_letters, _letter_id, {
        title: _title,
        pages: _pages,
        read: false
    });
}
