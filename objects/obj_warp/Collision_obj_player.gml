/// @description Warp player to the next room
if (targetRoom != noone) {
    // Store new player position for next room
    global.player_next_x = targetX;
    global.player_next_y = targetY;

    // Change room
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
