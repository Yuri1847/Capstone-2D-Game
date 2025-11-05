// 🧩 obj_tutorial: CREATE EVENT

// ✅ Ensure global variable exists before using it
if (!variable_global_exists("tutorial_done")) {
    global.tutorial_done = false;
}

// Now you can safely check it
if (global.tutorial_done) {
    instance_destroy();
    exit;
}


// otherwise continue as normal
tutorial_stage = 0;
tutorial_shown = false;
tutorial_done = false;

tutorial_move_time = 0;

global.tutorial_message = "";
global.tutorial_visible = false;

// highlights
global.highlight_joystick = false;
global.highlight_npc = false;
global.highlight_journal = false;
global.highlight_talk_button = false;

global.tutorial_alpha = 0;
