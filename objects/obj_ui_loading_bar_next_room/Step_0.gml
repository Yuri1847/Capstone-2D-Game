// Increase progress until it reaches 30
if (progress < 38) {
    progress += 1;
}

// Start the alarm ONCE when progress hits 30
if (progress == 38 && alarm[0] < 0) {  // use < 0, not <= 0
    alarm[0] = 2 * room_speed; // wait 7 seconds
    show_debug_message("Alarm set at step " + string(current_time));
} else if(progress >= 95 && progress < progress_max){
	progress += 1;
	if(progress == progress_max){
		alarm[3] = 2 * room_speed
	}
}
