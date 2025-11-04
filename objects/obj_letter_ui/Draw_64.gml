/// DRAW GUI EVENT
var area = scr_get_camera_gui_area();

// === Background ===
draw_set_color(c_white);
draw_set_alpha(0.95);
//draw_rectangle(area.x, area.y, area.x + area.w, area.y + area.h, false);
draw_sprite_stretched(spr_quiz_bg, 0, area.x, area.y, area.x + area.w, area.y + area.h)
draw_set_alpha(1);

// === Section ratios ===
var h_total = area.h;
var h_top    = h_total * 0.20;
var h_mid1   = h_total * 0.20;
var h_mid2   = h_total * 0.40;
var h_bottom = h_total * 0.20;

var y_top_end    = area.y + h_top;
var y_mid1_end   = y_top_end + h_mid1;
var y_mid2_end   = y_mid1_end + h_mid2;
var y_bottom_end = area.y + area.h;

// === Dividers ===
draw_set_color(c_black);
draw_line(area.x, y_top_end,  area.x + area.w, y_top_end);
draw_line(area.x, y_mid1_end, area.x + area.w, y_mid1_end);
draw_line(area.x, y_mid2_end, area.x + area.w, y_mid2_end);

// Draw different panels depending on state
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_font(-1);
draw_set_color(c_black);

if (state == "title")
{
    // Big title in header area
    draw_text(area.x + area.w * 0.5, area.y + h_top * 0.45, _title_text);
    draw_text(area.x + area.w * 0.5, area.y + h_top * 0.85, "Tap to continue");
    // optionally draw a short scenario preview under header
    draw_set_halign(fa_left);
    draw_text(area.x + area.w * 0.1, y_top_end + h_mid1 * 0.5, scenario_text);
    return;
}
else if (state == "instruction")
{
    // Instruction panel: show instruction text centered
    draw_text(area.x + area.w * 0.5, area.y + h_top * 0.45, "Instruction");
    draw_set_halign(fa_center);
    draw_text(area.x + area.w * 0.5, area.y + h_top * 0.85, _instruction_text);
    return;
}
else if (state == "summary")
{
    // Show summary text in mid area
    draw_set_halign(fa_center);
    draw_text(area.x + area.w * 0.5, area.y + h_top * 0.35, "Reflection Summary");
    draw_set_halign(fa_left);
    draw_text(area.x + area.w * 0.1, y_top_end + h_mid1 * 0.1, _summary_text);
    return;
}

// else state == "play" -> draw the existing reflection UI (header, scenario, choices, confirm)

// === Header ===
draw_set_color(c_black);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_text(area.x + area.w * 0.5, area.y + h_top * 0.35, header_text);
draw_text(area.x + area.w * 0.5, area.y + h_top * 0.75, question_text);

// === Scenario ===
draw_set_halign(fa_left);
var text_x = area.x + area.w * 0.1;
draw_text(text_x, y_top_end + h_mid1 * 0.5, scenario_text);

// === Choices ===
var choice_x1 = text_x;
var choice_x2 = area.x + area.w * 0.9;
var choice_y = y_mid1_end + h_mid2 * 0.15;
var choice_h = 56;
var spacing = 16;

var colors = [c_red, c_blue, c_green];

for (var i = 0; i < array_length(choice_list); i++)
{
    var y_rect1 = choice_y + i * (choice_h + spacing);
    var y_rect2 = y_rect1 + choice_h;

    // Highlight selected choice
    if (i == selected_choice)
    {
        draw_set_color(make_color_rgb(240, 240, 180)); // soft yellow
        draw_rectangle(choice_x1, y_rect1, choice_x2, y_rect2, false);
    }

    draw_set_color(colors[i]);
    draw_rectangle(choice_x1, y_rect1, choice_x2, y_rect2, true);

    draw_set_color(c_black);
    draw_set_halign(fa_left);
    draw_text(choice_x1 + 12, y_rect1 + choice_h * 0.5, choice_list[i]);
}

// === Confirm Button ===
var confirm_w = 200;
var confirm_h = 48;
var confirm_x = area.x + area.w - confirm_w - 100;
var confirm_y = area.y + area.h - confirm_h - 20;

// Hover highlight
if (hover_confirm)
    draw_set_color(make_color_rgb(200, 230, 255));
else
    draw_set_color(c_white);
draw_rectangle(confirm_x, confirm_y, confirm_x + confirm_w, confirm_y + confirm_h, false);

// Border
draw_set_color(c_black);
draw_rectangle(confirm_x, confirm_y, confirm_x + confirm_w, confirm_y + confirm_h, true);

// Text
draw_set_color(c_black);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_text(confirm_x + confirm_w * 0.5, confirm_y + confirm_h * 0.5, "Confirm");
