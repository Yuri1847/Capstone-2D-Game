/*if (keyboard_check_pressed(ord("Q")) || keyboard_check_pressed(vk_tab)) {
    if (!instance_exists(obj_QuestUI)) {
        instance_create_layer(0, 0, "quest_ui_layer", obj_QuestUI);
        show_debug_message("Created obj_QuestUI");
    } else {
        with (obj_QuestUI) {
            visible = !visible;
            show_debug_message("Toggled Quest UI: " + string(visible));
        }
    }
}*/







/// Step Event - obj_QuestManager

if (keyboard_check_pressed(ord("Q")) || keyboard_check_pressed(vk_tab)) {
    if (!instance_exists(obj_QuestUI)) {
        instance_create_layer(0, 0, "quest_ui_layer", obj_QuestUI);
    } else {
        with (obj_QuestUI) visible = !visible;
    }
}
