/// @desc Draw quest rows manually (UI layer overlay)

if (!layer_exists("quest_layer")) exit;

var root_panel = global.quest_root_panel;
if (root_panel == undefined) exit;

// Get questlist_panel safely
var sub_panel = flexpanel_find_child_by_name(root_panel, "sub_panel");
var questlist_panel = flexpanel_find_child_by_name(sub_panel, "questlist_panel");
if (questlist_panel == undefined) exit;

// Draw each quest row
for (var i = 0; i < array_length(questlist_panel.children); i++) {
    var row = questlist_panel.children[i];

    var ry = row.y + global.scroll_y;
    if (ry + row.height_pixel < 0 || ry > 363) continue; // clip to visible area

    // Background
    draw_set_color(make_color_rgb(48,48,48));
    draw_rectangle(20, ry, 966, ry + row.height_pixel - 4, false);

    // Text
    draw_set_color(c_white);
    draw_text(40, ry + 10, row.quest_title);
    draw_set_color(c_ltgray);
    draw_text(40, ry + 30, row.quest_desc + " (" + row.quest_status + ")");
}

// Optional scrollbar
var total_height = array_length(questlist_panel.children) * 68;
var visible_height = 363;
var bar_height = visible_height * (visible_height / total_height);
var bar_y = -global.scroll_y * (visible_height / total_height);

draw_set_color(c_ltgray);
draw_rectangle(986 - 16, bar_y + 4, 986 - 8, bar_y + bar_height - 4, false);
