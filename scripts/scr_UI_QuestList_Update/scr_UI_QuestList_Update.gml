/// @func scr_UI_QuestList_Update()
/// @desc Refresh the quest list inside ui_quest_container

// Safety: make sure ui_quest_container exists
if (!variable_global_exists("ui_quest_container")) exit;
if (ui_quest_container == noone) exit;

// ✅ Destroy old entries first
var children = layer_element_get_children(ui_quest_container);
for (var i = 0; i < array_length(children); i++) {
    layer_element_destroy(children[i]);
}

// ✅ Get quest keys
var keys = ds_map_keys(global.quests);

for (var i = 0; i < ds_list_size(keys); i++) {
    var idq = keys[| i];
    var q = global.quests[? idq];

    var color;

	switch (q[? "status"]) {
	    case "completed":
	        color = c_lime;
	        break;

	    case "active":
	        color = c_yellow;
	        break;

	    default:
	        color = c_gray;
	        break;
	}


    // 🟩 Quest Entry Container
    var entry = layer_create_element(ui_quest_container, "QuestEntry_" + idq);
    layer_element_set_layout(entry, layout_flex);
    layer_element_set_layout_direction(entry, layout_direction_column);
    layer_element_set_style(entry, {
        background_colour: make_color_rgb(40, 40, 55),
        corner_radius: 8,
        padding: 8
    });

    // 📝 Quest Name
    var txt_name = layer_create_element(entry, "QuestName_" + idq);
    layer_element_set_text(txt_name, q[? "name"]);
    layer_element_set_style(txt_name, {
        text_colour: color,
        text_size: 16,
        text_bold: true
    });

    // 📄 Quest Description
    var txt_desc = layer_create_element(entry, "QuestDesc_" + idq);
    layer_element_set_text(txt_desc, q[? "desc"]);
    layer_element_set_style(txt_desc, {
        text_colour: c_silver,
        text_size: 14
    });
}

ds_list_destroy(keys);
