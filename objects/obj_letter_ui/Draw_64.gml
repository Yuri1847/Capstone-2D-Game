/// obj_letter_ui Draw GUI
draw_set_color(c_black);
draw_set_alpha(1);

// background overlay
draw_set_color(make_color_rgb(20,20,20));
draw_set_alpha(0.6);
draw_rectangle(0,0,display_get_width(),display_get_height(),false);
draw_set_alpha(1);

// letter window
var xs = ui_x; var ys = ui_y; var w = ui_w; var h = ui_h;
draw_set_color(make_color_rgb(245,238,220)); // parchment color
draw_rectangle(xs,ys,xs+w,ys+h,false);

// header
draw_set_color(c_black);
draw_set_font(fnt_letter); // ensure you have a font resource named fnt_letter or replace
draw_text(xs+24, ys+18, "Letter of the Nation — " + string(npc_name));

// context message (small)
if (string_length(context_msg) > 0) {
    draw_set_font(fnt_small); // have a small font or replace
    draw_text_ext(xs+24, ys+56, context_msg, w-48, 20);
}

// prompt question
draw_set_font(fnt_letter);
var qy = ys + 120;
draw_text(xs+24, qy, prompt_question);

// list choices
var cy = qy + 40;
var ch = 40;
var margin = 24;
for (var i=0; i<array_length(choices); i++) {
    var bx = xs + margin;
    var by = cy + i*(ch + 12);
    var bw = w - margin*2;
    var bh = ch;
    choice_bbox[i].xs = bx; choice_bbox[i].ys = by; choice_bbox[i].w = bw; choice_bbox[i].h = bh;

    // drawing highlight if selected
    if (selected_choice == i) {
        draw_set_color(make_color_rgb(200,220,255));
        draw_rectangle(bx-6, by-6, bx + bw + 6, by + bh + 6, false);
        draw_set_color(c_black);
    } else {
        draw_set_color(make_color_rgb(230,230,230));
        draw_rectangle(bx-2, by-2, bx + bw + 2, by + bh + 2, false);
        draw_set_color(c_black);
    }

    draw_text(bx + 12, by + 8, string(i+1) + ". " + choices[i].label);
}

// confirm button
var conf_x = xs + w - 180;
var conf_y = ys + h - 72;
draw_set_color(make_color_rgb(100,150,220));
draw_rectangle(conf_x, conf_y, conf_x + 160, conf_y + 48, false);
draw_set_color(c_white);
if (selected_choice >= 0) {
    draw_text(conf_x + 18, conf_y + 12, "Submit");
} else {
    draw_set_color(c_gray);
    draw_text(conf_x + 18, conf_y + 12, "Select an option");
}
