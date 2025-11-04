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


// === Room-specific chapter data ===
global.chapter_number = 1;
global.chapter_title = "Crisostomo Ibarra";
global.chapter_summary = "Nagulat sina Padre Sibyla at Padre Damaso nang makita nilang panauhin ni Kapitan Tiago si Crisostomo Ibarra, anak ng yumaong Don Rafael Ibarra na galing Europa. Nais kamayan ni Ibarra si Padre Damaso ngunit itinanggi ng pari na kaibigan niya ang ama nito. Nakipag-usap si Ibarra kay Tinyente Guevarra, na nagkuwento tungkol sa kabutihan ng kanyang ama. Pagkatapos ay lumapit si Ibarra sa mga panauhin upang magpakilala, gaya ng kaugalian sa Alemanya. Doon niya nakilala si Kapitan Tinong, na nag-imbita sa kanya sa hapunan, ngunit tumanggi si Ibarra dahil kailangan niyang pumunta sa San Diego.";
