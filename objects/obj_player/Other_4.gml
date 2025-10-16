/// @description Move player to warp destination if one exists
if (variable_global_exists("warp_spawn_x")) {
    x = global.warp_spawn_x;
    y = global.warp_spawn_y;

    // Optional: clear to avoid reusing by mistake
    global.warp_spawn_x = undefined;
    global.warp_spawn_y = undefined;
}
