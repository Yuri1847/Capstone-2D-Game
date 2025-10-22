function scr_story_reset(){
	/// @function scr_story_reset()
	/// @description Resets all story progress (for new game or restart)

	for (var i = 0; i < array_length(global.story_chapters); i++) {
	    var chapter = global.story_chapters[i];
	    chapter.completed = false;
	    for (var j = 0; j < array_length(chapter.objectives); j++) {
	        chapter.objectives[j].completed = false;
	    }
	}
	global.current_chapter = 0;
	global.current_objective = 0;

	show_debug_message("Story progress reset.");

}