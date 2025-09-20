

function create_dialogue(_messages){
	if(instance_exists(obj_dialog)) return;
	
	var _inst = instance_create_depth(0,0,0,obj_dialog);
	_inst.messages = _messages;
	_inst.current_message = 0;
}

char_colors = {
	"Crisostomo Ibarra" : c_olive,
	"Tiago" : c_aqua
}

welcome_dialog = [
	{
		name: "Crisostomo Ibarra",
		msg: "Kamusta ka na kapitan tiago"
	},
	{
		name: "Tiago",
		msg: "Mabuti naman ibarra"
	},
]
// level 3 
lvl_3_one = [
	{
		name: "Crisostomo Ibarra",
		msg: "Narito na tayo......"
	},
	{
		name: "Crisostomo Ibarra",
		msg: "Ipakita mo sa akin ang nitso ng aking ama"
	},
]
global.lvl_3_one_done = true;
