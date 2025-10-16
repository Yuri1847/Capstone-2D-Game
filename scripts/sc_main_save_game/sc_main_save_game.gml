global.file_handling_data = {
	player_x: 320,
	player_y: 384,
	last_room: rm_fondeDeLala,
	player_inventory: [],
};



function file_handling_save_game(){
	
	var _string = json_stringify(global.file_handling_data);
	
	var _buffer = buffer_create( string_byte_length( _string) + 1, buffer_fixed, 1);

		buffer_write( _buffer, buffer_string, _string);

		buffer_save( _buffer, "NolimeTaaa.txt");

		buffer_delete( _buffer);
		
}

function file_handling_load_game(){
	
	if( file_exists( "NolimeTaaa.txt")) 
	{
		var _buffer = buffer_load( "NolimeTaaa.txt");
	
		var _json = buffer_read(_buffer, buffer_string);
	
		buffer_delete( _buffer);
		
		global.file_handling_data = json_parse( _json);
	}
	
}