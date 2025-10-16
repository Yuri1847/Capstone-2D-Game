/// obj_timeline_ui – Draw GUI (clean + scale-safe)

var gui_w = display_get_gui_width();
var gui_h = display_get_gui_height();

// Reset draw state
draw_set_color(c_white);
draw_set_alpha(1);
gpu_set_blendenable(true);
gpu_set_blendmode(bm_normal);

// === MAIN BACKGROUND ===
if (sprite_exists(spr_main_panel)) {
    draw_sprite_ext(
        spr_main_panel, 0, 0, 0,
        gui_w / sprite_get_width(spr_main_panel),
        gui_h / sprite_get_height(spr_main_panel),
        0, c_white, 1
    );
}

// === INVISIBLE PANEL ===
var inv_w = gui_w * 0.9;
var inv_h = gui_h * 0.9;
var inv_x = (gui_w - inv_w) * 0.5;
var inv_y = (gui_h - inv_h) * 0.5;

var info_h  = inv_h * 0.2;
var panel_h = inv_h - info_h;

// === INFO PANEL ===
if (sprite_exists(spr_info)) {
    draw_sprite_ext(
        spr_info, 0, inv_x, inv_y,
        inv_w / sprite_get_width(spr_info),
        info_h / sprite_get_height(spr_info),
        0, c_white, 1
    );
}

// === MAIN PANEL ===
if (sprite_exists(spr_panel)) {
    draw_sprite_ext(
        spr_panel, 0, inv_x, inv_y + info_h,
        inv_w / sprite_get_width(spr_panel),
        panel_h / sprite_get_height(spr_panel),
        0, c_white, 1
    );
}

// === SLOT & CARD LAYOUT ===
var slot_count = array_length(slots);
if (slot_count > 0) {
    var card_w = 192;
    var card_h = 257;
    var margin = 24;

    var total_w = slot_count * card_w + (slot_count - 1) * margin;
    var start_x = inv_x + (inv_w - total_w) * 0.5;
    var center_y = (inv_y + info_h) + (panel_h * 0.5) - (card_h * 0.5);

    // === DRAW SLOTS ===
    if (sprite_exists(spr_slotTE)) {
        for (var i = 0; i < slot_count; i++) {
            var sx = start_x + i * (card_w + margin);
            var sy = center_y;

            draw_sprite_ext(
                spr_slotTE, 0, sx, sy,
                card_w / sprite_get_width(spr_slotTE),
                card_h / sprite_get_height(spr_slotTE),
                0, c_white, 1
            );
        }
    }

    // === DRAW CARDS (USING ACTUAL CARD POSITIONS FROM STEP) ===
    if (sprite_exists(spr_cardTE)) {
        for (var i = 0; i < array_length(card_objects); i++) {
            var c = card_objects[i];

            // Draw card sprite
            draw_sprite_ext(
                spr_cardTE, 0,
                c.x - card_w * 0.5,   // center align X
                c.y - card_h * 0.5,   // center align Y
                card_w / sprite_get_width(spr_cardTE),
                card_h / sprite_get_height(spr_cardTE),
                0, c_white, 1
            );

            // Draw text
            draw_set_halign(fa_center);
            draw_set_valign(fa_middle);
            draw_set_font(-1);
            draw_set_color(c_black);
            draw_text(c.x, c.y, c.text);
        }
    }
}
