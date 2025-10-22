function scr_story_next_objective(){
	/// @function scr_story_next_objective()
			/// @description Marks the current objective complete and moves to the next one

	var ch = global.current_chapter;
	var obj = global.current_objective;
	var chapter = global.story_chapters[ch];

	// Mark current objective complete
	chapter.objectives[obj].completed = true;
	scr_show_popup("Objective Complete");

	// Move to next objective or finish chapter
	if (obj < array_length(chapter.objectives) - 1) {
	    global.current_objective += 1;
	} else {
	    // Chapter complete
	    chapter.completed = true;
	    // Proceed to next chapter if available
        if (ch < array_length(global.story_chapters) - 1) {
            global.current_chapter += 1;
            global.current_objective = 0;
        } else {
            show_debug_message("🏁 All chapters complete!");
        }
	}
																
}