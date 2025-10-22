// Draw NPC sprite
draw_self();
//icon appear when player on raduis
if (can_talk && !instance_exists(obj_dialog)) {
    draw_sprite(spr_talk, 0, x, y - 32);
	if (instance_exists(obj_talk_button)) obj_talk_button.visible = true;
}

// === Draw Objective Icon if Active ===
var current_obj = global.story_chapters[global.current_chapter].objectives[global.current_objective];

if (current_obj.npc_id == npc_id && !current_obj.completed) {
    // Draw an icon above the NPC
    var icon_y = y - sprite_height - 8; // adjust offset as needed
    draw_sprite(spr_talk_quest, 0, x, icon_y);
}

