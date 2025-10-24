
function scr_story_next(show_message = true) {
    if (!variable_global_exists("story_quests")) return;
    if (!variable_global_exists("current_story_index")) return;

    var i = global.current_story_index;

    // Safety: make sure index is valid
    if (i < 0 || i >= array_length(global.story_quests)) return;

    var current = global.story_quests[i];

    // Mark current as completed
    current.completed = true;
    global.story_quests[i] = current;

    // Show popup if requested
    if (show_message) {
        // create or call the popup object
        // if you made show_popup script: scr_show_popup("Objective Complete");
        // or call the object method:
        show_popup("Objective Complete", 180);

    }

    // Move to next quest if available
    if (i < array_length(global.story_quests) - 1) {
        global.current_story_index = i + 1;

        if (show_message) {
            var next_obj = global.story_quests[global.current_story_index];
            show_debug_message("New Objective: " + string(next_obj.title));
        }
    } else {
        // Story completed
        global.current_story_index = array_length(global.story_quests) - 1;
        show_debug_message("🎉 All story quests completed!");
    }
}