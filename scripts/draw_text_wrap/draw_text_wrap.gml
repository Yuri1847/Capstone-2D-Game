function draw_text_wrap(_x, _y, _text, _width) {
    var words = string_split(_text, " ");
    var line = "";
    var yy = _y;
    for (var i = 0; i < array_length(words); i++) {
        var test_line = line + words[i] + " ";
        if (string_width(test_line) > _width) {
            draw_text(_x, yy, line);
            yy += string_height(line);
            line = words[i] + " ";
        } else {
            line = test_line;
        }
    }
    draw_text(_x, yy, line);
}
