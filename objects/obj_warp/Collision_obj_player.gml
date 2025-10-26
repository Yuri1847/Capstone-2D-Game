/*
//for cutscene
if(room == rm_anluwage){
	global.nextRoom = targetRoom;
	global.nextX = targetX;
	global.nextY = targetY;

	room_goto(rm_cut_chap1);
}*/




/*
if (targetRoom != noone) {
    global.warp_spawn_x = targetX;
    global.warp_spawn_y = targetY;

    // Trigger fade instead of instant teleport
    var t = instance_find(obj_transition, 0);
    if (!instance_exists(t)) {
        t = instance_create_layer(0, 0, "ins_transition", obj_transition);
    }
    t.fading_out = true;
    t.next_room = targetRoom;
}*/


//quiz
// obj_warp - Collision with player
/// obj_warp - Collision with obj_player


// Prevent repeating warp while quiz is active
if (has_quiz && !quiz_active) {

    // Create the quiz controller if needed
    if (!instance_exists(obj_quiz_controller)) {
        instance_create_layer(0, 0, "ins_gui", obj_quiz_controller);
    }

    // --- Multi-question setup ---
    if (array_length(quiz_data) > 0) {
        quiz_show(quiz_data, 0); // start from first question
    }

    // Prevent immediate warp — wait until quiz is done
    global.quiz_pending_warp = true;
    global.quiz_target_room = targetRoom;
    global.quiz_target_x = targetX;
    global.quiz_target_y = targetY;

    // Mark that quiz is now active
    quiz_active = true;
}


// If there’s no quiz, warp immediately
if (!has_quiz) {
    global.warp_spawn_x = targetX;
    global.warp_spawn_y = targetY;
    var t = instance_find(obj_transition, 0);
    if (!instance_exists(t)) {
        t = instance_create_layer(0, 0, "ins_transition", obj_transition);
    }
    t.fading_out = true;
    t.next_room = targetRoom;
}



