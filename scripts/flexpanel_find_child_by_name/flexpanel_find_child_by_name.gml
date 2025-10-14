/// @function flexpanel_find_child_by_name(panel, name)
/// @param panel The parent FlexPanel node
/// @param name The name of the child panel
/// @description Recursively finds a FlexPanel node by name

function flexpanel_find_child_by_name(panel, name) {
    if (panel == undefined) return undefined;
    if (panel.name == name) return panel;

    var n = array_length(panel.children);
    for (var i = 0; i < n; i++) {
        var result = flexpanel_find_child_by_name(panel.children[i], name);
        if (result != undefined) return result;
    }
    return undefined;
}
