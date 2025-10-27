// --------------------------------------------------
// obj_letter_ui — Create Event
// --------------------------------------------------
caller_dialog = noone;
letter = undefined;
npc_name = "";
context_msg = "";
selected_choice = -1;
choices = [];
prompt_question = "";
choice_bbox = [];
snd_confirm = -1; // set to sound index if you have one

// If creator passed in letter/choices then those are already set in scr_letter_system
if (!is_undefined(choices) && array_length(choices) > 0) {
    // ensure bbox entries
    for (var i = 0; i < array_length(choices); i++) array_push(choice_bbox, { xs: 0, ys: 0, w: 0, h: 0 });
} else {
    choices = []; // safe fallback
    choice_bbox = [];
}
