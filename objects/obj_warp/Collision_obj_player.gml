// obj_warp: Collision Event with obj_player

if (room_exists(targetRoom)) {
    // store warp position for when the player enters the next room
    global.warp_x = targetX;
    global.warp_y = targetY;

    // go to the new room
    room_goto(targetRoom);
}

// Tell splash which sprite and target room to use
//global.splash_sprite = sc_getSplashForRoom(targetRoom);
//global.splash_time   = game_get_speed(gamespeed_fps) * 1;
//global.splash_target = targetRoom;

// Also pass spawn position for player
//global.splash_spawnX = targetX;
//global.splash_spawnY = targetY;

// Jump to splash room
//room_goto(rm_splash);
