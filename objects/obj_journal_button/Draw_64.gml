// Draw GUI Event
var area = scr_get_camera_gui_area();


var alpha = 1;
if (hovered) alpha = 0.8;
if (global.journal_open) alpha = 0.6;

draw_set_alpha(alpha);
draw_sprite(spr_journal_button, 0, area.x + area.w - button_size - button_margin, area.y + button_margin);
draw_set_alpha(1);
