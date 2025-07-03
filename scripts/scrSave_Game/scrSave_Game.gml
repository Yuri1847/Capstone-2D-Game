function scrSave_Game(){

//AUTO SAVE RESOURCES SYSTEM

//Struct Object
//This Struct Object is Usefull to Organize Data you want to Save here
//Note. All data you want to save is need to Convert Into Struct format

/*
EXAMPLE: 
global.game_data = 
{
	hunger: 100,
	room_data: {}
};
*/

//To Save Game
function save_game(){
	//save_room() Function
	//save_room();
	
	
	//To Convert  global.game_data we can use json_stringify() to Convert JSON String
	//We can use Buffer for Complex Large Saving Resources
	
	
	//var _string = json_stringify( global.game_data);
	
	//var _buffer = buffer_create( string_byte_length( _string) + 1, buffer_fixed, 1);

	//buffer_write( _buffer, buffer_string, _string);

	//You noticed that there is a save.txt, this is 
	//important because this is where the data resources that will be saved will be placed.
	//All data resources
	//buffer_save( _buffer, "save.txt");
	
	//You notice that you see buffer_delete() this function deletes old previous data that is no longer needed
	//and it also reduces memory consumption
	//buffer_delete( _buffer);
	
}

//To Save Room()
function save_room(){
	//This Variable is for temporary container for storing resources
	//var _array = [];
	
	
//You noticed that there is a with() function whose contents are obj_cheese, obj_apple, 
//its purpose is to reference the objects you want to save, all objects that will be saved will 
//have their own reference so that they can be converted to Struct functions easily.
	
	/*with( obj_cheese)
	{
	
		var _struct = 
		{
			object: object_get_name( object_index),
			x: x,
			y: y,
			image_index: image_index

		};
		
		array_push( _array, _struct);
	
	}
	
	
	with( obj_apple)
	{
	
		var _struct = 
		{
			object: object_get_name( object_index),
			x: x,
			y: y,
			image_index: image_index,
			image_blend: image_blend

		};
		
		array_push( _array, _struct);
	
	}*/
	
	
//struct_set function Its first argument is global.game_data.room_data 
//here it will save all the data resources that you made into struct 
//second argument room_get_name(room) here it gets the name of the room to save the name and id 
//third argument _array here it will save an array containing the references of each object
	
	//struct_set( global.game_data.room_data, room_get_name(room), _array);
	
}


//To Load Game
function load_game()
{

	//checking if file is exist
	//if( file_exists( "save.txt")) 
	//{
		//load the file name save.txt to get the data converted to Json string
		//var _buffer = buffer_load( "save.txt");
		
		//Read to buffer_reader
		//var _json = buffer_read( _buffer, buffer_string);
	
		//buffer_delete() function to Delete Unnecessary Data to Avoid Memory Garbage
		//buffer_delete( _buffer);
		
		//Convert JSON String into JSON Array object to pass the data into 
		//global.game_data variable to retrieve all data resources
		//global.game_data = json_parse( _json);
		
		//Also the Load Room function to load everything in the room
		//load_room();

	//}

}


//To Load Room
function load_room()
{
	
	//struct_get() function to load global.game_data.room_data 
	//and get last saved room and put it in _array
	//var _array = struct_get( global.game_data.room_data, room_get_name( room));
	
	//Cheking if array is Undefined
	//if( _array != undefined)
	//{
		
		//You noticed that there is an instance_destroy between obj_apple, and obj_cheese so 
		//that it can replace the default content of each room and to clean up memory.
		//EXAMPLE
		//instance_destroy( obj_apple);
		//instance_destroy( obj_cheese);
		
		//
		//for( var i = 0; i < array_length( _array); i += 1) 
		//{
		
		//You noticed that there is a forloop to loop through the contents of 
		//the _array to put it into the instance_create_layer() function to 
		//place the objects in each room in the same order as the last one 
		//created in each room.
		
			//var _struct = _array[ i];
			
			//instance_create_layer( _struct.x, _struct.y, "Instances", asset_get_index( _struct.object), _struct);
			
		//}
	
	}

}
