
/// @description Journal UI - Create
depth = -1000;

// --- State ---
visible = false;
global.journal_open = false;
current_tab = "profile";

// --- References ---
journal_controller_id = instance_find(obj_journal_controller, 0);

// --- Tabs ---
tab_titles = ["Profile", "Challenges", "Notes", "Inventory"];
tab_keys   = ["profile", "challenge", "notes", "inventory"];
tab_h = sprite_get_height(spr_tab) * 2; 
tab_w = sprite_get_width(spr_tab);



// --- Back Button Setup ---
back_w = sprite_get_width(spr_journal_back) * 4;
back_h = sprite_get_height(spr_journal_back) * 2;

