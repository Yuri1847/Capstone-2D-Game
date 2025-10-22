function scr_story_get_current(){
	/// @function scr_story_get_current()
	/// @description Returns the current objective struct

	var ch = global.current_chapter;
	var obj = global.current_objective;
	return global.story_chapters[ch].objectives[obj];


}	