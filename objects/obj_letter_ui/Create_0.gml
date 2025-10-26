/// obj_letter_ui — Create Event
caller_dialog = noone;    // Set by scr_letter_system
letter = undefined;       // Struct from scr_letter_system
npc_name = "";
context_msg = "";
selected_choice = -1;

// === LAYOUT ===
var area = scr_get_camera_gui_area();
ui_margin = area.w * 0.05; // 5% margin relative to camera GUI area
ui_w = area.w - ui_margin * 2;
ui_h = area.h - ui_margin * 2;
ui_x = area.x + ui_margin;
ui_y = area.y + ui_margin;

// === PREPARE CHOICES ===
choices = [];
prompt_question = "";

if (is_undefined(letter) || letter == undefined) {
    prompt_question = "Paano mo tutugunan ang nakita mo kay " + string(npc_name) + "?";
    array_push(choices, { id: "reflect_compassion", label: "Ipakita ang malasakit at tulong.", theme: "Compassion", value: 1, stamp: "compassion_stamp" });
    array_push(choices, { id: "reflect_justice", label: "Hingin ang katarungan at pagwawasto.", theme: "Justice", value: 2, stamp: "justice_stamp" });
    array_push(choices, { id: "reflect_caution", label: "Magmatyag muna at magplano.", theme: "Wisdom", value: 1, stamp: "wisdom_stamp" });
} else {
    prompt_question = letter.prompt.question;
    for (var i = 0; i < array_length(letter.prompt.choices); i++) {
        var c = letter.prompt.choices[i];
        array_push(choices, {
            id: c.id,
            label: c.label,
            theme: c.theme,
            value: c.value,
            stamp: c.stamp
        });
    }
}

// === CHOICE BOUNDING BOXES ===
// store as { x, y, w, h } (values filled in Draw)
choice_bbox = array_create(array_length(choices));
for (var i = 0; i < array_length(choice_bbox); i++) {
    choice_bbox[i] = { x: 0, y: 0, w: 0, h: 0 };
}
