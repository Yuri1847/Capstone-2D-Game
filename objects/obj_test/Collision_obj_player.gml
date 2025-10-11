// Create a local variable to track conversation state if not defined yet
if (!variable_instance_exists(id, "talked")) talked = false;

// Only trigger if not already talking
if (!talked) {
    var q = global.quests[? "farmer_quest"];
    if (is_undefined(q)) exit;

    if (q[? "status"] == "inactive") {
        scr_Quest_Activate("farmer_quest");
        show_message("Farmer: Please help me find my chicken!");
        talked = true;
    }
    else if (q[? "status"] == "active") {
        // only check for player_has_chicken if it exists
        if (variable_instance_exists(other, "player_has_chicken") && other.player_has_chicken) {
            scr_Quest_Complete("farmer_quest");
            show_message("Farmer: Thank you! You found it!");
            talked = true;
        }
    }
}
