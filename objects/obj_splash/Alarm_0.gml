if (global.splash_target != noone) {
    var _target = global.splash_target;

    // use spawn globals only if they exist
    var _x = (variable_global_exists("splash_spawnX")) ? global.splash_spawnX : -1;
    var _y = (variable_global_exists("splash_spawnY")) ? global.splash_spawnY : -1;

    show_debug_message("Splash done → going to " + string(_target));

    room_goto(_target);

    // after room change, reposition the player
    if (_x != -1 && _y != -1) {
        with (obj_player) {
            x = _x;
            y = _y;
        }
    }

    // cleanup (so old values don’t carry over)
    global.splash_spawnX = undefined;
    global.splash_spawnY = undefined;

    instance_destroy();
}
