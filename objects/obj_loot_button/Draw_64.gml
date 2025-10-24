if(!isEnabled) exit;

var area = scr_get_camera_gui_area()

button_margin = 256;


btn_x = area.x + area.w - button_margin - sprite_get_width(spr_loot_button);
btn_y = area.y + (area.h - sprite_get_height(spr_loot_button))/1.4;


// obj_talk_button Step Event
if (mouse_check_button_pressed(mb_left)) {
    var tx = device_mouse_x_to_gui(0);
    var ty = device_mouse_y_to_gui(0);

    if (point_in_rectangle(tx, ty, btn_x, btn_y, btn_x + sprite_get_width(spr_loot_button), btn_y + sprite_get_height(spr_loot_button))) {
		loot_button_pressed = true;
    }
}

if(!place_meeting(obj_player.x, obj_player.y, obj_loot_item_parent)){
	isEnabled = false;
}



draw_sprite(spr_loot_button, -1, btn_x, btn_y);