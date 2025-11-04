/*
// Set which chapter this room belongs to
var chap_index = 0; // 0 = Kabanata 1

// Store title & summary from array
global.current_chapter_title = global.story_chapters[chap_index].chapter_title;
global.current_chapter_summary = global.story_chapters[chap_index].summary;

// Create the display UI
instance_create_layer(0, 0, "ins_gui", obj_chapter_display);
*/


var disp = instance_create_layer(0, 0, "ins_gui", obj_chapter_display);

disp.chapter_title = "Chapter 1";
disp.chapter_summary = "Crisostomo Ibarra";
