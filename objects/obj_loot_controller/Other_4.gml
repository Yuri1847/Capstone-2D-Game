file_handling_load_game();
iskey_loot = global.file_handling_data.items.key.isKey_looted;
// Remove any existing keys before creating a new one

var _layer = layer_get_id("GUI");
if (_layer == -1) {
	_layer = layer_create(0, "GUI");
}

// Check what room we're in
switch (room)
{
    case rm_Hotel_Fonda_First_Floor:
		if(!iskey_loot){
			if(global.file_handling_data.items.key.key_x == 0 && global.file_handling_data.items.key.key_y == 0){
				xx = 0;
				yy = 0;
				repeat (100) {
					 xx = irandom_range(100, 600);
					 yy = irandom_range(100, 600);
					if (!position_meeting(xx, yy, [obj_par_environment, obj_invisible_collision_block, obj_Invi_Block])) {
						global.file_handling_data.items.key.key_x = xx;
						global.file_handling_data.items.key.key_y = yy;
						instance_create_layer(xx, yy, _layer, obj_key_drop);
						file_handling_save_game()
						break;
					}
				}
				
			} else {
				instance_create_layer(global.file_handling_data.items.key.key_x, global.file_handling_data.items.key.key_y, _layer, obj_key_drop);
			}
		}
    break;

    default:
        // No key in other rooms
    break;
}