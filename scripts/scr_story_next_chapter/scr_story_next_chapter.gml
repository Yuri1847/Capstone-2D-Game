function scr_story_next_chapter(){
	/// @function scr_story_next_chapter()
	/// @description Moves to the next chapter if available

	if (global.current_chapter < array_length(global.story_chapters) - 1) {
	    global.current_chapter += 1;
	    global.current_objective = 0;

	    var new_chapter = global.story_chapters[global.current_chapter];
	    show_debug_message("Next Chapter: " + new_chapter.title);
	} else {
	    show_debug_message("All chapters complete!");
	}
	
}