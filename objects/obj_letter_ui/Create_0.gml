/// obj_letter_ui — Create Event
caller_dialog = noone;    // Set by scr_letter_system
letter = undefined;       // Struct from scr_letter_system
npc_name = "";
context_msg = "";
selected_choice = -1;


// === PREPARE CHOICES ===
choices = [];
prompt_question = "";



// === CHOICE BOUNDING BOXES ===
// store as { x, y, w, h } (values filled in Draw)
choice_bbox = array_create(array_length(choices));
for (var i = 0; i < array_length(choice_bbox); i++) {
    choice_bbox[i] = { x: 0, y: 0, w: 0, h: 0 };
}
