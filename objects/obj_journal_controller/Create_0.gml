
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

// === JOURNAL SCROLL VARIABLES ===
scroll_y = 0;            // current scroll offset
scroll_target_y = 0;     // smooth target scroll position
scroll_dragging = false; // are we dragging?
scroll_drag_start = 0;   // starting touch Y
scroll_drag_prev = 0;    // previous Y
scroll_speed = 0.8;     // smoothness factor

// this will be updated every draw
scroll_content_height = 0;


