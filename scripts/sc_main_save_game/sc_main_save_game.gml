global.file_handling_data = {
	player_x: 320,
	player_y: 384,
	last_room: rm_fondeDeLala,
	player_inventory: [],
	player_name: "Crisostomo Ibarra",
	items : {
		key: {
				isKey_looted: false,
				key_x: 0,
				key_y: 0,
			},
	},
	npc_dialog: {
		tiago: false,
	}
};



function file_handling_save_game(){
	
	var _string = json_stringify(global.file_handling_data);
	
	var _buffer = buffer_create( string_byte_length( _string) + 1, buffer_fixed, 1);

		buffer_write( _buffer, buffer_string, _string);

		buffer_save( _buffer, "Noli.txt");

		buffer_delete( _buffer);
		
}


function file_handling_load_game(){
	
	if( file_exists( "Noli.txt")) 
	{
		var _buffer = buffer_load( "Noli.txt");
	
		var _json = buffer_read(_buffer, buffer_string);
	
		buffer_delete( _buffer);
		
		global.file_handling_data = json_parse( _json);
	}
	
}
