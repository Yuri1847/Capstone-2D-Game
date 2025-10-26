/// scr_letter_system(dialog_inst)
// dialog_inst = the dialogue instance passed from scr_dialogue_start_action

function scr_letter_system(_dialog) {
    // Safety
    if (!instance_exists(_dialog)) {
        // nothing to do; ensure dialogue resumes if needed
        return scr_dialogue_action_complete(_dialog);
    }

    // determine letter id and npc name
    var letter_id = undefined;
    var npc_name = "";
    // try extract from the current entry of the dialog (best effort)
    if (variable_struct_exists(_dialog, "_current_entry") && is_struct(_dialog._current_entry)) {
        var act = _dialog._current_entry.action;
        if (is_string(act) && string_pos("letter:", act) > 0) {
            letter_id = string_copy(act, string_pos("letter:", act) + 7, 999);
        } else if (is_struct(act) && act.type == "letter" && act.id != undefined) {
            letter_id = act.id;
        } else if (variable_struct_exists(_dialog._current_entry, "letter_id")) {
            letter_id = _dialog._current_entry.letter_id;
        }
    }

    // safely read npc name from the dialogue struct
		var npc_name = "Unknown";

		if (variable_struct_exists(_dialog, "current_name")) {
		    npc_name = _dialog.current_name;
		} 
		else if (variable_struct_exists(_dialog, "speaker_name")) {
		    npc_name = _dialog.speaker_name;
		}


    // If we found a letter_id and it exists in global.letters, open UI for that letter
    var letter_struct = undefined;
    if (!is_undefined(letter_id)) {
        letter_struct = scr_letter_find_by_id(letter_id);
    }

    // If a letter was found, open UI for that specific letter.
    // Otherwise, open a generic contextual reflection choice using NPC name and dialog message.
    global.letter_open = true;
    global.letter_current_dialog = _dialog; // store caller for completion

    var ui = instance_create_layer(room_width/2, room_height/2, "ins_gui", obj_letter_ui);
    if (ui != noone) {
        ui.caller_dialog = _dialog;
        ui.letter = letter_struct; // may be undefined -> UI will handle fallback
        ui.npc_name = npc_name;

        // copy the dialog message if present for context
        ui.context_msg = (variable_struct_exists(_dialog, "_current_entry") && variable_struct_exists(_dialog._current_entry, "msg")) ? _dialog._current_entry.msg : "";
    } else {
        // fallback: immediately complete
        global.letter_open = false;
        global.letter_current_dialog = noone;
        scr_dialogue_action_complete(_dialog);
    }
}
