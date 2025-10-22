/// @function string_wrap(_text, _width)
/// @desc Wraps text into multiple lines to fit a max width.
function string_wrap(_text, _width) {
    var _result = "";
    var _words = string_split(_text, " ");
    var _line = "";

    for (var i = 0; i < array_length(_words); i++) {
        var _word = _words[i];
        var _test = _line + _word + " ";

        if (string_width(_test) > _width) {
            _result += _line + "\n";
            _line = _word + " ";
        } else {
            _line = _test;
        }
    }

    _result += _line; // add last line
    return _result;
}
