// --- obj_gui_display: Draw GUI Event ---

var gui_w = display_get_gui_width();
var gui_h = display_get_gui_height();

// Panel target size (main background)
var target_w = gui_w * 0.8;
var target_h = gui_h * 0.8;

// Center position
var xp = gui_w * 0.5;
var yp = gui_h * 0.5;

// --- Font & Alpha setup ---
draw_set_font(fnt_histNote);
draw_set_alpha(fade);

// ---------------------------------------------------------
// MAIN PANEL (spr_histNote) - manual scaling
// ---------------------------------------------------------
var spr_w = sprite_get_width(spr_histNote);
var spr_h = sprite_get_height(spr_histNote);
var xscale = target_w / spr_w;
var yscale = target_h / spr_h;

draw_sprite_ext(
    spr_histNote,
    0,
    xp,
    yp,
    xscale,
    yscale,
    0,
    c_white,
    fade
);

// ---------------------------------------------------------
// TITLE SECTION
// ---------------------------------------------------------
draw_set_halign(fa_center);
draw_set_valign(fa_top);
draw_set_color(c_black);
draw_text(xp, yp - target_h / 2 + 40, "Historical Notes");

// ---------------------------------------------------------
// DATA TEXT (inside main panel)
// ---------------------------------------------------------
if (variable_instance_exists(self, "data")) {
    draw_set_halign(fa_left);
    draw_set_valign(fa_top);
    draw_set_color(c_black);

    var margin_x = 70;
    var margin_y = 100;
    var text_x = xp - target_w / 2 + margin_x;
    var text_y = yp - target_h / 2 + margin_y;
    var line_h = 16;
    var wrap_w = target_w - 160;

    draw_text(text_x, text_y, "Location: " + data.location);
    text_y += line_h;
    draw_text(text_x, text_y, "Category: " + data.category);
    text_y += line_h * 2;

    draw_text(text_x, text_y, "Description:");
    text_y += line_h;
    draw_text_ext(text_x, text_y, data.description, -1, wrap_w);
    text_y += 120;

    draw_text(text_x, text_y, "Historical Background:");
    text_y += line_h;
    draw_text_ext(text_x, text_y, data.background, -1, wrap_w);
    text_y += 120;

    draw_text(text_x, text_y, "Relevance to Noli Me Tangere:");
    text_y += line_h;
    draw_text_ext(text_x, text_y, data.relevance, -1, wrap_w);
}

// ---------------------------------------------------------
// CLOSE BUTTON (unchanged)
// ---------------------------------------------------------
var button_w = 120;
var button_h = 40;
var bx = xp - target_w / 2 + target_w - button_w - 20;
var by = yp - target_h / 2 + target_h - 20 - button_h;

draw_set_color(c_dkgray);
draw_rectangle(bx, by, bx + button_w, by + button_h, false);

draw_set_color(c_white);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_text(bx + button_w / 2, by + button_h / 2, "Close");

// ---------------------------------------------------------
draw_set_alpha(1);
draw_set_font(-1);
