function scr_story_get_current() {
    if (!variable_global_exists("story_quests")) return undefined;
    if (!variable_global_exists("current_story_index")) return undefined;

    var i = global.current_story_index;
    if (i < 0 || i >= array_length(global.story_quests)) return undefined;

    return global.story_quests[i];
}