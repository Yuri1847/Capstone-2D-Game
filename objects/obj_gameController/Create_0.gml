// Create Event of obj_global_controller
if (!variable_global_exists("quiz_next_room")) {
    global.quiz_next_room = noone;
}

// Initialize all globals safely
global.quiz_active = false;
global.quiz_done = false;

global.quiz_next_x = 0;
global.quiz_next_y = 0;
global.quiz_done_timer = 0;
global.quiz_id = "";
