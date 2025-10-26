/// obj_letter_ui Create
caller_dialog = noone;    // set by scr_letter_system
letter = undefined;       // set by scr_letter_system (struct or undefined)
npc_name = "";
context_msg = "";
selected_choice = -1;
ui_margin = 48;
ui_w = display_get_width() - ui_margin*2;
ui_h = display_get_height() - ui_margin*2;
ui_x = ui_margin;
ui_y = ui_margin;

// Prepare choices array (structs). If letter exists, use its prompt. Otherwise create defaults.
choices = [];
prompt_question = "";

if (is_undefined(letter) || letter == undefined) {
    // Generic contextual choices based on npc and context_msg
    prompt_question = "Paano mo tutugunan ang nakita mo kay " + string(npc_name) + "?";
    array_push(choices, { id: "reflect_compassion", label: "Ipakita ang malasakit at tulong.", theme: "Compassion", value: 1, stamp: "compassion_stamp" });
    array_push(choices, { id: "reflect_justice", label: "Hingin ang katarungan at pagwawasto.", theme: "Justice", value: 2, stamp: "justice_stamp" });
    array_push(choices, { id: "reflect_caution", label: "Magmatyag muna at magplano.", theme: "Wisdom", value: 1, stamp: "wisdom_stamp" });
} else {
    prompt_question = letter.prompt.question;
    // copy choices from letter (we'll deep-copy to be safe)
    for (var i=0; i<array_length(letter.prompt.choices); i++) {
        var c = letter.prompt.choices[i];
        array_push(choices, { id: c.id, label: c.label, theme: c.theme, value: c.value, stamp: c.stamp });
    }
}

// UI layout preparation for click bounding boxes
choice_bbox = array_create(array_length(choices));
for (var i=0; i<array_length(choice_bbox); i++) {
    choice_bbox[i] = { x:0, y:0, w:0, h:0 };
}

// small UI tactile sounds placeholders (optional)
snd_select = asset_get_index("snd_click");
snd_confirm = asset_get_index("snd_confirm");
