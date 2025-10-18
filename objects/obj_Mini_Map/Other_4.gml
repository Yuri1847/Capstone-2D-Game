function RefreshMapBG() {
    var surfTemp = surface_create(room_width, room_height);
    surfMinimapBg = surface_create(w, h);

    surface_set_target(surfTemp);
    draw_clear(c_black);

    getTilemapLayer();

    with (all) {
        if (object_index != obj_invisible_collision_block && object_index != obj_Invi_Block &&
            object_index != obj_ui_backpack && object_index != obj_ui_quest && object_index != obj_ui_button)
        {
            draw_self();
        }
    }

    with (obj_warp) {
        draw_sprite(spr_EntityWarp, 0, x, y);
    }

    surface_reset_target();

    // Stretch to minimap internal surface
    surface_set_target(surfMinimapBg);
    draw_surface_stretched(surfTemp, 0, 0, w, h);
    surface_reset_target();
    surface_free(surfTemp);
}
