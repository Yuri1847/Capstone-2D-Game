// obj_quiz_controller - Step Event
/*
if (quiz_done) {
    if (global.quiz_pending_warp) {
        global.quiz_pending_warp = false;

        // Set spawn position
        global.warp_spawn_x = global.quiz_target_x;
        global.warp_spawn_y = global.quiz_target_y;

        // --- Use transition instead of instant warp ---
        var t = instance_find(obj_transition, 0);
        if (!instance_exists(t)) {
            t = instance_create_layer(0, 0, "ins_transition", obj_transition);
        }
        t.fading_out = true;
        t.next_room = global.quiz_target_room;
    }

    instance_destroy(); // clean up controller
}*/
