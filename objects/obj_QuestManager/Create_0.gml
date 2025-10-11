// ✅ Prevent duplicates
if (instance_number(obj_QuestManager) > 1) {
    instance_destroy();
    exit;
}

// ✅ Initialize global quest data (only once)
if (!variable_global_exists("quests")) {
    global.quests = ds_map_create();
    global.quest_timer = 0;
    global.quest_message = "";
    global.activeQuests = [];

    // Example Quest
    var q1 = scr_Quest_Create("Help the Farmer", "Find and return the farmer’s lost chicken.", "Side");
    q1[? "goal"] = 1;
    global.quests[? "farmer_quest"] = q1;
}
