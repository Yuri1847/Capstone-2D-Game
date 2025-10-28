
function scr_letter_system(_dialog, _id)
{
    if (string_length(_id) == 0) {
        show_debug_message("⚠️ scr_letter_system: Missing reflection ID!");
        scr_dialogue_action_complete(_dialog);
        return;
    }

    var data = scr_reflection_get_data(_id);
    if (is_undefined(data)) {
        scr_dialogue_action_complete(_dialog);
        return;
    }

    var ui = instance_create_layer(0, 0, "ins_gui", obj_letter_ui);
    if (ui != noone) {
        ui.dialog_ref = _dialog; // ✅ <— important fix
		 ui.reflection_id = _id;
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
}
