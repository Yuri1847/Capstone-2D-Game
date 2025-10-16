function quiz_show(_question, _options_array, _correct_index) {
    if (!instance_exists(obj_quiz_gui))
        global.quiz_gui = instance_create_layer(0, 0, "ins_gui", obj_quiz_gui);

    with (obj_quiz_gui) {
        visible = true;
        question = _question;
        options = _options_array;
        correct_index = _correct_index;
        selected = -1;
    }
}
