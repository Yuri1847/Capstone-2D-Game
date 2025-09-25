show_debug_message("Splash created for target: " + string(global.splash_target));

sprite_index = global.splash_sprite;
image_speed  = 0;
next_room    = global.splash_target;

// set alarm
if (global.splash_time > 0) {
    alarm[0] = global.splash_time;
} else {
    alarm[0] = game_get_speed(gamespeed_fps) * 3; // fallback 3 sec
}
