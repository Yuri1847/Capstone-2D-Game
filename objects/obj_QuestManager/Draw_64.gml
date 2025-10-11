


if (global.quest_timer > 0) {
    global.quest_timer--;
    draw_set_font(fn_ui);
    draw_set_color(c_white);
    draw_text(32, 32, global.quest_notification);
}

