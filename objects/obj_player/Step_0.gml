// Check keys for movement

if(keyboard_check(vk_right) || keyboard_check(vk_up) || keyboard_check(vk_left) || keyboard_check(vk_down)){
	moveRight = keyboard_check(vk_right);
	moveUp = keyboard_check(vk_up);
	moveLeft = keyboard_check(vk_left);
	moveDown = keyboard_check(vk_down);
	// Calculate movement
	vx = ((moveRight - moveLeft) * walkSpeed);
	vy = ((moveDown - moveUp) * walkSpeed);
}else{
	var _move_x = 0;
	var _move_y = 0;

	with (obj_joystick_base)
	{
	_move_x = round(joy_x / radius);
	_move_y = round(joy_y / radius);
	}

	vx = round(_move_x * walkSpeed);
	vy = round( _move_y * walkSpeed);
}

// If Idle
if (vx == 0 && vy == 0) {
	// Change idle Sprite based on last direction
	switch dir {
	case 0: sprite_index = spr_right; break;
	case 1: sprite_index = spr_back; break;
	case 2: sprite_index = spr_left; break;
	case 3: sprite_index = spr_front; break;
	}
}
// If moving
if (vx != 0 || vy != 0) {
	if !collision_point(x+vx,y,obj_par_environment,true,true) {
	x += vx;
	}
	if !collision_point(x,y+vy,obj_par_environment,true,true) {
	y += vy;
	}
	
	// Change walking Sprite based on direction
	if (vx > 0) {
	sprite_index = spr_right_w;
	dir = 0;
	}
	if (vx < 0) {
	sprite_index = spr_left_w;
	dir = 2;
	}
	if (vy > 0) {
	sprite_index = spr_front_w;
	dir = 3;
	}
	if (vy < 0) {
	sprite_index = spr_back_w;
	dir = 1;
	}
}

//depth sorting
depth =-y;