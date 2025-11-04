if (!instance_exists(obj_talk_button)) {
    instance_create_layer(0, 0, "ins_gui", obj_talk_button);
}

//reflection data sets
scr_reflection_init();


// obj_global Create Event
global.highlight_joystick = false;
global.highlight_talk = false;
global.highlight_journal = false;
global.tutorial_step = 0;
global.tutorial_active = true;

