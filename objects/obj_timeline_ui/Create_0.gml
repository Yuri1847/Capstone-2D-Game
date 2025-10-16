/// obj_timeline_ui - Create
visible = true;
is_finished = false;

/// layout (GUI coordinates)
gui_w = display_get_gui_width();
gui_h = display_get_gui_height();

panel_margin = 48;
panel_w = min(900, gui_w - panel_margin*2);
panel_h = 360;
panel_x = (gui_w - panel_w) / 2;
panel_y = (gui_h - panel_h) / 2 - 20;

/// title / meta
title_text = "Timeline of Encounters";
subtitle_text = "🔹Type: Sequence Challenge";
purpose_text = "Purpose: Strengthens recall and story structure comprehension.";

font_title = -1;
font_body = -1;

/// card layout
card_w = 220;
card_h = 64;
card_margin = 16;

/// Input / dragging
drag_index = -1;
drag_offset_x = 0;
drag_offset_y = 0;
mouse_was_down = false;

/// Feedback
success = false;
success_alpha = 0;
failure_alpha = 0;

/// Default timeline (will be overwritten if instance.timeline_cards exists)
default_cards = [
    "Ibarra introduced by Tiago",
    "Damaso insult",
    "Guevarra’s praise",
    "Tinong’s invitation",
    "Dinner call"
];

/// Use provided cards if present (warp can set timeline_cards before creating this object)
if (variable_instance_exists(id, "timeline_cards") && array_length(timeline_cards) > 0) {
    cards = timeline_cards;
} else {
    cards = default_cards;
}

slot_count = array_length(cards);

/// Build slot positions (visual anchors)
slots = [];
for (var s = 0; s < slot_count; ++s) {
    var sx = panel_x + panel_margin + s * (card_w + card_margin);
    var sy = panel_y + 120;
    array_push(slots, { x: sx, y: sy });
}

/// Build card_objects array with a shuffled visual order
card_objects = [];
// Copy cards into a temporary array for shuffling
var tmp = [];
for (var i = 0; i < array_length(cards); ++i) array_push(tmp, cards[i]);

// Fisher–Yates shuffle
for (var i = array_length(tmp) - 1; i > 0; --i) {
    var j = irandom(i);
    var t = tmp[j];
    tmp[j] = tmp[i];
    tmp[i] = t;
}

// Create card structs positioned at slots (shuffled)
for (var i = 0; i < array_length(tmp); ++i) {
    var ctext = tmp[i];
    var cx = slots[i].x;
    var cy = slots[i].y;
    array_push(card_objects, {
        text: ctext,
        x: cx,
        y: cy,
        w: card_w,
        h: card_h
    });
}

/// optional callback
on_success = undefined;
