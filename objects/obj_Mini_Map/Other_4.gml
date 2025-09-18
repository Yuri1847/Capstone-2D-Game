//Small to Medium Map size
//by width
if ((room_width >= 640 && room_width < 1280) && (room_height >= 360 && room_height < 720 )){
	global.tile_size = 3;
	h = room_height/global.tile_size;
	w = room_width/global.tile_size;
} 
//by height
else if ((room_width >= 360 && room_width < 720) && (room_height >= 640 && room_height < 1280 )){
	global.tile_size = 3;
	h = room_height/global.tile_size;
	w = room_width/global.tile_size;
} 


if ((room_width >= 1080 && room_width < 1300) && (room_height >= 720 && room_height < 1110 )){
	global.tile_size = 6;
	h = room_height/global.tile_size;
	w = room_width/global.tile_size;
} 
//by height
else if ((room_width >= 700 && room_width < 1110) && (room_height >= 1000 && room_height < 1300 )){
	global.tile_size = 7;
	h = room_height/global.tile_size;
	w = room_width/global.tile_size;
} 

//medium to large Map size
//by width
else if ((room_width >= 1300 && room_width < 1920) && (room_height >= 720 && room_height < 1110 )){
	global.tile_size = 5;
	h = room_height/global.tile_size;
	w = room_width/global.tile_size;
} 
//by height
else if ((room_width >= 720 && room_width < 1110) && (room_height >= 1300 && room_height < 1920 )){
	global.tile_size = 5;
	h = room_height/global.tile_size;
	w = room_width/global.tile_size;
} 

//large to extra large Map size
//by width
else if ((room_width >= 1920 && room_width < 3200 ) && (room_height >= 1110 && room_height < 3200  )){
	global.tile_size = 10;
	h = room_height/global.tile_size;
	w = room_width/global.tile_size;
} 
//by height
else if ((room_width >= 1110 && room_width < 3200 ) && (room_height >= 1920 && room_height < 3200  )){
	global.tile_size = 10;
	h = room_height/global.tile_size;
	w = room_width/global.tile_size;
} 


x = 20;
y = 20;

tilemap_array = [];

//refesh the map background
function RefreshMapBG(){
	surfMinimapBg = surface_create(room_width, room_height);
	var surfTemp = surface_create(room_width, room_height);
	surface_set_target(surfTemp)
		draw_clear(c_black);
		
		/*tilemap_array = ["ts_road", "ts_river", "ts_background", "ts_staff_station",
	"ts_interior_props", "ts_interior_walls_2","ts_interior_walls_1","ts_interior_walls","Tiles_floor"];
		
		for(var i = 0; i < array_length(tilemap_array); i++){
			draw_tilemap(layer_tilemap_get_id(layer_get_id(tilemap_array[i])), 0,0);
		}*/
		
		getTilemapLayer();
			with(all){
				if(object_index != obj_invisible_collision_block && object_index != obj_Invi_Block)
				draw_self();
			}
		
		with(obj_warp){
			draw_sprite(spr_EntityWarp, 0,x,y)
		}
		
		surface_reset_target();
		surface_set_target(surfMinimapBg);
		draw_surface_stretched(surfTemp, 0,0,w,h);
		surface_reset_target();
		surface_free(surfTemp);
}

RefreshMapBG()