/// Initialize quest system
global.quests = ds_map_create();

// Example quest
var q = scr_Quest_Create("Help the Farmer", "Find the farmer’s missing chicken.", "Side");
global.quests[? "farmer_quest"] = q;

// Optional quest notification state
global.quest_notify_el = noone;
global.quest_notify_timer = 0;
