/// obj_letter_ui Step
// keyboard numeric selection
for (var k=0; k<array_length(choices); k++) {
    var key = ord(string(k+1));
    if (keyboard_check_pressed(key)) selected_choice = k;
}

// confirm on Enter or Space
if ((keyboard_check_pressed(vk_enter) || keyboard_check_pressed(vk_space)) && selected_choice >= 0) {
    scr_letter_submit(self);
}
