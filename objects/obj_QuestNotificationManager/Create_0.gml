layer_id = layer_get_id("QuestLayer");
notifications = []; // store active notification elements
fade_time = room_speed * 2; // 2 seconds

add_notification = function(_title) {
    var yq = 32 + array_length(notifications) * 48;
    var elem = layer_create_element(layer_id, "Notif_" + string(current_time));
    layer_element_set_text(elem, "Quest Completed: " + _title);
    layer_element_set_font(elem, fnt_default);
    layer_element_set_color(elem, c_yellow);
    layer_element_set_position(elem, 32, yq);
    layer_element_set_alpha(elem, 0);
    layer_element_animate(elem, "alpha", 1, 0.25); // smooth fade-in

    var info = {
        element: elem,
        timer: fade_time
    };
    array_push(notifications, info);
};
