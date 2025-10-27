// --------------------------------------------------
// scr_letter_submit(ui_inst)
// submits chosen option
// --------------------------------------------------
function scr_letter_submit(ui_inst) {
    if (!instance_exists(ui_inst)) return;

    var sel = ui_inst.selected_choice;
    if (is_undefined(sel) || sel < 0) return;

    var choices = ui_inst.choices;
    var choice = choices[sel];

    var letter_id = (is_undefined(ui_inst.letter) || ui_inst.letter == undefined) ? "" : ui_inst.letter.id;
    var npc_name = (is_undefined(ui_inst.npc_name) || ui_inst.npc_name == "") ? "Unknown" : ui_inst.npc_name;

    // record entry
    global.reflection_system.add_entry(npc_name, letter_id, choice.theme, choice.id, choice.label, choice.value);

    // apply consequences (capture caller dialog before destroy)
    var caller = ui_inst.caller_dialog;
    scr_letter_apply_consequences(ui_inst.letter, choice, caller);

    show_debug_message("[Letter] Choice saved: " + string(choice.id));
    if (!is_undefined(ui_inst.snd_confirm) && ui_inst.snd_confirm != -1) audio_play_sound(ui_inst.snd_confirm, 1, 0);

    // destroy UI then resume dialogue
    instance_destroy(ui_inst);

    if (instance_exists(global.letter_current_dialog)) {
        scr_dialogue_action_complete(global.letter_current_dialog);
    } else if (instance_exists(caller)) {
        scr_dialogue_action_complete(caller);
    }
}
