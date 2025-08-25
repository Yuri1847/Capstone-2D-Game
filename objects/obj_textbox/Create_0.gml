//textbox parameter
textbox_width = 447;
textbox_height = 95;
border = 16;
line_sep = 12;
line_width = textbox_width - border*2;
txtb_spr = spr_textbox;
txtb_img = 0;
txtb_img_spd = 6/60;

//text
page = 0;
page_number = 0;
text[0] = "hello people of san diego";
text[1] = "test complete!";
text_length[0] = string_length(text[0]);
draw_char = 0;
text_spd = 1;

setup = false;