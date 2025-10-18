global.file_handling_data = {
	player_x: 320,
	player_y: 384,
	last_room: rm_fondeDeLala,
	player_inventory: [],
};
/*
// file_handling_save_game(slot_index)
function file_handling_save_game(_slot) {
    if (_slot == undefined) _slot = global.current_profile;
    if (_slot < 0) return;
    
    var _file_name = "SaveSlot" + string(_slot) + ".txt";
    var _string = json_stringify(global.file_handling_data);
    var _buffer = buffer_create(string_byte_length(_string) + 1, buffer_fixed, 1);
    
    buffer_write(_buffer, buffer_string, _string);
    buffer_save(_buffer, _file_name);
    buffer_delete(_buffer);
}

// file_handling_load_game(slot_index)
function file_handling_load_game(_slot) {
    if (_slot == undefined) _slot = global.current_profile;
    if (_slot < 0) return;
    
    var _file_name = "SaveSlot" + string(_slot) + ".txt";
    if (!file_exists(_file_name)) return false;

    var _buffer = buffer_load(_file_name);
    var _json = buffer_read(_buffer, buffer_string);
    buffer_delete(_buffer);
    
    global.file_handling_data = json_parse(_json);
    return true;
}
*/


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
