if(!isEnabled) exit;

var mx = device_mouse_x_to_gui(0);
var my = device_mouse_y_to_gui(0);

var now = date_current_datetime();

//date
year  = date_get_year(now);
month = date_get_month(now);
day   = date_get_day(now);

//time
hour   = date_get_hour(now);
minute = string_format(date_get_minute(now), 2, 0);
second = string_format(date_get_second(now), 2, 0);

ampm = "AM";
if (hour >= 12) {
    ampm = "PM";
    if (hour > 12) hour -= 12;
}
if (hour == 0) hour = 12;


for (var i = 0; i < 3; i++) {
    var xx = ui_pos_x + ((state_slot_width + spaceBetweenItem) * i);

    var btn_y1 = ui_pos_y - sprite_get_height(spr_ui_state_slot) / 2;
    var btn_y2 = ui_pos_y + sprite_get_height(spr_ui_state_slot) / 2;
    var btn_x1 = xx - state_slot_width / 2;
    var btn_x2 = xx + state_slot_width / 2;

    // Check click
    if (mouse_check_button_released(mb_left)) {
        if (sc_is_between(mx, btn_x1, btn_x2) && sc_is_between(my, btn_y1, btn_y2)) {

			var now_time = current_time; // milliseconds since game start

            if(now_time - last_click_time <= double_click_speed){
				
					show_debug_message("Button " + string(i) + " clicked!");
				
					switch (i) {
	                case 0:
					//sfx
						var sfx_id = audio_play_sound(snd_saved_slot, 1, false);
						// apply slider’s volume immediately
						if (instance_exists(obj_settings_options)) {
							audio_sound_gain(sfx_id, obj_settings_options.slider_sfx_value, 0);
						}
						// random pitch
						audio_sound_pitch(sfx_id, random_range(0.95, 1.05));
					//state slot 1
						global.settings_data.state_slot[0].date = string(month) + "/" +string(day) + "/" + string(year);
						global.settings_data.state_slot[0].time = string(hour) + ":" + minute + ":" + second + " " + ampm;
						global.settings_data.state_slot[0].background = 1;
						settings_save_game()
					
						global.state_slot1_data.player_x = obj_player.x;
						global.state_slot1_data.player_y = obj_player.y;
						global.state_slot1_data.last_room = room_get_name(room);
						//global.state_slot1_data.player_inventory = ;
						state_slot1_save_game()
					
						show_toast("Successfully save game from slot 1")
	                    break;
	                case 1:
					//sfx
						var sfx_id = audio_play_sound(snd_saved_slot, 1, false);
						// apply slider’s volume immediately
						if (instance_exists(obj_settings_options)) {
							audio_sound_gain(sfx_id, obj_settings_options.slider_sfx_value, 0);
						}
						// random pitch
						audio_sound_pitch(sfx_id, random_range(0.95, 1.05));
					//state slot 2
						global.settings_data.state_slot[1].date = string(month) + "/" +string(day) + "/" + string(year);
						global.settings_data.state_slot[1].time = string(hour) + ":" + minute + ":" + second + " " + ampm;
						global.settings_data.state_slot[1].background = 1;
						settings_save_game()
					
						global.state_slot2_data.player_x = obj_player.x;
						global.state_slot2_data.player_y = obj_player.y;
						global.state_slot2_data.last_room = room_get_name(room);
						//global.state_slot2_data.player_inventory = ;
						state_slot2_save_game()
					
						show_toast("Successfully save game from slot 2")
	                    break;
	                case 2:
					//sfx
						var sfx_id = audio_play_sound(snd_saved_slot, 1, false);
						// apply slider’s volume immediately
						if (instance_exists(obj_settings_options)) {
							audio_sound_gain(sfx_id, obj_settings_options.slider_sfx_value, 0);
						}
						// random pitch
						audio_sound_pitch(sfx_id, random_range(0.95, 1.05));
					//state slot 3
						global.settings_data.state_slot[2].date = string(month) + "/" +string(day) + "/" + string(year);
						global.settings_data.state_slot[2].time = string(hour) + ":" + minute + ":" + second + " " + ampm;
						global.settings_data.state_slot[2].background = 1;
						settings_save_game()
					
						global.state_slot3_data.player_x = obj_player.x;
						global.state_slot3_data.player_y = obj_player.y;
						global.state_slot3_data.last_room = room_get_name(room);
						//global.state_slot3_data.player_inventory = ;
						state_slot3_save_game()
					
						show_toast("Successfully save game from slot 3")
	                    break;
	            }
				
			}
			
			// Update last click time
			last_click_time = now_time;
			
        }
    }
}
