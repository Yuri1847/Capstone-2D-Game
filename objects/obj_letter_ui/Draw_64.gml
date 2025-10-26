/// Draw GUI — obj_letter_ui
// Centered and properly aligned layout

// === GET CAMERA GUI AREA ===
var area = scr_get_camera_gui_area();
var ax = area.x;
var ay = area.y;
var aw = area.w;
var ah = area.h;

// ============================================================
// BACKGROUND OVERLAY — full GUI area
// ============================================================
draw_set_color(make_color_rgb(15, 15, 15));
draw_set_alpha(0.6);
draw_rectangle(ax, ay, ax + aw, ay + ah, false);
draw_set_alpha(1);

// ============================================================
// MAIN LETTER PANEL — perfectly centered
// ============================================================
var margin = 80;
var w = aw - margin * 2;
var h = ah - margin * 2;
var xs = ax + margin;
var ys = ay + margin;

draw_set_color(make_color_rgb(245, 238, 220)); // parchment
draw_rectangle(xs, ys, xs + w, ys + h, false);

draw_set_color(make_color_rgb(60, 40, 20)); // border
draw_rectangle(xs, ys, xs + w, ys + h, true);

// ============================================================
// TEXT SETTINGS
// ============================================================
draw_set_color(c_black);
draw_set_font(fnt_global_dialogue);
draw_set_halign(fa_left);
draw_set_valign(fa_top);

var padding = 36;
var content_x1 = xs + padding;
var content_x2 = xs + w - padding;
var current_y = ys + padding;

// ============================================================
// HEADER SECTION
// ============================================================
var header_h = 48;
draw_text(content_x1, current_y, "Letter of the Nation — " + string(npc_name));
current_y += header_h;

// ============================================================
// CONTEXT SECTION (optional)
// ============================================================
if (string_length(context_msg) > 0) {
    var context_w = content_x2 - content_x1;
    draw_text_ext(content_x1, current_y, context_msg, context_w, 20);
    // get approximate text height for spacing
    var context_h = string_height_ext(context_msg, context_w, 20);
    current_y += context_h + 20;
}

// ============================================================
// QUESTION SECTION
// ============================================================
var question_w = content_x2 - content_x1;
draw_text_ext(content_x1, current_y, prompt_question, question_w, 24);
var question_h = string_height_ext(prompt_question, question_w, 24);
current_y += question_h + 40;

// ============================================================
// CHOICES SECTION
// ============================================================
var choice_start_y = current_y;
var choice_h = 48;
var choice_gap = 12;
var choice_margin_x = 60;

for (var i = 0; i < array_length(choices); i++) {
    var bx = xs + choice_margin_x;
    var by = choice_start_y + i * (choice_h + choice_gap);
    var bw = w - choice_margin_x * 2;
    var bh = choice_h;

    // store choice bounds
    choice_bbox[i].xs = bx;
    choice_bbox[i].ys = by;
    choice_bbox[i].w  = bw;
    choice_bbox[i].h  = bh;

    // background
    if (selected_choice == i) {
        draw_set_color(make_color_rgb(190, 220, 255));
    } else {
        draw_set_color(make_color_rgb(230, 230, 230));
    }
    draw_rectangle(bx, by, bx + bw, by + bh, false);

    // choice label text
    draw_set_color(c_black);
    draw_text(bx + 16, by + 12, string(i + 1) + ". " + choices[i].label);
}

// move Y for button
current_y = choice_start_y + array_length(choices) * (choice_h + choice_gap) + 40;

// ============================================================
// SUBMIT BUTTON — centered at bottom
// ============================================================
var button_w = 200;
var button_h = 50;
var button_x = xs + (w - button_w) / 2;
var button_y = ys + h - button_h - 40;

if (selected_choice >= 0) {
    draw_set_color(make_color_rgb(100, 150, 220));
} else {
    draw_set_color(make_color_rgb(160, 160, 160));
}
draw_rectangle(button_x, button_y, button_x + button_w, button_y + button_h, false);

draw_set_color(c_white);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
var button_text = (selected_choice >= 0) ? "Submit" : "Select an option";
draw_text(button_x + button_w / 2, button_y + button_h / 2, button_text);

// ============================================================
// RESET DRAW STATE
// ============================================================
draw_set_color(c_white);
draw_set_alpha(1);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
