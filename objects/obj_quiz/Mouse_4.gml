if (!global.quiz_active) exit;

var data = global.quiz_data;
var mx = device_mouse_x_to_gui(0);
var my = device_mouse_y_to_gui(0);

for (var i = 0; i < 3; i++) {
    var bx = 100;
    var by = 300 + i*60;
    var bw = 200;
    var bh = 50;

    if (point_in_rectangle(mx, my, bx, by, bx+bw, by+bh)) {
        if (i == data.questions[data.question_index].correct) data.score += 1;
        data.question_index += 1;
        global.quiz_data = data;
        break;
    }
}
