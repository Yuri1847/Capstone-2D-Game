/// Helper function to safely remove a global variable
function safe_global_remove(varname) {
    if (variable_global_exists(varname)) {
        try {
            variable_global_remove(varname);
        } catch (err) {
            // Do nothing if it fails
        }
    }
}

// --- obj_player Room Start ---
if (global.quiz_next_room != noone) {
    x = global.quiz_next_x;
    y = global.quiz_next_y;
}

// Clean up globals safely
safe_global_remove("quiz_next_x");
safe_global_remove("quiz_next_y");
safe_global_remove("quiz_next_room");
safe_global_remove("quiz_done_timer");
safe_global_remove("quiz_id");
