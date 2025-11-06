
function scr_dialogue_seq(){
	// === SIMPLE DIALOGUE SEQUENCE CHECK ===
	//chapter 2
		    if (messages == global.chap2_dial1) {
		        if (global.current_story_index == 4) {
				    scr_story_next();
				}

		        global.current_dialogue = global.chap2_dial2;
		    }
		    else if (messages == global.chap2_dial2) {
				if (global.current_story_index == 5) {
				    scr_story_next();
				}
		       
		        global.current_dialogue = global.chap2_dial3; 
		    }
			else if (messages == global.chap2_dial3) {
				if (global.current_story_index == 6) {
				    scr_story_next();
				}
		        
		        global.current_dialogue = global.chap2_dial4; 
		    }
			else if (messages == global.chap2_dial4) {
				if (global.current_story_index == 7) {
				    scr_story_next();
				}
		        
		        global.current_dialogue = global.chap2_dial5; 
		    }
			else if (messages == global.chap2_dial5) {
				if (global.current_story_index == 8) {
				    scr_story_next();
				}
		        global.current_dialogue = global.chap2_dial6; 
		    }
			else if (messages == global.chap2_dial6) {
				if (global.current_story_index == 9) {
				    scr_story_next();
				}
		        global.current_dialogue = global.chap3_dial1; 
		    }
			//chapter 3
			else if (messages == global.chap3_dial1) {
				if (global.current_story_index == 11) {
				    scr_story_next();
				}
		        global.current_dialogue = global.chap4_dial1; 
		    }
			//chapter 4
			else if (messages == global.chap4_dial1) {
				if (global.current_story_index == 9) {
				    scr_story_next();
				}
		        global.current_dialogue = global.chap5_dial1; 
		    }
}