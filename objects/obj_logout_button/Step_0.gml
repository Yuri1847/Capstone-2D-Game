/// @description Handle click input

var _mx = device_mouse_x_to_gui(0);
var _my = device_mouse_y_to_gui(0);

if (mouse_check_button_pressed(mb_left)) {
    if (point_in_rectangle(_mx, _my, btn_x, btn_y, btn_x + btn_w, btn_y + btn_h)) {

        // ✅ 1. Clear the active profile
        global.current_profile = -1;

        // ✅ 2. Reset game state (back to defaults)
        global.file_handling_data = {
            player_x: 320,
            player_y: 384,
            last_room: rm_fondeDeLala,
            player_inventory: [],
            current_chapter: 0
        };

        // ✅ 3. Optionally reset temporary data (e.g., player health, flags)
        if (variable_global_exists("player_health")) global.player_health = 100;

        // ✅ 4. Go back to profile select
        room_goto(rm_profile_select);
    }
}
