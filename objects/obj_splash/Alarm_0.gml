if (next_room != noone) {
    show_debug_message("Splash done → going to " + string(next_room));
    var _target = next_room;
    instance_destroy(); // kill splash before leaving
    room_goto(_target);
} else {
    show_debug_message("⚠ ERROR: Splash target is NOONE!");
}
