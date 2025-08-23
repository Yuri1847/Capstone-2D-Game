
function create_dialog(_messages){
	if(instance_exists(obj_dialog)) return;
	
	var _inst = instance_create_depth(0 ,0 ,0 ,obj_dialog);
	_inst.messages = _messages;
	_inst.current_message = 0;
}

char_colors = {
	"Congrats": c_yellow,
	"Tiago": c_yellow,
	"Ibarra": c_aqua
}

//tiago greet ibarra
greet_dialog = [
	{
		name: "Tiago",
		msg: "Kamusta ka na!"
	},

	{
		name: "Ibarra",
		msg: "Mabuti naman po..."
	}
]