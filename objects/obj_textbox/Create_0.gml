//textbox parameter
textbox_width = 446;
textbox_height = 126;
border = 16;
line_sep = 20;
line_width = textbox_width - border * 2;
txtb_spr = spr_dial_menu;
txtb_img = 0;
txtb_img_spd = 6/10;


// the text
page = 0;
page_number = 0;
text[0] = "Kamusta ka na Ibarra!";
text[1] = "Okay naman at po, Kap Tiago";
text[2] = "Halika na't ipapakilala kita sa iba pang bisita";
text[3] = "Oh sige po...";
text_length[0] = string_length(text[0]);
draw_char = 0;
txt_spd = 1;

setup = false; 