/// scr_letter_submit(ui_inst)
function scr_letter_submit(ui_inst) {
    if (!instance_exists(ui_inst)) return;

    var sel = ui_inst.selected_choice;
    if (sel < 0) return;

    var choices = ui_inst.choices;
    var choice = choices[sel];

    // determine letter_id if any
    var letter_id = (is_undefined(ui_inst.letter) || ui_inst.letter == undefined) ? "" : ui_inst.letter.id;

    // record in reflection system
    var npc_name = (ui_inst.npc_name != "" ) ? ui_inst.npc_name : "Unknown";
    global.reflection_system.add_entry(npc_name, letter_id, choice.theme, choice.id, choice.label, choice.value);

    // apply consequences (stat increments already applied by add_entry but handle global consequences)
    scr_letter_apply_consequences(ui_inst.letter, choice, ui_inst.caller_dialog);

    // small feedback: you can make a popup or toast here; for now we do debug and audio
    show_debug_message("[Letter] Choice saved: " + string(choice.id));
    if (ui_inst.snd_confirm != -1) audio_play_sound(ui_inst.snd_confirm, 1, 0);

    // destroy UI (Destroy event will clear flags)
    instance_destroy(ui_inst);

    // IMPORTANT: resume dialogue (if caller exists):
    if (instance_exists(global.letter_current_dialog)) {
        scr_dialogue_action_complete(global.letter_current_dialog);
    } else if (instance_exists(ui_inst.caller_dialog)) {
        scr_dialogue_action_complete(ui_inst.caller_dialog);
    }
}
