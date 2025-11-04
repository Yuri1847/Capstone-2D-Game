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



case 1:
    if (!tutorial_shown)
    {
        show_tutorial("Tap the NPC to talk");
        global.highlight_talk_button = true;
        tutorial_shown = true;
    }

    var max_fingers = 5;
    for (var i = 0; i < max_fingers; i++) {
        if (device_mouse_check_button_pressed(i, mb_left)) {
            var tx = device_mouse_x_to_gui(i);
            var ty = device_mouse_y_to_gui(i);

            with (obj_talk_button) {
                var bw = sprite_get_width(spr_talk_button);
                var bh = sprite_get_height(spr_talk_button);

                if (point_in_rectangle(tx, ty, bx, by, bx + bw, by + bh)) {
                    global.highlight_talk_button = false;
                    other.next_tutorial();
                }
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
        }
    break;
}
