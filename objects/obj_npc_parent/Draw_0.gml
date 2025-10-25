// Draw NPC sprite
draw_self();

// Talk icon when in range
if (can_talk && !instance_exists(obj_dialog)) {
	draw_sprite(spr_talk, 0, x, y - 32);
	if (instance_exists(obj_talk_button)) obj_talk_button.visible = true;
}

// === Draw Objective Icon if Active ===
var current_obj = scr_story_get_current();

if (!current_obj.completed) {
    if (!variable_instance_exists(id, "npc_id") 
    || !variable_struct_exists(current_obj, "npc_id") 
    || current_obj.npc_id == npc_id) {
        
        var icon_y = y - sprite_height;
        draw_sprite(spr_obj_icon, floor(icon_frame), x, icon_y);
    }
}


