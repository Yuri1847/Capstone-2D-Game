function scr_reflection_start(_id)
{
    var data = scr_reflection_get_data(_id);
    if (is_undefined(data)) return;

    var ui = instance_create_layer(0, 0, "ins_gui", obj_letter_ui);

    if (ui != noone) {
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
