if (targetRoom != noone) {
    global.warp_spawn_x = targetX;
    global.warp_spawn_y = targetY;

    // Trigger fade instead of instant teleport
    var t = instance_find(obj_transition, 0);
    if (!instance_exists(t)) {
        t = instance_create_layer(0, 0, "ins_transition", obj_transition);
    }
    t.fading_out = true;
    t.next_room = targetRoom;
}
