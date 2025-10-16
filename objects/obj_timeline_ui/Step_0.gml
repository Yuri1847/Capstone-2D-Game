/// obj_timeline_ui - Step
var mx = device_mouse_x_to_gui(0);
var my = device_mouse_y_to_gui(0);

var left = mouse_check_button(mb_left);

/// Press start: find card under mouse (top-most = last in array)
if (left && !mouse_was_down && !is_finished) {
    for (var i = array_length(card_objects) - 1; i >= 0; --i) {
        var co = card_objects[i];
        if (mx >= co.x && mx <= co.x + co.w && my >= co.y && my <= co.y + co.h) {
            drag_index = i;
            drag_offset_x = mx - co.x;
            drag_offset_y = my - co.y;
            // bring to front: remove and push to end
            var dragged = card_objects[i];
            // remove at i
            var new_arr = [];
            for (var k = 0; k < array_length(card_objects); ++k) {
                if (k != i) array_push(new_arr, card_objects[k]);
            }
            card_objects = new_arr;
            // push dragged to end
            array_push(card_objects, dragged);
            drag_index = array_length(card_objects) - 1;
            break;
        }
    }
}

/// While dragging: update card position
if (left && drag_index >= 0 && !is_finished) {
    var d = card_objects[drag_index];
    d.x = mx - drag_offset_x;
    d.y = my - drag_offset_y;
}

/// On release: snap into nearest slot and re-order
if (!left && mouse_was_down && drag_index >= 0 && !is_finished) {
    var d = card_objects[drag_index];

    // find nearest slot index by center distance
    var best = -1;
    var best_dist = 1000000000; // instead of 1e9
    for (var s = 0; s < array_length(slots); ++s) {
        var sx = slots[s].x;
        var sy = slots[s].y;
        var cx = d.x + d.w/2;
        var cy = d.y + d.h/2;
        var dist = point_distance(cx, cy, sx + d.w/2, sy + d.h/2);
        if (dist < best_dist) {
            best_dist = dist;
            best = s;
        }
    }

    if (best >= 0) {
        // remove dragged element from card_objects (it's currently at drag_index)
        var dragged_card = card_objects[drag_index];
        var rebuilt = [];
        for (var k = 0; k < array_length(card_objects); ++k) {
            if (k == drag_index) continue;
            array_push(rebuilt, card_objects[k]);
        }
        // insert dragged_card at position 'best' in rebuilt
        var final = [];
        for (var k = 0; k < array_length(rebuilt) + 1; ++k) {
            if (k == best) {
                array_push(final, dragged_card);
                // continue pushing remaining items
                var kk = k;
                // append rest from rebuilt starting at k
                for (var r = k; r < array_length(rebuilt); ++r) {
                    array_push(final, rebuilt[r]);
                }
                break;
            }
            else if (k < array_length(rebuilt)) {
                array_push(final, rebuilt[k]);
            }
        }
        // Edge case: if best == length (append)
        if (array_length(final) == 0) {
            // best was probably equal to array_length(rebuilt)
            for (var r = 0; r < array_length(rebuilt); ++r) array_push(final, rebuilt[r]);
            array_push(final, dragged_card);
        }
        card_objects = final;
    }

    // Snap all card_objects to slot positions
    for (var k = 0; k < array_length(card_objects); ++k) {
        card_objects[k].x = slots[k].x;
        card_objects[k].y = slots[k].y;
    }

    // check success: compare visual order with 'cards' (the correct sequence)
    var correct = true;
    for (var k = 0; k < array_length(card_objects); ++k) {
        if (card_objects[k].text != cards[k]) {
            correct = false;
            break;
        }
    }

    if (correct) {
	    success = true;
	    is_finished = true;
	    success_alpha = 1;

	    // Trigger callback from sc_timeline_encounter() if it exists
	    if (!is_undefined(on_success)) {
	        on_success();
	    }

	    // --- ✅ Mark challenge complete and close UI ---
	    global.timeline_done = true;
	    instance_destroy();
	}
	else {
	    failure_alpha = 1;
	    // allow retry
	}


    drag_index = -1;
}

/// animate success/failure visuals
if (success_alpha > 0) success_alpha = max(0, success_alpha - 0.02);
if (failure_alpha > 0) failure_alpha = max(0, failure_alpha - 0.04);

mouse_was_down = left;
