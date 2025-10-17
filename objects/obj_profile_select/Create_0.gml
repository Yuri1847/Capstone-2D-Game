/// obj_profile_select Create
sc_profiles_init();         // ensure defaults defined
profile_system_load();      // load metadata from disk

selected_slot = -1;
confirm_delete = -1; // -1 none, else index waiting for confirmation
hover_slot = -1;

// UI geometry (GUI coords)
slot_x1 = display_get_gui_width() * 0.2;
slot_x2 = display_get_gui_width() * 0.8;
slot_y0 = display_get_gui_height() * 0.28;
slot_h = 96;
slot_spacing = 24;
font_ui = fnt_profile; // replace with your font
