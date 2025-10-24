function scr_story_next() {
    if (!variable_global_exists("story_quests")) return;
    if (!variable_global_exists("current_story_index")) return;

    var i = global.current_story_index;

    // Safety: make sure index is valid
    if (i < 0 || i >= array_length(global.story_quests)) return;

    // Mark current as completed
    global.story_quests[i].completed = true;

    // Move to next quest if available
    if (i < array_length(global.story_quests) - 1) {
        global.current_story_index = i + 1;
    } else {
        // Optional: mark all done
        global.current_story_index = array_length(global.story_quests) - 1;
        global.story_quests[i].completed = true;
        show_debug_message("✅ All story quests completed!");
    }
}