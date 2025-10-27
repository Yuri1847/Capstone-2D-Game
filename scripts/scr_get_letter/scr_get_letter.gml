/// scr_get_letter(_npc_id, _letter_id)
function scr_get_letter(_npc_id, _letter_id)
{
    if (!variable_global_exists("letter_registry")) return undefined;
    if (!variable_struct_exists(global.letter_registry, _npc_id)) return undefined;
    if (!variable_struct_exists(global.letter_registry[_npc_id], _letter_id)) return undefined;

    return global.letter_registry[_npc_id][_letter_id];
}
