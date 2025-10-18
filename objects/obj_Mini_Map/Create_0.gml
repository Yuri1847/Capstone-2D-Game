surfMinimapBg = -1;
surfMinimapEntities = -1;

global.tile_size = 8; // Keep for scaling

// Fixed minimap display size
minimap_display_w = 250;
minimap_display_h = 200;

// Still compute internal map scale (for correct proportions)
h = room_height / global.tile_size;
w = room_width / global.tile_size;

// Position on screen (GUI)
x = 20;
y = 20;