iskey_loot = global.file_handling_data.items.key.isKey_looted;
// Remove any existing keys before creating a new one

// Check what room we're in
switch (room)
{
    case rm_Hotel_Fonda_First_Floor:
		if(!iskey_loot){
			if(global.file_handling_data.items.key.key_x == 0 && global.file_handling_data.items.key.key_y == 0){
				repeat (100) {
					var xx = irandom_range(100, 600);
					var yy = irandom_range(100, 400);
					if (!position_meeting(xx, yy, obj_par_environment)) {
						global.file_handling_data.items.key.key_x = xx;
						global.file_handling_data.items.key.key_y = yy;
					    instance_create_layer(xx, yy, "Instances", obj_key_drop);
						file_handling_save_game()
					    break;
					}
				}
			} else {
				instance_create_layer(global.file_handling_data.items.key.key_x, global.file_handling_data.items.key.key_y, "Instances", obj_key_drop);
			}
		} else{
			global.file_handling_data.items.key.key_x = 0;
			global.file_handling_data.items.key.key_y = 0;
			
			file_handling_save_game()
		}
    break;

    default:
        // No key in other rooms
    break;
}