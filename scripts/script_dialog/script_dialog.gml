
function create_dialog(_messages){
	if(instance_exists(obj_dialog)) return;
	
	var _inst = instance_create_depth(0 ,0 ,0 ,obj_dialog);
	_inst.messages = _messages;
	_inst.current_message = 0;
}

char_colors = {
	"Congrats": c_yellow,
	"Kapitan Tiago": c_yellow,
	"Crisostomo Ibarra": c_aqua
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

//kinausap ni ibarra si damaso
ibarra_talk_damaso = [
	{
		name: "Crisostomo Ibarra",
		msg: "Aba!"
	},
	{
		name: "Crisostomo Ibarra",
		msg: "Ang cura ng aking bayan! Si pari Damaso ang matalic na caibigan ng aking ama!"
	},
	{
		name: "Crisostomo Ibarra",
		msg: "Aco po'y pagpaumanhinan ninyo, aco'y nagcamali!"
	},
	{
		name: "Padre Damaso",
		msg: "Hindî ca nagcamali!"
	},
	{
		name: "Padre Damaso",
		msg: "Nguni't cailan ma'y hindî co naguing caibigang matalic ang iyong ama!"
	},
]

//kinausap ni guevarra si ibarra
guevarra_talk_ibarra = [
	{
		name: "Tiniente Guevarra",
		msg: "Bagongtao, cayo po ba ang anac ni Don Rafael Ibarra?"
	},
	{
		name: "Tiniente Guevarra",
		msg: "Cahimanawarî dumatíng cayong malualhatì dito sa inyong lupaín, at magtamo nawa po cayo ng lalong magandang palad cay sa inyong ama"
	},
	{
		name: "Crisostomo Ibarra",
		msg: "Guinoo"
	},
	{
		name: "Crisostomo Ibarra",
		msg: "Ang inyo pong pagpuri sa aking ama ay pumapawì ng aking mga pag-alap-ap tungcol sa caniyang kinahinatnang palad, na aco, na canyang anac ay di co pa napagtatalos."
	},
]

//kinausap ni ibarra and mga kababaihan
ibarra_talk_females = [
	{
		name: "Crisostomo Ibarra",
		msg: "Itulot ninyo sa aking lacdangan co"
	},
	{
		name: "Crisostomo Ibarra",
		msg: "Ang mga utos ng mahigpit na pakikipagcapwa tao. Pitong taon na ngayong umalís acó rito sa aking bayan, at ng̃ayong aco'y bumalíc ay hindi co mapiguilan ang nasang aco'y bumáti sa lalong mahalagang hiyas niya"
	},
]
