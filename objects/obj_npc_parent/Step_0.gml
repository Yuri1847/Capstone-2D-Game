
// === Always update depth ===
depth = -y;


// === Check distance to player ===
if (instance_exists(obj_player)) {
    var dist = distance_to_object(obj_player);
    can_talk = (dist < 16);

    // === GUI camera area & button margin ===
    var area = scr_get_camera_gui_area();
    var margin_x = 32;
    var margin_y = 32;
    var btn_w = sprite_get_width(spr_talk_button);
    var btn_h = sprite_get_height(spr_talk_button);

    // Button coordinates (bottom-right inside camera area)
    var btn_x1 = area.x + area.w - margin_x - btn_w;
    var btn_y1 = area.y + area.h - margin_y - btn_h;
    var btn_x2 = btn_x1 + btn_w;
    var btn_y2 = btn_y1 + btn_h;

    // === Show/Hide Talk Button ===
    if (instance_exists(obj_talk_button)) {
        obj_talk_button.visible = (can_talk && !instance_exists(obj_dialog));
        obj_talk_button.x = btn_x1 + btn_w/2;
        obj_talk_button.y = btn_y1 + btn_h/2;
    }

    // === Detect touch/click ===
    var touched = false;

    if (!dialogue_active && can_talk) {
        // Only clickable area over the button triggers dialogue
        var max_fingers = 5;
        for (var i = 0; i < max_fingers; i++) {
            if (device_mouse_check_button_pressed(i, mb_left)) {
                var mx = device_mouse_x_to_gui(i);
                var my = device_mouse_y_to_gui(i);

                if (mx > btn_x1 && mx < btn_x2 && my > btn_y1 && my < btn_y2) {
                    touched = true;
                }
            }
        }
    } else if (dialogue_active) {
        // Once dialogue is active, any click anywhere in GUI advances
        var max_fingers = 5;
        for (var i = 0; i < max_fingers; i++) {
            if (device_mouse_check_button_pressed(i, mb_left)) {
                touched = true;
            }
        }
    }

    // === Start or advance dialogue ===
	if (touched) {
	    if (!dialogue_active) {
	        npc_can_move = false;
	        obj_Pause_manager.pause = true;
	        obj_Pause_manager.update_pause();
	        sc_invisible_layer(["pause_button_layer", "right_option_layer"]);

	        var d = create_dialogue(dialog);
	        if (instance_exists(d)) {
	            d.npc_ref = id; // ✅ Now this will actually work!
	        }
	    }
	}



    // === Reset when dialogue ends ===
    if (!instance_exists(obj_dialog)) {
        npc_can_move = true;
        obj_Pause_manager.pause = false;
        if (instance_exists(obj_talk_button)) obj_talk_button.visible = false;
    }
}

icon_frame += icon_speed;

var frame_count = sprite_get_number(spr_obj_icon);
if (icon_frame >= frame_count) {
    icon_frame = 0; // loop
}


/*
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



depth =-y;



*/




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