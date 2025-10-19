// Draw NPC sprite
draw_self();

	
// === TALK ICON (appears when player is close) ===
if (can_talk && !instance_exists(obj_dialog)) {
    draw_sprite(spr_talk, 0, x, y - 32);
}
