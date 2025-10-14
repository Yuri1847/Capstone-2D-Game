/// obj_QuestListManager - Step Event
var scroll_speed = 12;

// Scroll wheel
if (mouse_wheel_up()) scroll_y = min(scroll_y + scroll_speed, 0);
if (mouse_wheel_down()) scroll_y = max(scroll_y - scroll_speed, -max_scroll);

// Apply offset to scrollable content
if (content_panel != undefined) {
    content_panel.y = scroll_y;
}
