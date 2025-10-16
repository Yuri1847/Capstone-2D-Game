if (requires_timeline) {
    if (!ds_map_exists(global.timeline_flags, timeline_flag) ||
        !global.timeline_flags[? timeline_flag]) {

        sc_timeline_encounter(); // spawns obj_timeline_ui dynamically
        exit; // prevents warp until challenge is completed
    }
}
/*
// If challenge already done
if (targetRoom != noone) {
    global.warp_spawn_x = targetX;
    global.warp_spawn_y = targetY;
    room_goto(targetRoom);
}*/

if (!global.quiz_active) {
    // Store this warp’s target info in globals
    global.quiz_next_room = targetRoom; // must be the room asset
    global.quiz_next_x = targetX;
    global.quiz_next_y = targetY;
    global.quiz_id = quiz_id;

    // Start the quiz
    quiz_start();
} 
// Optional: if quiz already done, warp immediately
else if (global.quiz_done) {
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
