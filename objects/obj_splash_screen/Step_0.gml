timer +=1;



if(!global.isExit){
	if(timer >= 3 * room_speed){
		show_logo = true;
	}
	
	if(timer >= 11 * room_speed){
		room_goto(rm_loading_bar_first_map);
	}
} else if(global.isExit) {
	if(timer >= 1 * room_speed){
		global.isExit = false;
		show_debug_message(global.isExit)
		game_end()
	}
	
}