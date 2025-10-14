var quest_layer_name = "quest_layer";

// Ensure UI layer exists
if (!layer_exists(quest_layer_name)) {
    show_debug_message("❌ Layer 'quest_layer' does not exist!");
    exit;
}

// Try to get flex root
var root_panel = layer_get_flexpanel_node(quest_layer_name);

// If there's no flex root, create one!
if (root_panel == undefined) {
    show_debug_message("⚠️ No flexpanel root found, creating one...");
    root_panel = layer_create_flexpanel(quest_layer_name, "root_panel");
}

// Now safe to search children
sub_panel       = flexpanel_find_child_by_name(root_panel, "sub_panel");
questlist_panel = flexpanel_find_child_by_name(sub_panel, "questlist_panel");

/// @desc Initializes quest list and scroll setup

var quest_layer_name = "quest_layer";
var root_panel = layer_get_flexpanel_node(quest_layer_name);

if (root_panel == undefined) {
    show_debug_message("❌ No flexpanel root in " + quest_layer_name);
    exit;
}

// Get sub-panels using global helper
sub_panel       = flexpanel_find_child_by_name(root_panel, "sub_panel");
questlist_panel = flexpanel_find_child_by_name(sub_panel, "questlist_panel");

if (questlist_panel == undefined) {
    show_debug_message("❌ questlist_panel not found!");
    exit;
}
show_debug_message("✅ Found questlist_panel");

// Scroll setup
scroll_y = 0;
scroll_speed = 24;
max_scroll = 0;

// Quest data
quests = [
    { title: "Find the Lost Relic", desc: "Return it to the temple.", status: "Active" },
    { title: "Speak to the Mayor", desc: "Ask about missing people.", status: "Completed" },
    { title: "Defeat the Goblin King", desc: "Deep inside the old mine.", status: "Active" },
    { title: "Collect 10 Herbs", desc: "For the healer.", status: "Active" },
    { title: "Explore Ancient Ruins", desc: "Optional side quest.", status: "Inactive" },
    { title: "Save the Merchant", desc: "Stuck near the river crossing.", status: "Active" },
    { title: "Retrieve the Magic Scroll", desc: "Hidden in the library.", status: "Active" },
    { title: "Deliver Letter", desc: "Send message to the guard captain.", status: "Completed" },
];

// Dynamically add quest rows
var y_offset = 0;
for (var i = 0; i < array_length(quests); i++) {
    var q = quests[i];

    var row = flexpanel_add_child(questlist_panel, "quest_row_" + string(i));
    row.width_policy  = ui_size_policy.percent;
    row.width_percent = 100;
    row.height_policy = ui_size_policy.pixel;
    row.height_pixel  = 64;
    row.align_self = ui_align.start;
    row.y = y_offset;

    // Store quest info
    row.quest_title = q.title;
    row.quest_desc = q.desc;
    row.quest_status = q.status;

    y_offset += 68;
}

// Scroll bounds
var total_height = y_offset;
var visible_height = 363; // questlist_panel height
max_scroll = -(total_height - visible_height);
if (max_scroll > 0) max_scroll = 0;

// Save references for Renderer
global.quest_root_panel = root_panel;
global.questlist_panel  = questlist_panel;
global.scroll_y         = scroll_y;
global.max_scroll       = max_scroll;
