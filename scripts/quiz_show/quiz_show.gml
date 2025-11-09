function quiz_show(_quiz_data, _index) {
    var q = _quiz_data[_index];
    
    if (!instance_exists(obj_quiz_gui))
        global.quiz_gui = instance_create_layer(0, 0, "ins_gui", obj_quiz_gui);

    with (obj_quiz_gui) {
        visible = true;
        question = q.question;
        options = q.options;
        correct_index = q.correct;
        virtue = q.virtue;           // ✅ NEW
        hint_text = q.hint;          // ✅ NEW
        hint_revealed = false;       // ✅ NEW
        selected = -1;
		
        showing_result = false;
        result_text = "";
        result_timer = 0;
        question_index = _index;
        total_questions = array_length(_quiz_data);
        quiz_data = _quiz_data;
    }
}