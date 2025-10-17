/// profile_system_save()
function profile_system_save() {
    var _string = json_stringify(global.profiles);
    var _buf = buffer_create(string_byte_length(_string) + 1, buffer_fixed, 1);
    buffer_write(_buf, buffer_string, _string);
    buffer_save(_buf, "Profiles.txt");
    buffer_delete(_buf);
}
