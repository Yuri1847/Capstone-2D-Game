/// scr_letter_find_by_id(letter_id) -> returns letter struct or undefined
function scr_letter_find_by_id(letter_id) {
    for (var i=0; i<array_length(global.letters); i++) {
        if (global.letters[i].id == letter_id) return global.letters[i];
    }
    return undefined;
}
