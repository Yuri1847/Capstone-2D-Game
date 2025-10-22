//npc_id = "chap2Tiago";
/*
function npc_interact(){
	
	
if (global.story_chapters[global.current_chapter].objectives[1].title == "Batiin si Padre Damaso") {
    scr_story_next_objective();
}

	
		// --- Safety check (ensures the structs exist) ---
if (!variable_global_exists("file_handling_data")) global.file_handling_data = {};
if (!variable_struct_exists(global.file_handling_data, "npc_dialog")) global.file_handling_data.npc_dialog = {};
if (!variable_struct_exists(global.file_handling_data.npc_dialog, "tiago")) global.file_handling_data.npc_dialog.tiago = false;
	
	if(!global.file_handling_data.npc_dialog.tiago){
		global.file_handling_data.npc_dialog.tiago = true;
		file_handling_save_game();
		create_dialogue(dialog);
	} else {
		create_dialogue([{ 
			name: "Narration",
			msg: "Nag kamustahan na tayo iho"
		}]);
	}
	
}*/