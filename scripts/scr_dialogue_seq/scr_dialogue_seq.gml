function scr_dialogue_seq(){
	// === SIMPLE DIALOGUE SEQUENCE CHECK ===
	//chapter 2
		    if (messages == global.chap2_dial1) {
		        if (global.current_story_index == 2) {
				    scr_story_next();
					global.current_story_npc = 2;
				}

		        global.current_dialogue = global.chap2_dial2;
		    }
		    else if (messages == global.chap2_dial2) {
				if (global.current_story_index == 3) {
				    scr_story_next();
				}
		       
		        global.current_dialogue = global.chap2_dial3; 
		    }
			else if (messages == global.chap2_dial3) {
				if (global.current_story_index == 4) {
				    scr_story_next();
				}
		        
		        global.current_dialogue = global.chap2_dial4; 
		    }
			else if (messages == global.chap2_dial4) {
				if (global.current_story_index == 5) {
				    scr_story_next();
				}
		        
		        global.current_dialogue = global.chap2_dial5; 
		    }
			else if (messages == global.chap2_dial5) {
				if (global.current_story_index == 6) {
				    scr_story_next();
				}
		        global.current_dialogue = global.chap2_dial6; 
		    }
			else if (messages == global.chap2_dial6) {
				if (global.current_story_index == 7) {
				    scr_story_next();
				}
		        global.current_dialogue = global.chap3_dial1; 
		    }
			//chapter 3
			else if (messages == global.chap3_dial1) {
				if (global.current_story_index == 9) {
				    scr_story_next();
				}
		        global.current_dialogue = global.chap4_dial1; 
		    }
			//chapter 4
			else if (messages == global.chap4_dial1) {
				if (global.current_story_index == 11) {
				    scr_story_next();
				}
		        global.current_dialogue = global.chap5_dial1; 
		    }
			//chapter 5
			else if (messages == global.chap5_dial1) {
				if (global.current_story_index == 13) {
				    scr_story_next();
				}
		        global.current_dialogue = global.chap7_dial1; 
		    }
			//chapter 7
			else if (messages == global.chap7_dial1) {
				if (global.current_story_index == 16) {
				    scr_story_next();
				}
		        global.current_dialogue = global.chap7_dial2; 
		    }
			else if (messages == global.chap7_dial2) {
				if (global.current_story_index == 17) {
				    scr_story_next();
				}
		        global.current_dialogue = global.chap8_dial1; 
		    }
			//chapter 8
			else if (messages == global.chap8_dial1) {
				if (global.current_story_index == 11) {
				    scr_story_next();
				}
		        //global.current_dialogue = global.chap8_dial1; 
		    }
}