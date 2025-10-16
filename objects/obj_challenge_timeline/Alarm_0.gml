/// obj_challenge_timeline - Alarm[0]
// Evaluate player order
var correct = true;
for (var i = 0; i < array_length(slots); i++) {
    var occ = slots[i].occupant;
    if (occ == noone) { correct = false; break; }
    if (occ.label != slots[i].expected_label) { correct = false; break; }
}

if (correct) {
    show_message("Tama! Alam mo ang pagkakasunod-sunod ng mga pangyayari.");
    has_ended = true;
} else {
    show_message("Hindi tama ang pagkakasunod-sunod. Subukan muli.");
    // Reset cards to their home positions
    with (obj_timeline_card) {
        x = home_x;
        y = home_y;
    }
    // Clear slot occupants
    for (var i = 0; i < array_length(other.slots); i++) {
        other.slots[i].occupant = noone;
    }
    challenge_complete = false;
}
