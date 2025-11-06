if (!global.enabledJOY) exit;

if(global.switchMovementControll){
	//JOYSTICK
	if (touchId != -1){
		if (device_mouse_check_button(touchId, mb_left))
		{
			joyX = device_mouse_x_to_gui(touchId) - x;
			joyY = device_mouse_y_to_gui(touchId) - y;
	
			var _direction = point_direction(0, 0, joyX, joyY);
			var _distance = point_distance(0, 0, joyX, joyY);
	
			if (_distance > radius)
			{
				joyX = lengthdir_x(radius, _direction);
				joyY = lengthdir_y(radius, _direction);
			}
		}
		else
		{
			touchId = -1;
			joyX = 0;
			joyY = 0;
		}
	}
	
	// Tutorial highlight pulse
	if (global.highlight_joystick) {
	    highlight_alpha += 0.03 * highlight_dir;
	    if (highlight_alpha >= 0.6) highlight_dir = -1;
	    if (highlight_alpha <= 0.1) highlight_dir = 1;
	} else {
	    highlight_alpha = max(0, highlight_alpha - 0.05);
	}
} else {
	//D-Pad
	// Reset every frame
	moveUp = false;
	moveDown = false;
	moveLeft = false;
	moveRight = false;

	isTouchCrossControll = false;

	// Get GUI-based touch position
	var mx = device_mouse_x_to_gui(0);
	var my = device_mouse_y_to_gui(0);

	// Only when pressed
	if (device_mouse_check_button(0, mb_left))
	{
	    // Row/column boundaries
	    var top_y1 = y0;
	    var top_y2 = y0 + (h_top + gap);
	    var mid_y1 = top_y2;
	    var mid_y2 = mid_y1 + (h_mid + gap);
	    var bot_y1 = mid_y2;
	    var bot_y2 = bot_y1 + (h_bot + gap);

	    var left_x1 = x0;
	    var left_x2 = x0 + (max_w + gap);
	    var mid_x1 = left_x2;
	    var mid_x2 = mid_x1 + (max_w + gap);
	    var right_x1 = mid_x2;
	    var right_x2 = right_x1 + (max_w + gap);

	    // --- Check regions ---

	    // Top Left ↖
	    if (mx >= left_x1 && mx < left_x2 && my >= top_y1 && my < top_y2) {
	        moveUp = true;
	        moveLeft = true;
			isTouchCrossControll = true;
	    }

	    // Top Center ↑
	    if (mx >= mid_x1 && mx < mid_x2 && my >= top_y1 && my < top_y2){
	        moveUp = true;
			isTouchCrossControll = true;
		}

	    // Top Right ↗
	    if (mx >= right_x1 && mx < right_x2 && my >= top_y1 && my < top_y2) {
	        moveUp = true;
	        moveRight = true;
			isTouchCrossControll = true;
	    }

	    // Middle Left ←
	    if (mx >= left_x1 && mx < left_x2 && my >= mid_y1 && my < mid_y2){
	        moveLeft = true;
			isTouchCrossControll = true;
		}

	    // Middle Right →
	    if (mx >= right_x1 && mx < right_x2 && my >= mid_y1 && my < mid_y2){
	        moveRight = true;
			isTouchCrossControll = true;
		}

	    // Bottom Left ↙
	    if (mx >= left_x1 && mx < left_x2 && my >= bot_y1 && my < bot_y2) {
	        moveDown = true;
	        moveLeft = true;
			isTouchCrossControll = true;
	    }

	    // Bottom Center ↓
	    if (mx >= mid_x1 && mx < mid_x2 && my >= bot_y1 && my < bot_y2){
	        moveDown = true;
			isTouchCrossControll = true;
		}

	    // Bottom Right ↘
	    if (mx >= right_x1 && mx < right_x2 && my >= bot_y1 && my < bot_y2) {
	        moveDown = true;
	        moveRight = true;
			isTouchCrossControll = true;
	    }
	
		/*if(instance_exists(obj_player)){
		obj_player.moveUp = moveUp;
	    obj_player.moveDown = moveDown;
	    obj_player.moveLeft = moveLeft;
	    obj_player.moveRight = moveRight;
		// Calculate movement
		obj_player.vx = ((obj_player.moveRight - obj_player.moveLeft) * obj_player.walkSpeed);
		obj_player.vy = ((obj_player.moveDown - obj_player.moveUp) * obj_player.walkSpeed);
		}*/
	
	}
}
