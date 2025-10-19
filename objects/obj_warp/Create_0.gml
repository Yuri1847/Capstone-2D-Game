/// @description Initialize warp properties
targetRoom = noone; // The room to warp to
targetX = 0;
targetY = 0;

// --- Persistent warp memory system ---

if (!variable_instance_exists(id, "warp_id")) warp_id = "warp_default";
if (!variable_global_exists("warp_memory")) global.warp_memory = ds_map_create();

if (!ds_map_exists(global.warp_memory, warp_id)) {
    ds_map_add(global.warp_memory, warp_id, 0);
}

var warp_stage = ds_map_find_value(global.warp_memory, warp_id);


// Different destinations per warp stage
switch (warp_stage) {
    case 0:
        targetRoom = rm_chapter2_crisostomo_ibarra;
        targetX = 1055;
        targetY = 738;
        break;

    case 1:
        targetRoom = rm_maria_clara_house_inside_first_floor;
        targetX = 350;
        targetY = 225;
        break;
}

// --- Prepare next stage ---
warp_stage = (warp_stage + 1) mod 2; // loops between 0 and 1
ds_map_replace(global.warp_memory, warp_id, warp_stage);




depth = -1000;


//quiz
/// obj_warp - Create Event
quiz_active = false;
has_quiz = false;
quiz_question = "";
quiz_options = [];
quiz_correct = -1;

