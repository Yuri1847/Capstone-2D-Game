/// scr_letter_system(_dialog, _letter_id)
function scr_letter_system(_dialog, _letter_id)
{
    // --------------------------------------------------
    // 1. Safety and fallback handling
    // --------------------------------------------------
    if (!instance_exists(_dialog)) {
        return scr_dialogue_action_complete(_dialog);
    }

    if (!variable_global_exists("letters") || !is_struct(global.letters)) {
        show_debug_message("❌ scr_letter_system: global.letters missing or not a struct");
        return;
    }

    // --------------------------------------------------
    // 2. Determine letter_id
    // --------------------------------------------------
    var letter_id = _letter_id;
    if (is_undefined(letter_id) || letter_id == "") {
        if (variable_struct_exists(_dialog, "_current_entry") && is_struct(_dialog._current_entry)) {
            var act = _dialog._current_entry.action;

            if (is_string(act) && string_pos("letter:", act) > 0) {
                letter_id = string_copy(act, string_pos("letter:", act) + 7, 999);
            } 
            else if (is_struct(act) && struct_has_key(act, "type") && act.type == "letter" && struct_has_key(act, "id")) {
                letter_id = act.id;
            } 
            else if (variable_struct_exists(_dialog._current_entry, "letter_id")) {
                letter_id = _dialog._current_entry.letter_id;
            }
        }
    }

    // --------------------------------------------------
    // 3. Lookup the letter data
    // --------------------------------------------------
    var letter_data = global.letters[$ letter_id];
    if (is_undefined(letter_data)) {
        show_debug_message("❌ scr_letter_system: letter not found: " + string(letter_id));
        return;
    }

    // --------------------------------------------------
    // 4. Gather NPC name or context
    // --------------------------------------------------
    var npc_name = "Unknown";
    if (variable_struct_exists(_dialog, "current_name")) npc_name = _dialog.current_name;
    else if (variable_struct_exists(_dialog, "speaker_name")) npc_name = _dialog.speaker_name;

    // --------------------------------------------------
    // 5. Create UI and assign content
    // --------------------------------------------------
    var ui = instance_create_layer(room_width / 2, room_height / 2, "ins_gui", obj_letter_ui);
    if (ui != noone) {
        ui.caller_dialog = _dialog;
        ui.letter = letter_data;
        ui.npc_name = npc_name;
        ui.context_msg = letter_data.text;
        
        if (variable_struct_exists(letter_data, "prompt") && is_struct(letter_data.prompt)) {
            ui.prompt_question = letter_data.prompt.question;
            ui.choices = letter_data.prompt.choices;
        } else {
            ui.prompt_question = "Ano ang iyong pananaw?";
            ui.choices = [
                { id: "generic_1", label: "Mabuti", theme: "Wisdom", value: 1 },
                { id: "generic_2", label: "Masama", theme: "NationalInsight", value: 1 }
            ];
        }

        // bounding boxes for choices
        ui.choice_bbox = [];
        for (var i = 0; i < array_length(ui.choices); i++) {
            array_push(ui.choice_bbox, { xs: 0, ys: 0, w: 0, h: 0 });
        }

        ui.selected_choice = -1;
        ui.snd_confirm = -1;
        global.letter_open = true;
        global.letter_current_dialog = _dialog;

        //if (audio_exists(snd_letter_open)) audio_play_sound(snd_letter_open, 1, false);
    } 
    else {
        global.letter_open = false;
        scr_dialogue_action_complete(_dialog);
    }
}
