// Detect if player entered a new room
if (room != last_room) {
    last_room = room;

    // Create the title display for this room
    if (layer_exists("ins_gui")) {
        instance_create_layer(0, 0, "ins_gui", obj_room_title);
    } else {
        instance_create_layer(0, 0, layer_get_id("Instances"), obj_room_title);
    }
}
