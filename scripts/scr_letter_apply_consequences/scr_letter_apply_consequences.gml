/// scr_letter_apply_consequences(letter_struct, choice_struct, caller_dialog)
function scr_letter_apply_consequences(letter, choice, caller_dialog) {
    // apply extra letter-level consequences (e.g., unlock flags, xp)
    if (!is_undefined(letter) && letter != undefined && variable_struct_exists(letter, "consequences")) {
        var cons = letter.consequences;
        if (!is_undefined(cons.unlock_flag)) {
            global[? cons.unlock_flag] = true;
        }
        if (!is_undefined(cons.xp)) {
            if (!is_undefined(global.player_xp)) global.player_xp += cons.xp;
            else global.player_xp = cons.xp;
        }
    }

    // collect stamp if present
    if (!is_undefined(choice) && !is_undefined(choice.stamp)) {
        if (is_undefined(global.stamps)) global.stamps = [];
        // add if not already
        var found = false;
        for (var i=0; i<array_length(global.stamps); i++) if (global.stamps[i] == choice.stamp) { found = true; break; }
        if (!found) array_push(global.stamps, choice.stamp);
    }

    // optional: set NPC disposition flags or other story flags based on theme/choice
    if (!is_undefined(caller_dialog) && instance_exists(caller_dialog)) {
        // if your dialogue instance supports keeping flags, set them here
        // e.g., caller_dialog.last_reflection_theme = choice.theme;
    }
}
