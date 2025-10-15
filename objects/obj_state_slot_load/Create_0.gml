state_slot_width = sprite_get_width(spr_ui_state_slot);
spaceBetweenItem = 15 ;

settings_load_game();

last_click_time = 0;
double_click_speed = 300; // milliseconds allowed between clicks
click_count = 0;

//titles per slot
state_slot_title = [

	"Slot 1",
	"Slot 2",
	"Slot 3"

];

isEnabled = false;

//Center inside Viewport
//for mobile
//ui_pos_x = (display_get_width() / 2 - 813/3);
//ui_pos_y = (display_get_height() / 2);

//for pc resolution
ui_pos_x = (display_get_gui_width() / 2 - 813/3);
ui_pos_y = (display_get_gui_height() / 2);


