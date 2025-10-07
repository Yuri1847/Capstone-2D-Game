global.settings_data = {
	state_slot : [
	{
	date: "",
	time: "",
	background: 0
	},
	{
	date: "",
	time: "",
	background: 0
	},
	{
	date: "",
	time: "",
	background: 0
	}],
	audio: 
	{
	sound_effect_value: 0.8,
	background_music_value: 0.5
	}
};



function settings_save_game(){
	
	var _string = json_stringify(global.settings_data);
	
	var _buffer = buffer_create( string_byte_length( _string) + 1, buffer_fixed, 1);

		buffer_write( _buffer, buffer_string, _string);

		buffer_save( _buffer, "Settings.txt");

		buffer_delete( _buffer);
		
}

function settings_load_game(){
	
	if( file_exists( "Settings.txt")) 
	{
		var _buffer = buffer_load( "Settings.txt");
	
		var _json = buffer_read( _buffer, buffer_string);
	
		buffer_delete( _buffer);
		
		global.settings_data = json_parse( _json);
	}
}