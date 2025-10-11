if (!variable_global_exists("quests")) exit;


if (!visible) exit;

var xq = 50;
var yq = 80;

draw_set_font(fn_ui);
draw_set_color(c_white);
draw_text(xq, yq - 40, "QUEST LOG");
draw_rectangle(xq - 20, yq - 20, xq + 400, yq + 400, false);

// Draw quest list
var keys = ds_map_keys(global.quests);

for (var i = 0; i < ds_list_size(keys); i++) {
    var idq = keys[| i];
    var q = global.quests[? idq];

    // ✅ GML uses if/else instead of ?:
    var color;
    if (q[? "status"] == "completed") {
        color = c_lime;
    } else if (q[? "status"] == "active") {
        color = c_yellow;
    } else {
        color = c_gray;
    }

    draw_set_color(color);
    draw_text(xq, yq + (i * 30), q[? "name"] + " [" + q[? "status"] + "]");
}

ds_list_destroy(keys);
