if (!global.quiz_active) exit;

var data = global.quiz_data;

// Quiz finished
if (data.question_index == -1) {
    draw_text(100, 200, "Quiz Complete! Score: " + string(data.score));

    if (global.quiz_done_timer == 0) global.quiz_done_timer = current_time;

    if (current_time - global.quiz_done_timer > 1000) {
        global.quiz_active = false;
        global.quiz_done = true;

        if (variable_global_exists("quiz_next_room") && global.quiz_next_room != noone) {
            room_goto(global.quiz_next_room);
        }
    }
    exit;
}

// Draw current question
draw_text(100, 100, "Q" + string(data.question_index + 1) + ": " + data.questions[data.question_index].text);

// Draw choices (replace with sprites if needed)
for (var i = 0; i < 3; i++) {
    draw_text(100, 300 + i*60, data.questions[data.question_index].choices[i]);
}
