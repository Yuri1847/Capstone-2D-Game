/// scr_reflection_get_data(_id)
/// Returns a valid reflection data struct or undefined

function scr_reflection_get_data(_id)
{
    if (!variable_global_exists("reflection_data")) {
        show_debug_message("⚠️ Global reflection_data not defined");
        return undefined;
    }

    _id = string(_id);

    // Use variable_struct_exists + variable_struct_get to safely access
    if (variable_struct_exists(global.reflection_data, _id)) {
        var entry = variable_struct_get(global.reflection_data, _id);
        if (is_struct(entry)) return entry;
    }

    show_debug_message("⚠️ Reflection data not found for: " + _id);
    return undefined;
}
