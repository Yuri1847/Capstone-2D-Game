
depth = -1000;

current_tab = "profile";

journal_controller_id = instance_find(obj_journal_controller, 0);
visible = false;
global.journal_open = false;

// Tab data
tab_titles = ["Profile", "Challenges", "Notes", "Inventory"];
tab_keys   = ["profile", "challenge", "notes", "inventory"];
tab_y = 50; // top position
tab_h = sprite_get_height(spr_tab);

// Back button setup
back_margin = 50;
back_w = sprite_get_width(spr_journal_back) * 2;
back_h = sprite_get_height(spr_journal_back);



