function scr_reflection_get_data(_id)
{
    _id = string(_id); // ensures it is string

    if (variable_struct_exists(global.reflection_data, _id))
        return global.reflection_data[_id];

    show_debug_message("⚠️ Reflection not found: " + _id);
    return undefined;
}
