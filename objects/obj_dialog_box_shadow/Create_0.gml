var gui_w = display_get_gui_width();
var gui_h = display_get_gui_height();

var surf = surface_create(gui_w, gui_h);
surface_set_target(surf);
draw_clear_alpha(c_black, 0);

// draw the sprite stretched to GUI size
draw_sprite_stretched(spr_dialog_box_shadow, 0, 0, 0, gui_w, gui_h);

surface_reset_target();

// create new sprite
var new_spr = sprite_create_from_surface(surf, 0, 0, gui_w, gui_h, false, false, 0 ,0);

// free surface
surface_free(surf);

// assign to object
sprite_index = new_spr;

instance_deactivate_object(id)