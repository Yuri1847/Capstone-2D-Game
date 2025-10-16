// Move player only if globals exist
if (variable_global_exists("quiz_next_x") && variable_global_exists("quiz_next_y") && variable_global_exists("quiz_next_room")) {
    x = global.quiz_next_x;
    y = global.quiz_next_y;
}

// Clean up quiz globals safely
if (variable_global_exists("quiz_next_x")) variable_global_remove("quiz_next_x");
if (variable_global_exists("quiz_next_y")) variable_global_remove("quiz_next_y");
if (variable_global_exists("quiz_next_room")) variable_global_remove("quiz_next_room");
if (variable_global_exists("quiz_done_timer")) variable_global_remove("quiz_done_timer");
if (variable_global_exists("quiz_id")) variable_global_remove("quiz_id");
