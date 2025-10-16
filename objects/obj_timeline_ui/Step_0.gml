/// obj_timeline_ui – Step

var mx = device_mouse_x_to_gui(0);
var my = device_mouse_y_to_gui(0);
var mdown = mouse_check_button(mb_left);

// === Drag start ===
if (mdown && !mouse_was_down) {
    for (var i = array_length(card_objects) - 1; i >= 0; i--) {
        var c = card_objects[i];
        if (point_in_rectangle(mx, my, c.x - c.w/2, c.y - c.h/2, c.x + c.w/2, c.y + c.h/2)) {
            drag_index = i;
            drag_offset_x = mx - c.x;
            drag_offset_y = my - c.y;

            // Bring to front
            var picked = card_objects[i];
            array_delete(card_objects, i, 1);
            array_push(card_objects, picked);
            drag_index = array_length(card_objects) - 1;
            break;
        }
    }
}

// === Dragging ===
if (drag_index != -1) {
    var c = card_objects[drag_index];
    c.x = mx - drag_offset_x;
    c.y = my - drag_offset_y;
}

// === Release ===
if (!mdown && mouse_was_down && drag_index != -1) {
    var card = card_objects[drag_index];
    var best_i = -1;
    var best_dist = 99999;

    for (var s = 0; s < slot_count; s++) {
        var dist = point_distance(card.x, card.y, slots[s].x, slots[s].y);
        if (dist < best_dist) {
            best_dist = dist;
            best_i = s;
        }
    }

    // Snap to nearest slot
    if (best_i != -1) {
        card.target_x = slots[best_i].x;
        card.target_y = slots[best_i].y;
        card.slot_index = best_i;
        card.is_placed = true;
    }

    drag_index = -1;
}

// === Smooth animation ===
for (var i = 0; i < array_length(card_objects); i++) {
    var c = card_objects[i];
    c.x = lerp(c.x, c.target_x, 0.25);
    c.y = lerp(c.y, c.target_y, 0.25);
}

mouse_was_down = mdown;
