global.state_slot3_data = {
	player_x: 0,
	player_y: 0,
	last_room: room_get_name(room),
	player_inventory: [],
	player_name: "Crisostomo Ibarra",
	reflections: {},
};



function state_slot3_save_game(){
	
	var _string = json_stringify(global.state_slot3_data);
	
	var _buffer = buffer_create( string_byte_length( _string) + 1, buffer_fixed, 1);

		buffer_write( _buffer, buffer_string, _string);

		buffer_save( _buffer, "StateSlot3.txt");

		buffer_delete( _buffer);
		
}

function state_slot3_load_game(){
	
	if( file_exists( "StateSlot3.txt")) 
	{
		var _buffer = buffer_load( "StateSlot3.txt");
	
		var _json = buffer_read( _buffer, buffer_string);
	
		buffer_delete( _buffer);
		
		global.state_slot3_data = json_parse( _json);
	}
}