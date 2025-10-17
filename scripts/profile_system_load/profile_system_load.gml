/// profile_system_load()
function profile_system_load() {
    if (!file_exists("Profiles.txt")) return;

    var _buf = buffer_load("Profiles.txt");
    var _json = buffer_read(_buf, buffer_string);
    buffer_delete(_buf);

    if (_json == "" || _json == undefined) return;

    // safe parse (try/catch protects against corrupted JSON)
    var _data;
    try {
        _data = json_parse(_json);
    } catch (e) {
        // corrupted: ignore and keep defaults
        return;
    }

    // validate and adapt if needed
    if (is_array(_data) && array_length(_data) == global.profile_count) {
        global.profiles = _data;
    } else {
        // If structure changed, merge safely (simple fallback: keep defaults and copy valid entries)
        for (var i = 0; i < min(array_length(_data), global.profile_count); ++i) {
            if (is_struct(_data[i])) global.profiles[i] = _data[i];
        }
    }
}
