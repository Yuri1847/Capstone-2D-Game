/// obj_timeline_ui – Create

// === Base GUI ===
visible = true;
is_finished = false;

// === GUI dimensions ===
gui_w = display_get_gui_width();
gui_h = display_get_gui_height();

// === Background panel ===
main_w = gui_w;
main_h = gui_h;

// === Info panel (top) ===
info_w = gui_w * 0.9;
info_h = gui_h * 0.2;
info_x = (gui_w - info_w) * 0.5;
info_y = gui_h * 0.05; // small top margin

// === Center panel (bottom timeline area) ===
panel_w = gui_w * 0.9;
panel_h = gui_h * 0.7;
panel_x = (gui_w - panel_w) * 0.5;
panel_y = info_y + info_h + (gui_h * 0.1); // 10% vertical gap

// === Card / Slot layout ===
card_w = 160;
card_h = 220;
card_margin = 40;

// === Input ===
drag_index = -1;
drag_offset_x = 0;
drag_offset_y = 0;
mouse_was_down = false;

// === Timeline data ===
cards = [
    "Ibarra introduced by Tiago",
    "Damaso insult",
    "Guevarra’s praise",
    "Tinong’s invitation",
    "Dinner call"
];
slot_count = array_length(cards);

// === Build slot positions (horizontal layout, centered) ===
slots = [];
var total_w = slot_count * card_w + (slot_count - 1) * card_margin;
var start_x = panel_x + (panel_w - total_w) * 0.5;
var y_center = panel_y + panel_h * 0.5;

for (var i = 0; i < slot_count; i++) {
    var sx = start_x + i * (card_w + card_margin);
    var sy = y_center;
    array_push(slots, { x: sx, y: sy });
}

// === Shuffle cards ===
var tmp = array_create(slot_count);
for (var i = 0; i < slot_count; i++) tmp[i] = cards[i];
for (var i = slot_count - 1; i > 0; i--) {
    var j = irandom(i);
    var t = tmp[i];
    tmp[i] = tmp[j];
    tmp[j] = t;
}

// === Create card objects ===
card_objects = [];
for (var i = 0; i < slot_count; i++) {
    var cx = slots[i].x;
    var cy = slots[i].y - 300; // start slightly above
    array_push(card_objects, {
        text: tmp[i],
        x: cx,
        y: cy,
        target_x: slots[i].x,
        target_y: slots[i].y,
        w: card_w,
        h: card_h,
        slot_index: -1,
        is_placed: false
    });
}
