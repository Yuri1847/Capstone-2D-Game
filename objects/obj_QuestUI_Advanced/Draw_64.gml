if (!variable_global_exists("quests")) exit;


if (!visible) exit;

// Background panel
draw_set_color(make_color_rgb(20, 20, 20));
draw_rectangle(ui_x, ui_y, ui_x + ui_w, ui_y + ui_h, false);
draw_set_color(c_white);
draw_text(ui_x + 8, ui_y - 24, "QUEST JOURNAL");

// Divider line
draw_line(ui_x + 300, ui_y, ui_x + 300, ui_y + ui_h);

// --- Quest List ---
var keys = ds_map_keys(global.quests);
var total_quests = ds_list_size(keys);
var start_index = scroll_offset;
var end_index = min(start_index + max_display, total_quests);

for (var i = start_index; i < end_index; i++) {
    var qid = keys[| i];
    var q = global.quests[? qid];
    var yq = ui_y + 48 + ((i - start_index) * row_height);

    // Determine color manually
    var color;
    if (q[? "status"] == "completed") {
        color = c_lime;
    } else if (q[? "status"] == "active") {
        color = c_yellow;
    } else {
        color = c_gray;
    }

    // Highlight selected quest
    if (i == selected_index) {
        draw_set_color(make_color_rgb(60, 60, 90));
        draw_rectangle(ui_x + 12, yq - 4, ui_x + 288, yq + row_height - 8, false);
    }

    draw_set_color(color);
    draw_text(ui_x + 24, yq, q[? "name"]);
}

// --- Selected Quest Details ---
if (selected_index >= 0 && selected_index < total_quests) {
    var qid = keys[| selected_index];
    var q = global.quests[? qid];

    draw_set_color(c_white);
    draw_text(ui_x + 320, ui_y + 48, q[? "name"]);

    draw_set_color(c_ltgray);
    draw_text_ext(ui_x + 320, ui_y + 80, q[? "desc"], -1, 340);

    draw_set_color(c_yellow);
    draw_text(ui_x + 320, ui_y + ui_h - 60,
        "Status: " + string(q[? "status"]) +
        "  Progress: " + string(q[? "progress"]) + "/" + string(q[? "goal"]));
}

ds_list_destroy(keys);
