for (var i = 0; i < array_length(notifications); i++) {
    var n = notifications[i];
    n.timer -= 1;

    if (n.timer <= room_speed / 2) {
        // fade out
        layer_element_set_alpha(n.element, n.timer / (room_speed / 2));
    }

    if (n.timer <= 0) {
        if (layer_element_exists(n.element)) layer_element_destroy(n.element);
        array_delete(notifications, i, 1);
        i -= 1;
    }
}
