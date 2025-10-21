button_size = sprite_get_width(spr_journal_button);
button_margin = 32;
hovered = false;

// Find the journal controller
journal_controller_id = instance_find(obj_journal_controller, 0);

// Make sure journal starts hidden
if (instance_exists(journal_controller_id)) {
    with (journal_controller_id) visible = false;
}
global.journal_open = false;

