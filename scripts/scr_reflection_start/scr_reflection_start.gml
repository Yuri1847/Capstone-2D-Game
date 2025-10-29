function scr_reflection_start(_dialog, _id)
{
    var data = scr_reflection_get_data(_id);
    if (is_undefined(data)) return;

    var ui = instance_create_layer(0, 0, "ins_gui", obj_letter_ui);

    if (ui != noone) {
        ui.reflection_id = _id; 
        ui.dialog_ref = _dialog; // <-- add this

        with (ui) {
		    scr_letter_prompt_setup(
		        data.header,
		        data.question,
		        data.scenario,
		        data.choices,
		        data.stat_text,
		        data.stats,
		        data.choice_stats 
		    );
		}



    }
}
