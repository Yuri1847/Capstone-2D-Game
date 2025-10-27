// --------------------------------------------------
// scr_letter_find_by_id(letter_id)
// returns struct or undefined
// --------------------------------------------------
function scr_letter_find_by_id(letter_id) {
    if (is_undefined(letter_id) || letter_id == "") return undefined;
    for (var i = 0; i < array_length(global.letters); i++) {
        var L = global.letters[i];
        if (is_struct(L) && L.id == letter_id) return L;
    }
    return undefined;
}
