/// profile_slot_save_game(slot_index)
function profile_slot_save_game(slot_index) {
    if (slot_index < 0 || slot_index >= global.profile_count) return false;

    // 🔹 Save actual game data (your existing save structure)
    var _json = json_stringify(global.file_handling_data);

    var fname = "SaveSlot" + string(slot_index) + ".txt";
    var _buf = buffer_create(string_byte_length(_json) + 1, buffer_fixed, 1);
    buffer_write(_buf, buffer_string, _json);
    buffer_save(_buf, fname);
    buffer_delete(_buf);

    // 🔹 Update profile metadata
    var _timestamp = date_date_string(date_current_datetime()) + " " + date_time_string(date_current_datetime());
    global.profiles[slot_index].last_save = _timestamp;
    global.profiles[slot_index].summary = "Chapter " + string(global.file_handling_data.current_chapter ?? 0);

    // 🔹 Save metadata to Profiles.txt
    profile_system_save();

    // 🔹 Update Settings.txt metadata (optional)
    global.settings_data.state_slot[slot_index].date = date_date_string(date_current_datetime());
    global.settings_data.state_slot[slot_index].time = date_time_string(date_current_datetime());
    settings_save_game();

    return true;
}
