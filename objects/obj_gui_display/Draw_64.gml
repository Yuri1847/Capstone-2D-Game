// --- obj_gui_display: Draw GUI Event ---

var gui_w = display_get_gui_width();
var gui_h = display_get_gui_height();

// Panel target size
var target_w = gui_w * 0.8;
var target_h = gui_h * 0.8;

// Center position
var xp = gui_w * 0.5;
var yp = gui_h * 0.5;

// Sprite dimensions
var spr_w = sprite_get_width(spr_histNote);
var spr_h = sprite_get_height(spr_histNote);

// Scale for fit
var xscale = target_w / spr_w;
var yscale = target_h / spr_h;

// Set font
draw_set_font(fnt_histNote);  // ✅ your custom font
draw_set_alpha(fade);

// Draw panel
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




// --- Close button ---
var button_w = 120;
var button_h = 40;
var bx = xp - target_w / 2 + target_w - button_w - 20;
var by = yp - target_h / 2 + target_h - button_h - 20;

draw_set_color(c_dkgray);
draw_rectangle(bx, by, bx + button_w, by + button_h, false);

draw_set_color(c_white);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_text(bx + button_w / 2, by + button_h / 2, "Close");

// --- Draw data (if any) ---
if (variable_instance_exists(self, "data")) {
    draw_set_halign(fa_left);
    draw_set_valign(fa_top);
    draw_set_color(c_white);

    var margin = 80;
    var text_x = xp - target_w / 2 + margin;
    var text_y = yp - target_h / 2 + margin;
    var line_h = 22;

    draw_text(text_x, text_y, "📍 Location: " + data.location);
    text_y += line_h;
    draw_text(text_x, text_y, "🏷 Category: " + data.category);
    text_y += line_h * 2;

    draw_text(text_x, text_y, "📝 Description:");
    text_y += line_h;
    draw_text_ext(text_x, text_y, data.description, -1, 600);
    text_y += 100;

    draw_text(text_x, text_y, "📚 Historical Background:");
    text_y += line_h;
    draw_text_ext(text_x, text_y, data.background, -1, 600);
    text_y += 100;

    draw_text(text_x, text_y, "📖 Relevance to Noli Me Tangere:");
    text_y += line_h;
    draw_text_ext(text_x, text_y, data.relevance, -1, 600);
}

// Reset alpha and font if needed
draw_set_alpha(1);
draw_set_font(-1); // return to default font if used elsewhere
