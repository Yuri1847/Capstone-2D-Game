button_sprite = spr_diaryBtn;
panel_sprite  = spr_mainPanel;

margin_top = 64;
margin_right = 64;

button_w = sprite_get_width(button_sprite);
button_h = sprite_get_height(button_sprite);

show_diary = false;
current_page = 0;
max_page = 5; // example total pages

// Tabs
tab_names = ["KABANATA", "TAUGAN", "TALA", "GANTIMPALA", "PAGMUMUNI"];
current_tab = 0; // start on first tab