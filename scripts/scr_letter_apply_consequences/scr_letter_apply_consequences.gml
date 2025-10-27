// --------------------------------------------------
// scr_letter_apply_consequences(letter_struct, choice_struct, caller_dialog)
// --------------------------------------------------
function scr_letter_apply_consequences(letter, choice, caller_dialog) {
    // letter-level consequences
    if (!is_undefined(letter) && is_struct(letter) && struct_has_key(letter, "consequences")) {
        var cons = letter.consequences;
        if (!is_undefined(cons.unlock_flag) && cons.unlock_flag != "") {
            global[? cons.unlock_flag] = true;
        }
        if (!is_undefined(cons.xp)) {
            if (!is_undefined(global.player_xp)) global.player_xp += cons.xp;
            else global.player_xp = cons.xp;
        }
    }

    // collect stamp
    if (!is_undefined(choice) && is_struct(choice) && !is_undefined(choice.stamp)) {
        if (is_undefined(global.stamps)) global.stamps = [];
        var found = false;
        for (var i = 0; i < array_length(global.stamps); i++) {
            if (global.stamps[i] == choice.stamp) { found = true; break; }
        }
        if (!found) array_push(global.stamps, choice.stamp);
    }

    // optional: set flags on caller_dialog if it uses them
    if (!is_undefined(caller_dialog) && instance_exists(caller_dialog)) {
        // Example: caller_dialog.last_reflection_theme = choice.theme;
    }
}
