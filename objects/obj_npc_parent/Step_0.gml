// Always update depth
depth = -y;

// Check if dialogue is already active
if (instance_exists(obj_dialog)) {
    dialogue_active = true;
} else {
    dialogue_active = false;
}

// Check distance to player
if (instance_exists(obj_player)) {
    var dist = distance_to_object(obj_player);
    
    if (dist < 16) {
        can_talk = true;
        // Only create dialogue when player presses key and no dialogue is running
        if (!dialogue_active && keyboard_check_pressed(input_key)) {
            npc_can_move = false;          // lock NPC
            create_dialogue(dialog);   // pass self as speaker
        }
    } else {
        can_talk = false;
    }
}














/*
depth =-y;

if(instance_exists(obj_dialog)) exit;

if(instance_exists(obj_player) && distance_to_object(obj_player) < 16){
	//sc_visible_layer(["talk_button_layer","talk_panel"]);
	//obj_talk_button.isEnabled = true;
	can_talk = true;
	create_dialogue(dialog);
	
	if(global.talk_button_pressed == true){
		
		obj_talk_button.isEnabled = false;
		instance_deactivate_object(obj_joystick_base)
		global.talk_button_pressed = false;
	}
}else if(distance_to_object(obj_player) > 16){
	//sc_invisible_layer(["talk_button_layer","talk_panel"]);
	//obj_talk_button.isEnabled = false;
	can_talk = false;
}*/