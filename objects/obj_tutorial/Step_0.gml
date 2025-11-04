switch (tutorial_stage)
{
    //-----------------------------------
    // 1️⃣ MOVE USING JOYSTICK
    //-----------------------------------
    case 0:
	    if (!tutorial_shown) {
	        show_tutorial("Move using the joystick");

	        global.highlight_joystick = true;
	        global.highlight_npc = false;
	        global.highlight_journal = false;

	        tutorial_shown = true;
	        tutorial_move_time = 0;
	    }

	    // detect joystick or player movement
	    var _joy_moved = (abs(obj_joystick_base.joyX) > 0.2) || (abs(obj_joystick_base.joyY) > 0.2);
	    var _player_moved = (abs(obj_player.hsp) > 0.2) || (abs(obj_player.vsp) > 0.2);

	    if (_joy_moved || _player_moved) {
	        // accumulate total active movement time
	        tutorial_move_time += delta_time / 1000000; 
	    }

	    // ✅ check once player moved enough total time (no reset)
	    if (tutorial_move_time >= 3) {
	        global.highlight_joystick = false;
	        next_tutorial();
	    }
	break;




//-----------------------------------
// 2️⃣ TAP TALK BUTTON TO TALK
//-----------------------------------
case 1:
    if (!tutorial_shown)
    {
        show_tutorial("Tap the talk button to talk to the NPC");

        global.highlight_talk_button = true;
        global.highlight_npc = true;

        tutorial_shown = true;
    }

    // detect tap/click on talk button
    if (device_mouse_check_button_pressed(0, mb_left))
    {
        var tx = device_mouse_x_to_gui(0);
        var ty = device_mouse_y_to_gui(0);

        // check if clicked inside actual talk button
        with (obj_talk_button)
        {
            var bw = (sprite_index != -1) ? sprite_get_width(sprite_index) : 64;
            var bh = (sprite_index != -1) ? sprite_get_height(sprite_index) : 64;
            var bx = x - bw * 0.5;
            var by = y - bh * 0.5;

            if (point_in_rectangle(tx, ty, bx, by, bx + bw, by + bh))
            {
                // ✅ store button position for highlight later
                global.talk_button_x = bx;
                global.talk_button_y = by;
                global.talk_button_w = bw;
                global.talk_button_h = bh;

                // ✅ remove highlights
                global.highlight_talk_button = false;
                global.highlight_npc = false;

                // ✅ immediately continue tutorial
                with (obj_tutorial) next_tutorial();

                // (optional) trigger dialogue if not auto-handled
                // scr_start_dialogue();
            }
        }
    }
break;














    //-----------------------------------
    // 3️⃣ OPEN JOURNAL
    //-----------------------------------
    case 2:
        if (!tutorial_shown)
        {
            show_tutorial("Tap the Journal icon");
            global.highlight_journal = true;
            tutorial_shown = true;
        }

        if (global.journal_open)
        {
            global.highlight_journal = false;
            next_tutorial();
        }
    break;


    //-----------------------------------
    // ✅ FINISHED
    //-----------------------------------
    case 3:
        if (!tutorial_shown)
        {
            show_tutorial("Well done! Tutorial complete.");
            tutorial_shown = true;
            tutorial_done = true;
			
			alarm[0] = room_speed * 2;
        }
    break;
}



