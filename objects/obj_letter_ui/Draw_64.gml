/// Draw GUI Event
var area = scr_get_camera_gui_area();

var x1 = area.x;
var y1 = area.y;
var x2 = area.x + area.w;
var y2 = area.y + area.h;

// === Main white background ===
draw_set_color(c_white);
draw_set_alpha(0.95);
draw_rectangle(x1, y1, x2, y2, false);
draw_set_alpha(1);

// --- Section height ratios ---
var h_total = area.h;
var h_top    = h_total * 0.20;
var h_mid1   = h_total * 0.20;
var h_mid2   = h_total * 0.40;
var h_bottom = h_total * 0.20;

// helper positions
var y_top_end    = y1 + h_top;
var y_mid1_end   = y_top_end + h_mid1;
var y_mid2_end   = y_mid1_end + h_mid2;
var y_bottom_end = y2;

// === Section dividers ===
draw_set_color(c_black);
draw_line(x1, y_top_end,  x2, y_top_end);
draw_line(x1, y_mid1_end, x2, y_mid1_end);
draw_line(x1, y_mid2_end, x2, y_mid2_end);

// === TEXT ===
draw_set_color(c_black);
draw_set_font(-1);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);

// ─ Header (20%) ─
draw_text(area.x + area.w * 0.5, y1 + h_top * 0.35, "✦ REFLECTION ✦");
draw_text(area.x + area.w * 0.5, y1 + h_top * 0.75,
    "“If you were Ibarra, what would you do?”");

// ─ Scenario (20%) ─
draw_set_halign(fa_left);
var text_x = area.x + area.w * 0.1;
draw_text(text_x, y_top_end + h_mid1 * 0.5,
    "❝ Padre Dámaso insults your late father in front of everyone.\nSilence fills the room. ❞");

// ─ Choices (40%) ─
var choice_x1 = text_x;
var choice_x2 = area.x + area.w * 0.9;
var choice_y = y_mid1_end + h_mid2 * 0.15;
var choice_h = 56;
var spacing = 16;

// Draw rectangles behind each choice
var colors = [c_red, c_blue, c_green];
var choices = [
    "🟥 [A] “Speak up and defend your father’s honor.”  (Justice)",
    "🟦 [B] “Answer calmly with composure and reason.”  (Wisdom)",
    "🟩 [C] “Hold your silence to keep the peace.”      (Humility)"
];

for (var i = 0; i < array_length(choices); i++)
{
    var y_rect1 = choice_y + i * (choice_h + spacing);
    var y_rect2 = y_rect1 + choice_h;

    // background rectangle
    draw_set_color(c_white);
    draw_rectangle(choice_x1, y_rect1, choice_x2, y_rect2, false);

    // colored border (same color as choice tag)
    draw_set_color(colors[i]);
    draw_rectangle(choice_x1, y_rect1, choice_x2, y_rect2, true);

    // text
    draw_set_color(c_black);
    draw_text(choice_x1 + 12, y_rect1 + choice_h * 0.5, choices[i]);
}

// ─ Stats + buttons (20%) ─
draw_set_halign(fa_left);
var stat_y = y_mid2_end + h_bottom * 0.25;
draw_text(text_x, stat_y,
    "⚖️ Justice: ▓▓▓▓▓░░░ (5)   🧠 Wisdom: ▓▓░░░░░ (2)   🙇 Humility: ▓░░░░░░ (1)");

// === Confirm Button ===
var confirm_w = 200;
var confirm_h = 48;
var confirm_x = area.x + area.w - confirm_w - 100; // right padding
var confirm_y = stat_y + 20;

// background
draw_set_color(c_white);
draw_rectangle(confirm_x, confirm_y, confirm_x + confirm_w, confirm_y + confirm_h, false);

// border
draw_set_color(c_black);
draw_rectangle(confirm_x, confirm_y, confirm_x + confirm_w, confirm_y + confirm_h, true);

// text inside centered
draw_set_color(c_black);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_text(confirm_x + confirm_w * 0.5, confirm_y + confirm_h * 0.5, "Confirm");





