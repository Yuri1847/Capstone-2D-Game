global.file_handling_data = {
	player_x: 0,
	player_y: 0,
	last_room: room_get_name(room),
	player_inventory: [],
};



function file_handling_save_game(){
	
	var _string = json_stringify(global.file_handling_data);
	
	var _buffer = buffer_create( string_byte_length( _string) + 1, buffer_fixed, 1);

		buffer_write( _buffer, buffer_string, _string);

		buffer_save( _buffer, "NolimeTangere.txt");

		buffer_delete( _buffer);
		
}

function file_handling_load_game(){
	
	if( file_exists( "NolimeTangere.txt")) 
	{
		var _buffer = buffer_load( "NolimeTangere.txt");
	
		var _json = buffer_read( _buffer, buffer_string);
	
		buffer_delete( _buffer);
		
		global.file_handling_data = json_parse( _json);
	}
	
}