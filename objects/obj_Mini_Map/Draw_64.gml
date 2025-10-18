// Draw background (auto-regenerate if needed)
if (!surface_exists(surfMinimapBg)) {
    RefreshMapBG();
}
draw_surface_stretched(surfMinimapBg, x, y, minimap_display_w, minimap_display_h);

// Draw entities
if (!surface_exists(surfMinimapEntities)) {
    surfMinimapEntities = surface_create(w, h);
}
surface_set_target(surfMinimapEntities);
draw_clear_alpha(c_black, 0);

with (obj_Entity) {
    if (entityOnMinimap) {
        draw_sprite_ext(
            spr_EntityPlayer,
            0,
            x / global.tile_size,
            y / global.tile_size,
            1,
            1,
            0,
            c_white,
            1
        );
    }
}
surface_reset_target();

// Stretch entities to minimap display size
draw_surface_stretched(surfMinimapEntities, x, y, minimap_display_w, minimap_display_h);

// Border stays same size
draw_sprite_stretched(spr_Minimap_Border, 0, x, y, minimap_display_w, minimap_display_h);
