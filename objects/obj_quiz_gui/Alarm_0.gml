/*
visible = false;

// re-enable player movement
if (instance_exists(obj_player)) with (obj_player) move_lock = false;


// If a warp is pending, do it after quiz
if (variable_global_exists("pending_warp_room")) {
    global.warp_spawn_x = global.pending_warp_x;
    global.warp_spawn_y = global.pending_warp_y;
    room_goto(global.pending_warp_room);

    variable_global_remove("pending_warp_room");
    variable_global_remove("pending_warp_x");
    variable_global_remove("pending_warp_y");
}*/
