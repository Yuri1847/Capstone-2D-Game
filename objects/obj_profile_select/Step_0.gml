/// obj_profile_select Step
var mx = device_mouse_x_to_gui(0);
var my = device_mouse_y_to_gui(0);

// compute hovered slot
hover_slot = -1;
for (var i = 0; i < global.profile_count; ++i) {
    var yp = slot_y0 + i * (slot_h + slot_spacing);
    if (mx > slot_x1 && mx < slot_x2 && my > yp && my < yp + slot_h) {
        hover_slot = i;
        break;
    }
}

// Left click handling
if (mouse_check_button_pressed(mb_left) && hover_slot != -1) {
    var slot = global.profiles[hover_slot];

    if (slot.name == "") {
        // Create new profile: show a quick default name and immediately create
        global.profiles[hover_slot].name = "Player " + string(hover_slot + 1);
        global.profiles[hover_slot].last_save = "";
        global.profiles[hover_slot].summary = "New Game";
        profile_system_save();

        // set current profile and proceed to new game flow
        global.current_profile = hover_slot;

        // initialize your default file_handling_data for a fresh start:
        global.file_handling_data = {
            player_x: 320,
            player_y: 384,
            last_room: rm_main_menu, // replace with your starting room
            player_inventory: [],
            current_chapter: 0
        };
        // Save initial slot state
        profile_slot_save_game(global.current_profile);

        // Go to main menu or start game
        room_goto(rm_main_menu);
    } else {
        // Occupied slot -> open options: Load (left-click) or Show delete prompt (right-click)
        global.current_profile = hover_slot;
        // load the game data for that slot
        var ok = profile_slot_load_game(global.current_profile);
        if (ok) {
            // successfully loaded: go to main menu or resume game
            room_goto(rm_main_menu);
        } else {
            // If slot is corrupt/no save file, treat as new or give choice; here we attempt new initialization
            // Initialize a blank game and save it immediately
            global.file_handling_data = {
                player_x: 320,
                player_y: 384,
                last_room: rm_fondeDeLala,
                player_inventory: [],
                current_chapter: 0
            };
            profile_slot_save_game(global.current_profile);
            room_goto(rm_main_menu);
        }
    }
}

// Right click on a slot to prompt delete/overwrite
if (mouse_check_button_pressed(mb_right) && hover_slot != -1) {
    confirm_delete = hover_slot;
}
