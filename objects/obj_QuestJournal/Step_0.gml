// Scroll handling
if (mouse_wheel_up()) scroll_offset = clamp(scroll_offset - scroll_speed, 0, 9999);
if (mouse_wheel_down()) scroll_offset += scroll_speed;

// Update UI periodically for performance
update_timer += 1;
if (update_timer >= update_interval) {
    update_timer = 0;

    var quest_list = global.QuestManager.get_active_quests();

    // Clear old elements
    for (var i = 0; i < array_length(quest_elements); i++) {
        if (layer_element_exists(quest_elements[i])) layer_element_destroy(quest_elements[i]);
    }
    quest_elements = [];

    var yq = 80 - scroll_offset;

    for (var i = 0; i < ds_list_size(quest_list); i++) {
        var q = quest_list[| i];
        
        var title_elem = layer_create_element(layer_id, "QuestJournal_Title_" + string(i));
        layer_element_set_text(title_elem, q.title);
        layer_element_set_font(title_elem, fnt_default);
        layer_element_set_color(title_elem, q.completed ? c_lime : c_white);
        layer_element_set_position(title_elem, 48, yq);
        array_push(quest_elements, title_elem);

        yq += 24;

        var desc_elem = layer_create_element(layer_id, "QuestJournal_Desc_" + string(i));
        layer_element_set_text(desc_elem, q.description);
        layer_element_set_font(desc_elem, fnt_small);
        layer_element_set_color(desc_elem, c_silver);
        layer_element_set_position(desc_elem, 64, yq);
        array_push(quest_elements, desc_elem);

        yq += 48;
    }

    ds_list_destroy(quest_list);
}
if (!ui_ready) {
    // Wait until the UI system is active
    if (function_exists(layer_create_element)) {
        ui_layer_id = layer_get_id(ui_layer_name);

        if (ui_layer_id == -1) {
            ui_layer_id = layer_create(ui_layer_name, "QuestLayer");
        }

        // --- Create UI elements safely now ---
        ui_panel = layer_create_element(ui_layer_id, "QuestJournal_Panel");
        layer_element_set_position(ui_panel, 24, 24);
        layer_element_set_size(ui_panel, 400, 500);
        layer_element_set_background_color(ui_panel, make_color_rgb(30, 30, 30));
        layer_element_set_alpha(ui_panel, 0.9);

        ui_title = layer_create_element(ui_layer_id, "QuestJournal_Title");
        layer_element_set_text(ui_title, "Quest Journal");
        layer_element_set_font(ui_title, fnt_default);
        layer_element_set_color(ui_title, c_white);
        layer_element_set_position(ui_title, 48, 40);

        scroll_offset = 0;
        scroll_speed = 8;
        quest_elements = [];
        update_timer = 0;
        update_interval = room_speed / 2;

        ui_ready = true;
    }
}
