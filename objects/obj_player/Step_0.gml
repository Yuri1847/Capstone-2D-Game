//for dialog system
if(keyboard_check_pressed(vk_space)){
	create_dialog([
	{
		name: "tiago",
		msg: "hello, ibarra! kamusta kana? maayos ka namang nakarating? tagal mo ding nanatili sa europa. halika ipapakilala kita sa iba"
	}
	])
}

// Check keys for movement
if(keyboard_check(vk_right) || keyboard_check(vk_up) || keyboard_check(vk_left) || keyboard_check(vk_down)){
	//for Keyboard
	moveRight = keyboard_check(vk_right);
	moveUp = keyboard_check(vk_up);
	moveLeft = keyboard_check(vk_left);
	moveDown = keyboard_check(vk_down);
	// Calculate movement
	vx = ((moveRight - moveLeft) * walkSpeed);
	vy = ((moveDown - moveUp) * walkSpeed);
}else{
	//for Joystick
	var moveX = 0;
	var moveY = 0;

	with (obj_joystick_base)
	{
	moveX = round(joyX / radius);
	moveY = round(joyY / radius);
	}
	// Calculate movement
	vx = round(moveX * walkSpeed);
	vy = round( moveY * walkSpeed);
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