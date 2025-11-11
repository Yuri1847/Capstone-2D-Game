/// Instance Creation Code (inside rm_anluwage)
if (!variable_global_exists("global_warp_count")) {
    global.global_warp_count = 0;
}

// --- Choose destination based on number of times you've warped ---
if (global.global_warp_count == 0) {
    targetRoom = rm_chapter2_crisostomo_ibarra;
    targetX = 1055;
    targetY = 738;
}
else if (global.global_warp_count == 1) {
    targetRoom = rm_maria_clara_house_inside_first_floor;
    targetX = 348;
    targetY = 263;
}
else {
    // Optional: keep warping to the last destination or loop
	targetRoom = rm_chapter2_crisostomo_ibarra;
    targetX = 1055;
    targetY = 738;
}

// --- Then increment after each use (so next warp changes room) ---
global.global_warp_count += 1;
