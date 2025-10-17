// Draw GUI Event
var alpha = 1;
if (hovered) alpha = 0.8;
if (global.journal_open) alpha = 0.6;

draw_set_alpha(alpha);
draw_sprite(spr_journal_button, 0, button_x, button_y);
draw_set_alpha(1);
