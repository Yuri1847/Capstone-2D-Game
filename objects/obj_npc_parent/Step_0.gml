
// === Always update depth ===
depth = -y;

// === Check if dialogue is already active ===
dialogue_active = instance_exists(obj_dialog);

// === Check distance to player ===
if (instance_exists(obj_player)) {
    var dist = distance_to_object(obj_player);
    can_talk = (dist < 16);

    // === Touch or Click Anywhere ===
    var max_fingers = 5;
    var touched = false;

    for (var i = 0; i < max_fingers; i++) {
        if (device_mouse_check_button_pressed(i, mb_left)) {
            var tx = device_mouse_x_to_gui(i);
            var ty = device_mouse_y_to_gui(i);

            // Whole screen (1280x720)
            if (point_in_rectangle(tx, ty, 0, 0, 1280, 720)) {
                touched = true;
            }
        }
    }

    // === Trigger dialogue when close enough and tapped anywhere ===
    if (can_talk && !dialogue_active && touched) {
        npc_can_move = false;
		obj_Pause_manager.pause = true;
		obj_Pause_manager.update_pause();
        create_dialogue(dialog); // pass self as speaker
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