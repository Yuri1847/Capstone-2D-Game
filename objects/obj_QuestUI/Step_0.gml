if (!ui_ready) {
    // Wait until the UI Layer system is available
    if (function_exists(layer_create_element)) {
        // Create or get the layer
        ui_layer_id = layer_get_id(ui_layer_name);
        if (ui_layer_id == -1) {
            ui_layer_id = layer_create(ui_layer_name, "QuestPanel");
        }

        // Now it’s safe to create UI elements
        ui_panel = layer_create_element(ui_layer_id, "QuestPanel");
        layer_element_set_position(ui_panel, 32, 32);
        layer_element_set_size(ui_panel, 300, 400);
        layer_element_set_background_color(ui_panel, c_black);
        layer_element_set_alpha(ui_panel, 0.6);

        ui_title = layer_create_element(ui_layer_id, "QuestTitle");
        layer_element_set_text(ui_title, "Active Quests");
        layer_element_set_position(ui_title, 48, 48);
        layer_element_set_font(ui_title, fnt_default);
        layer_element_set_color(ui_title, c_white);

        ui_ready = true;
    }
}
