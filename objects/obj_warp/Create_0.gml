/// @description Initialize warp properties
targetRoom = noone; // The room to warp to
targetX = 0;
targetY = 0;

requires_timeline = false; // set true if challenge required
timeline_flag = "";        // unique identifier for the challenge

depth = -1000;

// Make sure the global map exists
if (!variable_global_exists("timeline_flags")) {
    global.timeline_flags = ds_map_create();
}
