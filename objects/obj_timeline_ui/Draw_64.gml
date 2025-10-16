/// obj_timeline_ui – Draw GUI
/// All sprites use Top-Left origin (0,0)

// === Base reference size ===
var base_w = 1280;
var base_h = 720;

var gui_w = display_get_gui_width();
var gui_h = display_get_gui_height();

var scale_x = gui_w / base_w;
var scale_y = gui_h / base_h;
var scale = min(scale_x, scale_y);

// === MAIN BACKGROUND ===
if (sprite_exists(spr_main_panel)) {
    draw_sprite_stretched(spr_main_panel, 0, 0, 0, gui_w, gui_h);
}

// ===================================================
// 🟪 INVISIBLE PANEL (container, not drawn)
// ===================================================
var inv_w = gui_w * 0.9;
var inv_h = gui_h * 0.9;
var inv_x = (gui_w - inv_w) * 0.5;
var inv_y = (gui_h - inv_h) * 0.5;

// Child areas
var info_h  = inv_h * 0.2;
var panel_h = inv_h - info_h;

// === INFO PANEL ===
if (sprite_exists(spr_info)) {
    draw_sprite_stretched(spr_info, 0, inv_x, inv_y, inv_w, info_h);
}

// === MAIN PANEL ===
if (sprite_exists(spr_panel)) {
    draw_sprite_stretched(spr_panel, 0, inv_x, inv_y + info_h, inv_w, panel_h);
}

// ===================================================
// 🟦 SLOT & CARD LAYOUT (centered inside spr_panel)
// ===================================================
var slot_count = array_length(slots);
if (slot_count > 0) {

    // Fixed size for slots/cards (in GUI pixels)
    var card_w = 256 * scale;
    var card_h = 342 * scale;
    var margin = 24 * scale;

    // Compute horizontal centering inside spr_panel
    var total_w = slot_count * card_w + (slot_count - 1) * margin;
    var start_x = inv_x + (inv_w - total_w) * 0.5;
    var center_y = (inv_y + info_h) + (panel_h * 0.5) - (card_h * 0.5);

    // === SLOTS ===
    if (sprite_exists(spr_slotTE)) {
        for (var i = 0; i < slot_count; i++) {
            var sx = start_x + i * (card_w + margin);
            var sy = center_y;
            draw_sprite_stretched(spr_slotTE, 0, sx, sy, card_w, card_h);
        }
    }

    // === CARDS ===
    if (sprite_exists(spr_cardTE)) {
        for (var i = 0; i < array_length(card_objects); i++) {
            var c = card_objects[i];
            // Align each card to slot position
            var cx = start_x + i * (card_w + margin);
            var cy = center_y;
            draw_sprite_stretched(spr_cardTE, 0, cx, cy, card_w, card_h);

            draw_set_halign(fa_center);
            draw_set_valign(fa_middle);
            draw_set_font(-1);
            draw_set_color(c_black);
            draw_text(cx + card_w * 0.5, cy + card_h * 0.5, c.text);
        }
    }
}


// ===================================================
// 🧩 (Optional Debug – visualize layout)
// ===================================================
// draw_set_color(c_aqua);
// draw_rectangle(inv_x, inv_y, inv_x + inv_w, inv_y + inv_h, false);
// draw_set_color(c_lime);
// draw_rectangle(inv_x, inv_y + info_h, inv_x + inv_w, inv_y + info_h + panel_h, false);
