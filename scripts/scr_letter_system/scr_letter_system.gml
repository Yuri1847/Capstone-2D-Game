/// scr_letter_system(_dialog, _id)
/// Opens the reflection letter UI safely

function scr_letter_system(_dialog, _id)
{
    // Validate types
    if (!instance_exists(_dialog)) {
        show_debug_message("⚠️ scr_letter_system: Dialog instance missing");
        return;
    }

    if (!is_string(_id) || string_length(_id) == 0) {
        show_debug_message("⚠️ scr_letter_system: Invalid reflection ID");
        scr_dialogue_action_complete(_dialog);
        return;
    }

    // Get reflection data struct
    var data = scr_reflection_get_data(_id);
    if (!is_struct(data)) {
        show_debug_message("⚠️ scr_letter_system: Reflection data not found or invalid: " + _id);
        scr_dialogue_action_complete(_dialog);
        return;
    }

    // Ensure no duplicate UI open
    if (instance_exists(obj_letter_ui)) {
        show_debug_message("⚠️ scr_letter_system: Letter UI already exists");
        scr_dialogue_action_complete(_dialog);
        return;
    }

    // Create UI instance
    var ui = instance_create_layer(0, 0, "ins_gui", obj_letter_ui);

    if (ui == noone) {
        show_debug_message("⚠️ scr_letter_system: Failed to create obj_letter_ui");
        scr_dialogue_action_complete(_dialog);
        return;
    }

    // Pass data
    ui.dialog_ref = _dialog;
    ui.reflection_id = _id;

    // Validate data fields
    var has_fields = (
        variable_struct_exists(data, "header") &&
        variable_struct_exists(data, "question") &&
        variable_struct_exists(data, "scenario") &&
        variable_struct_exists(data, "choices") &&
        variable_struct_exists(data, "stats")
    );

    if (!has_fields) {
        show_debug_message("⚠️ scr_letter_system: Missing field(s) in reflection data for " + _id);
        instance_destroy(ui);
        scr_dialogue_action_complete(_dialog);
        return;
    }

    // Initialize prompt data
    with (ui) {
        scr_letter_prompt_setup(
            data.header,
            data.question,
            data.scenario,
            data.choices,
            data.stats
        );
    }
}
