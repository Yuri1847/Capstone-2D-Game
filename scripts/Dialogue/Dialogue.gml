

function create_dialogue(_messages){
	if(instance_exists(obj_dialog)) return;
	
	var _inst = instance_create_depth(0,0,0,obj_dialog);
	_inst.messages = _messages;
	_inst.current_message = 0;
}
/*
char_colors = {
	"Crisostomo Ibarra" : c_olive,
	"Tiago" : c_aqua
}*/

welcome_dialog = [
	{
		name: "Crisostomo Ibarra",
		msg: "Kamusta ka na kapitan tiago"
	},
	{
		name: "Kapitan Tiago",
		msg: "Mabuti naman ibarra"
	},
]
//level 1
//chapter 2
chap2_dial1 = [
	{
		name: "[Narration]",
		msg: "(Pagdating ni Ibarra kasama ni Kapitan Tiyago. Nagulat ang lahat, lalo na sina Padre Sibyla at Padre Dámaso.)"
	},
	{
		name: "Kapitan Tiago",
		msg: "Magandang gabi po, mga ginoo! Magandang gabi po, among! - (Hinalikan niya ang mga kamay ng mga pari na nakalimot magbendisyon.)"
	},
	{
		name: "Kapitan Tiago",
		msg: "May karangalan akong ipakilala sa inyo si Don Crisóstomo Ibarra, anak ng yumaong kaibigan kong si Don Rafael. Bagong galing siya sa Europa, at ako mismo ang sumalubong sa kanya."
	},
	{
		name: "[Narration]",
		msg: "(Nagtitigan ang lahat. Namutla si Padre Dámaso, nagtanggal ng salamin si Padre Sibyla upang masdan ang binata.)"
	},
]
chap2_dial2 = [
	{
		name: "Crisostomo Ibarra",
		msg: "Aba! Ang kura sa aking bayan! Si Padre Dámaso, matalik na kaibigan ng aking ama!"
	},
	{
		name: "[Narration]",
		msg: "(Nagtinginan ang lahat kay Padre Dámaso. Hindi ito agad kumilos.)"
	},
	{
		name: "Crisostomo Ibarra",
		msg: "Paumanhin po, nagkamali yata ako."
	},
	{
		name: "Padre Damaso (paos)",
		msg: "Hindi ka nagkamali… Ngunit kailanma’y hindi ako naging matalik na kaibigan ng iyong ama."
	},
	{
		name: "[Narration]",
		msg: "(Dahan-dahang iniurong ni Ibarra ang kanyang kamay. Lumapit ang teniente.)"
	},
]
chap2_dial3 = [
	{
		name: "Tiniente Geuvarra",
		msg: "Binata, kayo po ba ang anak ni Don Rafael Ibarra?"
	},
	{
		name: "[Narration]",
		msg: "(Yumuko si Ibarra bilang tugon.)"
	},
	{
		name: "Tiniente Geuvarra",
		msg: "Nawa’y dumating kayo nang mapayapa sa inyong bayan, at nawa’y maging mas maganda ang kapalaran ninyo kaysa sa inyong ama. Nakilala ko siya, at masasabi kong isa siya sa mga taong marangal at kagalang-galang sa buong Filipinas."
	},
	{
		name: "Crisostomo Ibarra (nababagbag ang damdamin)",
		msg: "Ginoo, ang inyong papuri ay nagpapawi ng aking lungkot tungkol sa sinapit ng aking ama, na hanggang ngayon ay hindi ko pa lubos na nauunawaan."
	},
	{
		name: "[Narration]",
		msg: "(Naluha ang teniente, tumalikod at agad umalis. Naiwan si Ibarra sa gitna ng sala. Lumapit siya sa mga dalaga ngunit walang sumagot.)"
	},
]
chap2_dial4 = [
	{
		name: "Crisostomo Ibarra",
		msg: "Mga binibini, itulot ninyo sa akin ang pagbibigay-galang. Pitong taon akong nawala sa ating bayan, at ngayong nagbalik ako, nais kong bumati sa pinakamahalagang hiyas nito—ang mga anak nitong kababaihan."
	},
	{
		name: "[Narration]",
		msg: "(Tahimik ang mga dalaga, walang tumugon. Lumipat siya sa grupo ng mga ginoo.)"
	},
]
chap2_dial5 = [
	{
		name: "Crisostomo Ibarra",
		msg: "Mga ginoo, may kaugalian sa Alemanya: kapag walang magpakilala sa isang bagong dating, siya mismo ang nagsasabi ng kanyang pangalan. Huwag ninyo pong isipin na dala ko rito ang ugali ng mga banyaga, kundi dahil napipilitan lamang akong gawin ito. Ako po si Juan Crisóstomo Ibarra y Magsalin."
	},
	{
		name: "Isa sa mga binata",
		msg: "Ang pangalan ko’y A—á! (bahagyang yumuko)"
	},
	{
		name: "Crisostomo Ibarra",
		msg: "May karangalan ba akong makausap ang isang makata na siyang nagpanatili ng aking pagmamahal sa ating bayan? Bakit daw po kayo tumigil sa pagsusulat?"
	},
	{
		name: "Makata",
		msg: "Dahil ang dakilang diwa ng isip ay hindi para ipilit sa kasinungalingan. Hinatulan ako dahil isinulat ko ang katotohanang hindi nila matanggap. Sinabi ko lamang na “ang anak ng leon ay leon din naman.” Dahil doon, muntik na akong ipatapon."
	},
	{
		name: "[Narration]",
		msg: "(Lumayo ang makata. Dumating si Kapitan Tinong, masigla at nakangiti.)"
	},
]
chap2_dial6 = [
	{
		name: "Kapitan Tinong",
		msg: "Ginoong Ibarra! Hinahangad kong makilala kayo. Ako si Kapitan Tinong, kaibigan ni Kapitan Tiyago at ng inyong ama. Nakatira ako sa Tondo, malapit sa inyong bahay. Inaasahan kong dadalawin ninyo ako. Doon na kayo kumain bukas!"
	},
	{
		name: "Crisostomo Ibarra (nakangiti)",
		msg: "Salamat po! Ngunit bukas ay pupunta ako sa San Diego."
	},
	{
		name: "Kapitan Tinong",
		msg: "Sayang! Kung gayon, sa pagbabalik ninyo na lamang."
	},
	
]
chap2_dial7 = [
	{
		name: "[Narration]",
		msg: "(Dumating ang isang lingkod mula sa Café “La Campana.”)"
	},
	{
		name: "Lingkod",
		msg: "Handa na po ang pagkain!"
	},
	{
		name: "[Narration]",
		msg: "(Nagsimula nang magsiupuan ang mga panauhin, lalo na ang mga babae na nag-aatubili pa ring lumapit.)"
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
