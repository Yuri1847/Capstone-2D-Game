// 1️⃣ Ensure UI layer exists
var quest_layer = layer_get_id("QuestLayer");
if (quest_layer == -1) {
    quest_layer = layer_create("QuestLayer", "ui");
}
layer_set_visible(quest_layer, true);
layer_set_depth(quest_layer, -999999);

// 2️⃣ MAIN PANEL
main_panel = layer_create_element(quest_layer, "main_panel");
layer_element_set_layout(main_panel, layout_flex);
layer_element_set_layout_direction(main_panel, layout_direction_column);
layer_element_set_dock(main_panel, layer_dock_center);
layer_element_set_size(main_panel, 420, 500);
layer_element_set_style(main_panel, {
    background_colour: make_color_rgb(25, 25, 40),
    corner_radius: 12,
    padding: 10
});
layer_element_set_visible(main_panel, true);

// 3️⃣ SUB PANEL (child of main)
sub_panel = layer_create_element(main_panel, "sub_panel");
layer_element_set_layout(sub_panel, layout_flex);
layer_element_set_layout_direction(sub_panel, layout_direction_column);
layer_element_set_size(sub_panel, 400, 480);
layer_element_set_style(sub_panel, {
    background_colour: make_color_rgb(35, 35, 55),
    corner_radius: 8,
    padding: 8
});
layer_element_set_visible(sub_panel, true);

// 4️⃣ TEXT PANEL (child of sub_panel)
text_panel = layer_create_element(sub_panel, "text_panel");
layer_element_set_layout(text_panel, layout_flex);
layer_element_set_layout_direction(text_panel, layout_direction_row);
layer_element_set_style(text_panel, {
    background_colour: make_color_rgb(45, 45, 65),
    corner_radius: 6,
    padding: 4
});
layer_element_set_visible(text_panel, true);

// 5️⃣ TITLE (child of text_panel)
var title = layer_create_element(text_panel, "title");
layer_element_set_text(title, "Quest Log");
layer_element_set_style(title, {
    text_colour: c_white,
    text_size: 22,
    text_bold: true
});
layer_element_set_visible(title, true);

// 6️⃣ QUESTLIST PANEL (child of sub_panel)
questlist_panel = layer_create_element(sub_panel, "questlist_panel");
layer_element_set_layout(questlist_panel, layout_flex);
layer_element_set_layout_direction(questlist_panel, layout_direction_column);
layer_element_set_style(questlist_panel, {
    background_colour: make_color_rgb(50, 50, 70),
    corner_radius: 6,
    padding: 6
});
layer_element_set_visible(questlist_panel, true);

// 7️⃣ Add test entries (so you can see them)
for (var i = 0; i < 3; i++) {
    var entry = layer_create_element(questlist_panel, "quest_entry_" + string(i));
    layer_element_set_text(entry, "Quest #" + string(i + 1) + ": Example quest description");
    layer_element_set_style(entry, {
        text_colour: c_yellow,
        text_size: 14
    });
    layer_element_set_visible(entry, true);
}

// 8️⃣ Debug checks
show_debug_message("QuestUI created successfully on layer ID " + string(quest_layer));
