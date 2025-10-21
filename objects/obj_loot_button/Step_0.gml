if(!isEnabled) exit;
// obj_talk_button Step Event
if (mouse_check_button_pressed(mb_left)) {
    var tx = device_mouse_x_to_gui(0);
    var ty = device_mouse_y_to_gui(0);

    if (point_in_rectangle(tx, ty, x, y, x + sprite_get_width(spr_loot_button), y + sprite_get_height(spr_loot_button))) {
		loot_button_pressed = true;
    }
}

if(!place_meeting(obj_player.x, obj_player.y, obj_loot_item_parent)){
	isEnabled = false;
}