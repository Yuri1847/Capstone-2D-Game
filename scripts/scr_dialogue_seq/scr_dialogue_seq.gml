function scr_dialogue_seq() {
    var ch = global.current_chapter;
    var obj = global.current_objective;
    var chapter = global.story_chapters[ch];
    var current_obj = chapter.objectives[obj];

    var d = instance_find(obj_dialog, 0);
    if (!instance_exists(d)) exit;

    var npc_ref = d.npc_ref;
    if (npc_ref != noone) {
        var npc_id = npc_ref.npc_id;

        // === CHAPTER 0 ===
        if (ch == 0) {

            if (obj == 0 && npc_id == "chap1Tiago") {
                scr_story_next_objective();
            }
            else if (obj == 1 && npc_id == "chap1Damaso") {
                scr_story_next_objective();
            }
            else if (obj == 2 && npc_id == "chap1Guevarra") {
                scr_story_next_objective();
            }
            else if (obj == 3 && npc_id == "chap1Binibini") {
                scr_story_next_objective();
            }
			else if (obj == 4 && npc_id == "chap1Kalalakihan") {
                scr_story_next_objective();
            }
			else if (obj == 5 && npc_id == "chap1Tinong") {
                scr_story_next_objective();
            }
            else {
                show_debug_message("❌ No matching NPC for Chapter 0 objectives.");
            }
        }

        // === CHAPTER 1 ===
        else if (ch == 1) {

            // Objective 0: Talk to the Guard
            if (obj == 0 && npc_id == "guard") {
                scr_story_next_objective();
            }

            // Objective 1: Meet the Captain
            else if (obj == 1 && npc_id == "captain") {
                scr_story_next_objective();
            }

            else {
                show_debug_message("❌ No matching NPC for Chapter 1 objectives.");
            }
        }

        // === OTHER CHAPTERS ===
        else {
            show_debug_message("❌ No matching conditions for Chapter: " + string(ch));
        }
    }
}




















/*
function scr_dialogue_seq() {
    var ch = global.current_chapter;
    var obj = global.current_objective;
    var chapter = global.story_chapters[ch];
    var current_obj = chapter.objectives[obj];

    var d = instance_find(obj_dialog, 0);
    if (!instance_exists(d)) exit;

    var npc_ref = d.npc_ref;
    if (npc_ref != noone) {
        // Use the npc_id variable from the NPC instance
        var npc_id = npc_ref.npc_id;

        show_debug_message("Checking NPC: " + string(npc_id));

        if (npc_id == current_obj.npc_id && !current_obj.completed) {
            show_debug_message("✅ Objective matched and completed: " + current_obj.title);
            scr_story_next_objective();
        } else {
            show_debug_message("❌ NPC didn’t match or objective already complete");
        }
    }
}*/
