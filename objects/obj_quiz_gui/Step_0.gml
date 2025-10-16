// TEMP: End quiz when pressing Space
if (keyboard_check_pressed(vk_space)) {
    if (instance_exists(obj_quiz_controller)) {
        with (obj_quiz_controller) {
            quiz_done = true;
        }
    }
    instance_destroy(); // remove quiz GUI
}
