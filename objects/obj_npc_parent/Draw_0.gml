// Draw NPC sprite
draw_self();
//icon appear when player on raduis
if (can_talk && !instance_exists(obj_dialog)) {
    draw_sprite(spr_talk, 0, x, y - 32);
	if (instance_exists(obj_talk_button)) obj_talk_button.visible = true;
	
}

