/// profile_slot_delete(slot_index) -- clears slot (keeps file removed)
function profile_slot_delete(slot_index) {
    if (slot_index < 0 || slot_index >= global.profile_count) return false;

    // Clear metadata
    global.profiles[slot_index] = {
        name: "",
        last_save: "",
        summary: ""
    };
    profile_system_save();

    // Delete the slot's save file if exists
    var fname = "SaveSlot" + string(slot_index) + ".txt";
    if (file_exists(fname)) file_delete(fname);

    return true;
}
