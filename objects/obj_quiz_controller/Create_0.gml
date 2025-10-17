if (!instance_exists(obj_quiz_gui)) {
	
    global.quiz_gui = instance_create_layer(0, 0, "ins_gui", obj_quiz_gui);
    global.quiz_gui.visible = false;
}

quiz_done = false;