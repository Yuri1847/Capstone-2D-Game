//depth sorting
depth =-y;


//kapitan tiago will go to ibarra to pick up to sala
if (!npc_trigger and instance_exists(obj_player)) {
    if (room == rm_tiagoHouse) { // Check if in same room
        npc_trigger = true;
        path_start(pick_up_ibarra, 2, path_action_stop, false);
    }
}
if(direction >= 306 or direction <= 45){
	sprite_index = spr_left_w_tiago;
	image_xscale = -1;
}
if(direction >= 46 and direction <= 135){
	sprite_index = spr_back_w_tiago;
	image_xscale = 1;
}
if(direction >= 136 and direction <= 225){
	sprite_index = spr_left_w_tiago;
	image_xscale = 1;
}
if(direction >= 226 and direction <= 305){
	sprite_index = spr_front_w_tiago;
	image_xscale = 1;
}


