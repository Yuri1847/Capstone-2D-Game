
// === Always update depth ===
depth = -y;

// === Check distance to player ===
if (instance_exists(obj_player)) {
    var dist = distance_to_object(obj_player);
    can_talk = (dist < 16);

    // === Show/Hide Talk Button ===
    if (instance_exists(obj_talk_button)) {
        obj_talk_button.visible = (can_talk && !instance_exists(obj_dialog));
    }

    // === Handle Touch/Click ===
    var touched = false;
    if (can_talk && !dialogue_active) {
        var max_fingers = 5;
        for (var i = 0; i < max_fingers; i++) {
            if (device_mouse_check_button_pressed(i, mb_left)) {
                var tx = device_mouse_x_to_gui(i);
                var ty = device_mouse_y_to_gui(i);

                // Safe GUI area
                var area = scr_get_camera_gui_area();
                if (point_in_rectangle(tx, ty, area.x, area.y, area.x + area.w, area.y + area.h)) {
                    touched = true;
                }
            }
        }
    }

    // === Start Dialogue ===
    if (can_talk && !dialogue_active && touched) {
        npc_can_move = false;
        obj_Pause_manager.pause = true;
        obj_Pause_manager.update_pause();
        sc_invisible_layer([
            "pause_button_layer",
            "right_option_layer",
        ]);
        create_dialogue(dialog); // starts dialogue
    }

    // === When dialogue ends, reset ===
    if (!instance_exists(obj_dialog)) {
        npc_can_move = true;
        obj_Pause_manager.pause = false;
        if (instance_exists(obj_talk_button)) obj_talk_button.visible = false;
    }
}



//depth =-y;








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