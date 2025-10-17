/// profile_slot_load_game(slot_index)
function profile_slot_load_game(slot_index) {
    if (slot_index < 0 || slot_index >= global.profile_count) return false;

    var fname = "SaveSlot" + string(slot_index) + ".txt";
    if (!file_exists(fname)) return false;

    var _buf = buffer_load(fname);
    var _json = buffer_read(_buf, buffer_string);
    buffer_delete(_buf);

    if (_json == "" || _json == undefined) return false;

    var _data;
    try {
        _data = json_parse(_json);
    } catch (e) {
        show_debug_message("⚠️ Error parsing JSON in slot " + string(slot_index));
        return false;
    }

    // 🔹 Restore game data
    if (is_struct(_data)) {
        global.file_handling_data = _data;

        // If needed, reposition player or switch room
        // e.g. room_goto(global.file_handling_data.last_room);
        // or set player position manually on load.

        return true;
    }

    return false;
}
