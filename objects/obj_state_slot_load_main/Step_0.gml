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
						//state slot 1
								if(global.settings_data.state_slot[0].date != "" && global.settings_data.state_slot[0].time != ""){
									
									sc_invisible_layer(["load_game_menu_layer"])
									sc_visible_layer(["load_slot1_main_dialog_layer"])
									instance_activate_object(obj_dialog_box_shadow)
									instance_deactivate_object(id)
								}else {
									show_toast("Empty slot 1")
								}
		                    break;
		                case 1:
						//state slot 2
								if(global.settings_data.state_slot[1].date != "" && global.settings_data.state_slot[1].time != ""){
									
									sc_invisible_layer(["load_game_menu_layer"])
									sc_visible_layer(["load_slot2_main_dialog_layer"])
									instance_activate_object(obj_dialog_box_shadow)
									instance_deactivate_object(id)
								}else {
									show_toast("Empty slot 2")
								}
		                    break;
		                case 2:
						//state slot 3
								if(global.settings_data.state_slot[2].date != "" && global.settings_data.state_slot[2].time != ""){
									
									sc_invisible_layer(["load_game_menu_layer"])
									sc_visible_layer(["load_slot3_main_dialog_layer"])
									instance_activate_object(obj_dialog_box_shadow)
									instance_deactivate_object(id)
								}else {
									show_toast("Empty slot 3")
								}
		                    break;
		            }
				
			}
				
		// Update last click time
        last_click_time = now_time;
        }
    }
}
