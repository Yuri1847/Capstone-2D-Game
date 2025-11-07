/// obj_talk_button: Draw GUI
if (!visible) exit;

var area = scr_get_camera_gui_area();
var margin_x = 32;
var margin_y = 32;

// --- Bottom-right position inside camera area ---
var bx = area.x + area.w - margin_x - sprite_get_width(spr_talk_button);
var by = area.y + area.h - margin_y - sprite_get_height(spr_talk_button);

// ✅ Save these for external access (tutorial)
global.talk_button_x = bx;
global.talk_button_y = by;
global.talk_button_w = sprite_get_width(spr_talk_button);
global.talk_button_h = sprite_get_height(spr_talk_button);

// --- Draw normal button ---
draw_sprite(spr_talk_button, 0, bx, by);

/*
// 🔆 Highlight effect if tutorial wants it
if (global.highlight_talk_button)
{
    var pulse = 0.8 + 0.2 * sin(current_time / 200);
    draw_set_alpha(pulse);
    draw_sprite_ext(
        spr_highlight_glow,
        0,
        bx + sprite_get_width(spr_talk_button)/2,
        by + sprite_get_height(spr_talk_button)/2,
        1.2, 1.2, 0, c_white, 1
    );
    draw_set_alpha(1);
}*/
