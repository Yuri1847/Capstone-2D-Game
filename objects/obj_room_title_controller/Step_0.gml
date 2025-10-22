/// STEP EVENT
// Detect if player entered a new room
if (room != last_room) {
    last_room = room;

    // Skip certain rooms (no title display)
    var skip_rooms = [
        rm_main_menu,
    ];

    var show_title = true;
    for (var i = 0; i < array_length(skip_rooms); i++) {
        if (room == skip_rooms[i]) {
            show_title = false;
            break;
        }
    }

    // Create the title display for allowed rooms only
    if (show_title && layer_exists("ins_gui")) {
        instance_create_layer(0, 0, "ins_gui", obj_room_title);
    }
}
