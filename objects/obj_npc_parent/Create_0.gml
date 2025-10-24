// for npc auto path direction
last_dir = 270;
last_x = x;
last_y = y;
npc_trigger = false;

//for dialogue
can_talk = false;          // player is in range
dialogue_active = false;   // whether dialogue is currently running
input_key = vk_space;      // key to trigger dialogue


mask_index = spr_Well;


if (variable_instance_exists(id, "name")) {
    npc_id = name;
} else {
    npc_id = "npc_" + string(id); // fallback unique id
}


icon_frame = 0;
icon_speed = 0.25; // how fast it animates (0.25 = slower, 1 = normal speed)


