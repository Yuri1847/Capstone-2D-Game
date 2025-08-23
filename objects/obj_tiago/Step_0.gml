//depth sorting
depth =-y;

//prevent moving when dialog is open
if(instance_exists(obj_dialog)) exit;

// Trigger movement toward Ibarra
if (!npc_trigger && instance_exists(obj_player)) {
    if (room == rm_tiagoHouse) {
        npc_trigger = true;
        path_start(pick_up_ibarra, 2, path_action_stop, false);
    }
}
// --- Detect movement manually ---
var moving = (x != last_x) || (y != last_y);
// If moving
if (moving) {
    last_dir = direction;
    image_speed = 1;

    if (direction >= 306 || direction <= 45) {
        sprite_index = spr_left_w_tiago;
        image_xscale = -1;
    }
    else if (direction >= 46 && direction <= 135) {
        sprite_index = spr_back_w_tiago;
        image_xscale = 1;
    }
    else if (direction >= 136 && direction <= 225) {
        sprite_index = spr_left_w_tiago;
        image_xscale = 1;
    }
    else if (direction >= 226 && direction <= 305) {
        sprite_index = spr_front_w_tiago;
        image_xscale = 1;
    }
}
// If idle
else {
    image_speed = 0;
    image_index = 0;

    if (last_dir >= 306 || last_dir <= 45) {
        sprite_index = spr_left_tiago;
        image_xscale = -1;
    }
    else if (last_dir >= 46 && last_dir <= 135) {
        sprite_index = spr_back_tiago;
        image_xscale = 1;
    }
    else if (last_dir >= 136 && last_dir <= 225) {
        sprite_index = spr_left_tiago;
        image_xscale = 1;
    }
    else if (last_dir >= 226 && last_dir <= 305) {
        sprite_index = spr_front_tiago;
        image_xscale = 1;
    }
}
// Store current position for next step
last_x = x;
last_y = y;



