
function scr_story_next(){
	/// @function scr_story_next()
	/// @description Move to next story quest

	var i = global.current_story_index;

	// Mark current as complete
	global.story_quests[i].completed = true;

	// Go to next quest (if exists)
	if (i < array_length(global.story_quests) - 1) {
	    global.current_story_index += 1;
	    show_debug_message("New Quest: " + global.story_quests[global.current_story_index].title);
	} else {
	    show_debug_message("Storyline complete!");
	}

}