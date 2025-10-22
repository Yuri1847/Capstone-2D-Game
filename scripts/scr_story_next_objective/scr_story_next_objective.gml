function scr_story_next_objective(){
	/// @function scr_story_next_objective()
			/// @description Marks the current objective complete and moves to the next one

	var ch = global.current_chapter;
	var obj = global.current_objective;
	var chapter = global.story_chapters[ch];

	// Mark current objective complete
	chapter.objectives[obj].completed = true;
	show_debug_message("Objective complete: " + chapter.objectives[obj].title);

	// Move to next objective or finish chapter
	if (obj < array_length(chapter.objectives) - 1) {
	    global.current_objective += 1;
	    show_debug_message("Next Objective: " + chapter.objectives[global.current_objective].title);
	} else {
	    // Chapter complete
	    chapter.completed = true;
	    show_debug_message("Chapter complete: " + chapter.title);
	    scr_story_next_chapter();
	}
																
}