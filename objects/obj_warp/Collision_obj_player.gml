if (targetRoom != noone) {
    global.warp_spawn_x = targetX;
    global.warp_spawn_y = targetY;
    room_goto(targetRoom);
}
