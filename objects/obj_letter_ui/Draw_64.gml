if (is_undefined(letter_data)) exit;

var title = letter_data.title;
var pages = letter_data.pages;
var page_text = pages[current_page];

draw_set_font(font);
draw_set_color(c_white);

var margin = 64;
var text_x = margin;
var text_y = margin + 40;
var text_w = display_get_gui_width() - margin * 2;
var text_h = display_get_gui_height() - margin * 2;

draw_text_ext(text_x, text_y, page_text, text_w, text_h); // now correct: 5 arguments
draw_text(text_x, margin, title);
