/// obj_QuestUI - Create Event
/// Purpose: Initialize Quest UI from existing UI layer elements (no dynamic creation)

// --- Step 1: Get the UI layer ID
quest_layer_id = layer_get_id("quest_layer");

if (quest_layer_id == -1) {
    show_debug_message("[QuestUI] ERROR: QuestLayer not found in room!");
    exit;
}

// --- Step 2: Get the existing UI elements by name
main_panel       = layer_get_element_from_name("main_panel");
sub_panel        = layer_get_element_from_name("sub_panel");
text_panel       = layer_get_element_from_name("text_panel");
title_text       = layer_get_element_from_name("title");
questlist_panel  = layer_get_element_from_name("questlist_panel");

// --- Step 3: Get quest text entries (already in questlist_panel)
// Get references to the instances by name
questentry1 = instance_find(fn_ui, 0); // or better: layer_instance_get_first("QuestLayer", fn_ui);
questentry2 = instance_find(fn_ui, 1);
questentry3 = instance_find(fn_ui, 2);

// --- Step 4: Ensure all panels are visible
layer_set_visible(quest_layer_id, true);

if (main_panel != -1)      layer_element_set_visible(main_panel, true);
if (sub_panel != -1)       layer_element_set_visible(sub_panel, true);
if (text_panel != -1)      layer_element_set_visible(text_panel, true);
if (title_text != -1)      layer_element_set_visible(title_text, true);
if (questlist_panel != -1) layer_element_set_visible(questlist_panel, true);

// --- Step 5: Set title text
if (title_text != -1)
    layer_element_set_text(title_text, "Active Quests");

// --- Step 6: Manually set quest text and color

// Make sure they exist
if (instance_exists(questentry1)) {
    questentry1.text = "Find Maria Clara";
    questentry1.color = c_yellow;
}

if (instance_exists(questentry2)) {
    questentry2.text = "Meet Padre Damaso";
    questentry2.color = c_gray;
}

if (instance_exists(questentry3)) {
    questentry3.text = "Return to Binondo";
    questentry3.color = c_lime;
}

// --- Step 7: Optional – Start hidden until toggled
ui_visible = false;
if (main_panel != -1)
    layer_element_set_visible(main_panel, ui_visible);
