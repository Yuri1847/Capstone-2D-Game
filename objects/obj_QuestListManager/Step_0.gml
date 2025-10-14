/// @desc Handle scrolling

if (mouse_wheel_up()) scroll_y = min(scroll_y + scroll_speed, 0);
if (mouse_wheel_down()) scroll_y = max(scroll_y - scroll_speed, max_scroll);

// Apply to UI
if (questlist_panel != undefined) {
    questlist_panel.y = scroll_y;
}

// Keep globals updated for renderer
global.scroll_y = scroll_y;
global.max_scroll = max_scroll;
