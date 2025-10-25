/// @description Set warp spawn on entering new room
if (variable_global_exists("warp_spawn_x") && global.warp_spawn_x != undefined) {
    x = global.warp_spawn_x;
    y = global.warp_spawn_y;

    global.warp_spawn_x = undefined;
    global.warp_spawn_y = undefined;
}

