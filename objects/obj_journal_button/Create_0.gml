// Create Event
button_margin = 20; // padding from edges
button_size = sprite_get_width(spr_journal_button);


hovered = false;

// Find the journal controller
journal_controller_id = instance_find(obj_journal_controller, 0);

// Make sure journal starts hidden
if (instance_exists(journal_controller_id)) {
    with (journal_controller_id) visible = false;
}
global.journal_open = false;

