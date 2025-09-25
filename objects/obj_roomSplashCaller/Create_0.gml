// obj_roomSplashCaller Create Event
if (!variable_global_exists("rooms_seen")) {
    global.rooms_seen = ds_map_create();
}

if (!ds_map_exists(global.rooms_seen, room)) {
    ds_map_add(global.rooms_seen, room, true);

    global.splash_sprite = sc_getSplashForRoom(room);
    global.splash_time   = game_get_speed(gamespeed_fps) * 1;
    global.splash_target = room;

    room_goto(rm_splash);
}

instance_destroy();
