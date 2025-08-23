
function create_dialog(_messages){
	if(instance_exists(obj_dialog)) return;
	
	var _inst = instance_create_depth(0 ,0 ,0 ,obj_dialog);
	_inst.messages = _messages;
	_inst.current_message = 0;
}

char_colors = {
	"Congrats": c_yellow,
	"Kapitan Tiago": c_yellow,
	"Ibarra": c_aqua
}

//tiago greet ibarra
greet_dialog = [
	{
		name: "Kapitan Tiago",
		msg: "Kamusta ka na!"
	},

	{
		name: "Ibarra",
		msg: "Mabuti naman po..."
	}
]

//ipinakilala ni tiago si ibarra sa ibang bisita sa handaan
tiago_introduced_ibarra = [
	{
		name: "Kapitan Tiago",
		msg: "May capurihan acóng ipakilala po sa inyo si Don Crisostomo Ibarra, na anac ng nasira cong caibigan"
	},
	{
		name: "Kapitan Tiago",
		msg: "Bagong galing sa Europa ang guinoong ito, at siya'y aking sinalubong"
	}
]