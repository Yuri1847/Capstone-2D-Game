/// obj_QuestListManager - Create Event

ui_layer_id = layer_get_id("quest_list");
root_panel  = layer_get_flexpanel_node("questlist_panel");

if (root_panel == undefined) {
    show_debug_message("❌ No root flexpanel found on UI_Layer_Main");
} else {
    quest_panel   = flexpanel_find_child_by_name(root_panel, "QuestListPanel");
    content_panel = flexpanel_find_child_by_name(root_panel, "QuestListContent");

    if (quest_panel != undefined)
        show_debug_message("✅ Found QuestListPanel");
    if (content_panel != undefined)
        show_debug_message("✅ Found QuestListContent");
}
