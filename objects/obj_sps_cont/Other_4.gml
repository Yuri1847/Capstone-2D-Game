// === Room Start Story Progress ===
var ch = global.current_chapter;
var obj = global.current_objective;
var chapter = global.story_chapters[ch];
var current_obj = chapter.objectives[obj];

// Example: Only trigger when entering rm_anluwage at specific story point
if (room == rm_fonde_de_lala_market && ch == 0 && obj == 0 && !current_obj.completed) {
    scr_story_next_objective();
}
