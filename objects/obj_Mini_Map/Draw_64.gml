//Draw background

var area = scr_get_camera_gui_area();

xx = area.x + minimap_margin;
yy = area.y + (area.h - h)/2;



if (!surface_exists(surfMinimapBg)){
	RefreshMapBG();
}
draw_surface(surfMinimapBg, xx, yy);

//Draw entities
if (!surface_exists(surfMinimapEntities)){
	surfMinimapEntities = surface_create(w, h);
}
surface_set_target(surfMinimapEntities);
draw_clear_alpha(c_black, 0.0);
with (obj_player)
{
    if (entityOnMinimap == true) draw_sprite_ext
    (
        spr_EntityPlayer,
        0,
        x/global.tile_size,
        y/global.tile_size,
        1.0,
        1.0,
        0.0,
		#FFFFFF,
        1.0
    );
}

with (obj_npc_parent)
{
	
	// === Draw Objective Icon if Active ===
var current_obj = global.story_chapters[global.current_chapter].objectives[global.current_objective];
	
	    if (entityNPC == true && current_obj.npc_id == npc_id && !current_obj.completed) {
			draw_sprite_ext(
	        spr_obj_icon,
	        0,
	        x/global.tile_size,
	        y/global.tile_size,
	        1.0,
	        1.0,
	        0.0,
			#FFFFFF,
	        1.0
			);
	}
}

surface_reset_target();
draw_surface(surfMinimapEntities, xx, yy);

//Draw Border
draw_sprite_stretched(spr_Minimap_Border, 0, xx, yy, w, h);