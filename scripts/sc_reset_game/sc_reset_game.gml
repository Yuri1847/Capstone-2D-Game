/// @function sc_reset_game()
/// @description Clears all save file contents and resets game to default state

function sc_reset_game() {
    // 1️⃣ Create empty buffers to overwrite files
    var _buffer = buffer_create(1, buffer_fixed, 1);
    buffer_write(_buffer, buffer_string, "");

    // 2️⃣ Overwrite the save and settings files with blank data
    buffer_save(_buffer, "NolimeTaaa.txt");
    buffer_save(_buffer, "Settings.txt");
    buffer_delete(_buffer);

    // 3️⃣ Reset global variables in memory
    global.file_handling_data = {
        player_x: 320,
        player_y: 384,
        last_room: rm_fondeDeLala,
        player_inventory: []
    };

    global.settings_data = {
        state_slot : [
            { date: "", time: "", background: 0 },
            { date: "", time: "", background: 0 },
            { date: "", time: "", background: 0 }
        ],
        audio: {
            sound_effect_value: 0.8,
            background_music_value: 0.5
        }
    };

    // 4️⃣ (Optional) Immediately save the new default data to the blank files
    file_handling_save_game();
    settings_save_game();

    // 5️⃣ Notify and return to title or main menu
    show_message_async("Game reset complete!");
    room_goto(rm_main_menu);
}
