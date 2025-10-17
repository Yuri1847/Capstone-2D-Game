
depth = -1000;

current_tab = "profile";

journal_controller_id = instance_find(obj_journal_controller, 0);
visible = false;
global.journal_open = false;

// Tab data
tab_titles = ["Profile", "Quizzes", "Notes", "Inventory"];
tab_keys   = ["profile", "quiz", "notes", "inventory"];
tab_y = 50; // top position
tab_h = sprite_get_height(spr_tab);


