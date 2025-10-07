

function create_dialogue(_messages){
	if(instance_exists(obj_dialog)) return;
	
	var _inst = instance_create_depth(0,0,0,obj_dialog);
	_inst.messages = _messages;
	_inst.current_message = 0;
}
/*
// color for name....
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
//level 1 
//chapter 3
chap3_dial1 = [
	{
		name: "[Narration]",
		msg: "(Galit si Padre Damaso, sinisipa ang mga silya. Nagkakagulo ang mga panauhin. Ikaw, si Ibarra, ay nakaupo na sa kabisera ng hapag.)"
	},
	{
		name: "Padre Sibyla",
		msg: "Don Crisostomo, isang kagalakan na ikaw ay nasa piling naming muli."
	},
	{
		name: "[Narration]",
		msg: "[Dumating ang tinola. Sa harap mo’y inilapag ang masarap na bahagi ng manok. Sa harap ni Padre Damaso, puro leeg, pakpak, at upo.]"
	},
	{
		name: "Padre Damaso",
		msg: "Ano’ng kabalastugan ito? Ako ba’y isang hamak upang bigyan ng ganito?!"
	},
	{
		name: "[Narration]",
		msg: "(Nababalot ng katahimikan ang hapag. Pinili mong hindi makipagtalo, at nagpatuloy kang kumain nang mahinahon.)"
	},
	{
		name: "Laruja",
		msg: "Don Crisostomo, gaano ka katagal nawala sa Pilipinas?"
	},
	{
		name: "Crisostomo Ibarra",
		msg: "Mahigit pitong taon. Ngunit kailanman, hindi ko nakalimutan ang bayang ito."
	},
	{
		name: "Crisostomo Ibarra",
		msg: "Ngunit sa aking pagbabalik, tila Pilipinas ang nakalimot sa akin. Walang nagbalita ukol sa sinapit ng aking ama, si Don Rafael."
	},
	{
		name: "Donya Victoria",
		msg: "Kung gayon, bakit hindi ka na lamang tumelegrama? Mas madali sana iyon"
	},
	{
		name: "Crisostomo Ibarra",
		msg: "Dalawang taon akong nasa ibang bayan, malayo sa lahat. Walang paraan upang makipag-ugnayan"
	},
	{
		name: "[Narration]",
		msg: "(Nagpatuloy ang hapunan sa gitna ng malamig na katahimikan. Ramdam ang alitan ng mga panauhin, ngunit nanatili kang mahinahon, pinipilit igalang ang lahat sa kabila ng iyong hinanakit.)"
	},
]
//level 1
//chapter 4
chap4_dial1 = [
	{
		name: "[Narration]",
		msg: "(Gabi. Lumabas si Ibarra upang makalanghap ng sariwang hangin. Tahimik ang paligid habang binabaybay niya ang daan papuntang plasa ng Binondo.)"
	},
	{
		name: "Crisostomo Ibarra (walang tunog na paghinga)",
		msg: "Pitong taon akong nawala… ngunit parang isang gabi lang ang lumipas. Walang nagbago. Ang mga tindera pa rin ng prutas at gulay, naroon pa rin. Parang hindi umusad ang siyudad na ito.."
	},
	{
		name: "[Narration]",
		msg: "(May marahang tumapik sa balikat ni Ibarra. Paglingon niya, si Tinyente Guevarra pala.)"
	},
	{
		name: "Crisostomo Ibarra",
		msg: "Ah! Tinyente Guevarra! Matagal ko na sanang gustong itanong… Alam niyo po ba kung bakit nabilanggo ang aking ama?"
	},
	{
		name: "Tiniente Guevarra",
		msg: "Oo, Don Crisóstomo. Alam ko ang nangyari. Halina, maglakad tayo—at ikukuwento ko sa iyo."
	},
	{
		name: "[Narration]",
		msg: "(Naglakad silang dalawa pabalik sa kwartel habang nagsisimula ang kwento ng tinyente.)"
	},
	{
		name: "Tiniente Guevarra",
		msg: "Ang iyong ama, si Don Rafael Ibarra, ang pinakamayaman at pinakagalang sa aming lalawigan. Marami siyang natulungan, ngunit marami ring naiinggit at nagagalit sa kanya. Isa na riyan si Padre Dámaso."
	},
	{
		name: "Tiniente Guevarra",
		msg: "Madalas silang magtalo. Hanggang sa akusahan si Don Rafael na erehe, dahil daw hindi siya nangungumpisal."
	},
	{
		name: "Crisostomo Ibarra (halatang naguguluhan)",
		msg: "Erehe? Ang aking ama? Hindi ko matanggap iyon."
	},
	{
		name: "Tiniente Guevarra",
		msg: "Pakinggan mo muna. Noong mga panahong iyon, may isang Kastilang artilyero— isang hangal na palaging pinagtatawanan ng mga bata."
	},
	{
		name: "Tiniente Guevarra",
		msg: "Isang araw, sa tindi ng galit, binato niya ng baston ang mga bata. Tinamaan ang isa sa ulo at natumba. Nang hindi pa nakontento, sinipa pa niya ang bata."
	},
	{
		name: "[Narration]",
		msg: "(Bahagyang natahimik si Ibarra.)"
	},
	{
		name: "Tiniente Guevarra",
		msg: "Sakto namang napadaan ang iyong ama. Hinawakan niya ang artilyero sa bisig upang awatin, ngunit inakala ng mga tao na siya ang nananakit."
	},
	{
		name: "Tiniente Guevarra",
		msg: "Nagpumiglas ang artilyero, nadulas, tumama ang ulo sa bato, at doon namatay."
	},
	{
		name: "Crisostomo Ibarra (kitang-kita ang lungkot)",
		msg: "Kaya pala… ang kabutihan ng ama ko’y naging dahilan pa ng kanyang pagkasawi."
	},
	{
		name: "Tiniente Guevarra",
		msg: "Tama ka. Nang mamatay ang artilyero, si Don Rafael ang sinisi. Inimbestigahan siya at ikinulong."
	},
	{
		name: "Tiniente Guevarra",
		msg: "oon lumabas ang mga lihim niyang kaaway, at nagsilabasan ang mga huwad na saksi laban sa kanya. Tinawag siyang erehe at pilibustero."
	},
	{
		name: "Crisostomo Ibarra",
		msg: "At walang tumulong sa kanya?"
	},
	{
		name: "Tiniente Guevarra",
		msg: "Sinubukan kong ipagtanggol siya, ngunit walang naglakas-loob. Lahat ay takot na madamay. Hanggang sa tuluyan siyang namatay sa kulungan, walang pamilya o kaibigang nakiramay."
	},	
	{
		name: "[Narration]",
		msg: "(Matagal na katahimikan. Yumuko si Ibarra, halatang pinipigil ang luha.)"
	},
	{
		name: "Tiniente Guevarra",
		msg: "Nakakalungkot, Don Crisóstomo. Nang siya’y patay na, saka lamang napatunayan na siya ay walang sala."
	},
	{
		name: "[Narration]",
		msg: "(Tumingin sa malayo si Ibarra, mariin ang tinig.)"
	},
	{
		name: "Crisostomo Ibarra",
		msg: "Ama… Hindi ako papayag na manatiling madungisan ang iyong pangalan. Babangon ang San Diego, at maririnig muli ang kabutihan mo."
	},
	{
		name: "[Narration]",
		msg: "(Tahimik na lumayo si Ibarra, dala ang bigat ng katotohanang kanyang nalaman.)"
	},
]
//level 1
//chapter 5
chap5_dial1 = [
	{
		name: "[Narration]",
		msg: "(Sa silid ni Ibarra sa Fonda de Lala. Tahimik ang gabi. Pumasok si Ibarra, halatang pagod at malungkot.)"
	},
	{
		name: "Crisostomo Ibarra (umupo sa silya, nagbuntong-hininga)",
		msg: "Kay tagal kong nawala… ngunit tila mas mabigat pa rin ang lahat nang aking pagbalik. Ama… bakit kayo ginanito ng tadhana?"
	},
	{
		name: "[Narration]",
		msg: "(Lumapit siya sa bintana at minasdan ang tanawin sa labas.)"
	},
	{
		name: "Crisostomo Ibarra (mahina ang tinig)",
		msg: "Ang ilog ay payapa, subalit sa kabila’y may kasayahan. Mga tugtugan, tawanan, at liwanag… Ngunit sa puso ko, tanging dilim at dalamhati ang nangingibabaw."
	},
	{
		name: "[Narration]",
		msg: "(Naririnig ang tugtog ng orkestra mula sa kabilang bahay. Napatingin siya.)"
	},
	{
		name: "Crisostomo Ibarra (mahina ang tinig)",
		msg: "Isang piging… at—(napahinto) Sino yaong dilag? Liwanag sa gitna ng gabi… tila siya lamang ang nagbibigay-buhay sa madilim kong pag-iisip."
	},
	{
		name: "[Narration]",
		msg: "(Lumapit pa siya sa bintana, dahan-dahang ngumiti.)"
	},
	{
		name: "Crisostomo Ibarra (mahina ang tinig)",
		msg: "Maria Clara… Ang aking alaala, ang aking inspirasyon. Kay ganda mong tumanaw, tila pinapawi mo ang lahat ng sakit na iniwan ng nakaraan."
	},
	{
		name: "[Narration]",
		msg: "(Pumikit si Ibarra, dahan-dahang humiga sa kama.)"
	},
	{
		name: "Crisostomo Ibarra (mahina)",
		msg: "Sa piling ng iyong alaala, Maria… magtatamo ako ng kapahingahan."
	},
	{
		name: "[Narration]",
		msg: "(Unti-unting namatay ang ilaw sa silid habang patuloy ang tugtugin mula sa malayo. Nakatulog si Ibarra.)"
	},
	
]

//level 2
//chapter 7
chap7_dial1 = [
	{
		name: "[Narration]",
		msg: "(Lumipas ang ilang sandali. Dumating si Ibarra, suot ang kanyang amerikana. Tinanggap siya ni Kapitan Tiyago, at agad niyang hinanap si Maria Clara.)"
	},
	{
		name: "Crisostomo Ibarra",
		msg: "Nasaan si Maria Clara, Kapitan Tiyago?"
	},
	{
		name: "Kapitan Tiago",
		msg: "Naroon sa itaas, sa asotea. Tila ikaw na nga ang hinihintay niya maghapon."
	},
	{
		name: "[Narration]",
		msg: "(Lumakad si Ibarra patungong asotea. Nasa gilid si Maria Clara, nakatanaw sa hardin. Nang marinig ang mga yabag, napalingon siya.)"
	},
]
chap7_dial2 = [
	{
		name: "Maria Clara (namutla, nangingiti)",
		msg: "Crisóstomo!"
	},
	{
		name: "Crisostomo Ibarra (lumapit, nagalak)",
		msg: "Maria Clara… sa wakas! Matagal kong hinintay ang sandaling ito."
	},
	{
		name: "Maria Clara (namutla, nangingiti)",
		msg: "At ako naman, hindi mapakali sa bawat oras ng paghihintay."
	},
	{
		name: "[Narration]",
		msg: "(Nagkatinginan silang dalawa. Tahimik ang paligid, tanging huni ng mga ibon ang maririnig.)"
	},
	{
		name: "Crisostomo Ibarra",
		msg: "Naalala mo pa ba ang ating kabataan? Ang ating mga larong walang malisya, ang ating mga tampuhan?"
	},
	{
		name: "Maria Clara (ngumiti)",
		msg: "Paanong di ko malilimutan? May taglay pa ako ng mga dahong iyong ibinigay noon."
	},
	{
		name: "Crisostomo Ibarra (naglabas ng pitaka)",
		msg: "At ito naman ang tuyong dahon ng sambong na iniwan mo sa akin. Araw-araw kong kasama."
	},
	{
		name: "Maria Clara (ngumiti)",
		msg: "At ito? (iniabot ni Ibarra ang sulat) Ang liham mo bago ka tumulak sa Europa…"
	},
	{
		name: "Crisostomo Ibarra",
		msg: "Oo. Noon ay puno ako ng pag-asa—ngunit ngayon, pag-ibig ko na ang aking baon."
	},
	{
		name: "[Narration]",
		msg: "(Nagkatinginan sila nang matagal. Maya-maya’y nagsalita si Ibarra.)"
	},
	{
		name: "Crisostomo Ibarra",
		msg: "Maria, kailangan kong magtungo sa San Diego. Marami pa akong kailangang ayusin para sa aking ama."
	},
	{
		name: "Maria Clara (malungkot)",
		msg: "Ganun ba… kailan ka babalik?"
	},
	{
		name: "Crisostomo Ibarra",
		msg: "Bukas Todos los Santos na. Babalik agad ako, iyan ang aking pangako."
	},
	{
		name: "[Narration]",
		msg: "(Naluha si Maria Clara at itinago ang mukha sa panyo.)"
	},
	{
		name: "Maria Clara (malungkot)",
		msg: "Mahal kong Crisóstomo, mag-ingat ka. Napakarami raw tulisan sa daan, sabi ni Ama."
	},
	{
		name: "[Narration]",
		msg: "(Pumasok si Kapitan Tiyago.)"
	},
	{
		name: "Kapitan Tiago",
		msg: "Anak, huwag kang malungkot. Tirik mo ang pinakamahal na kandila kay San Roque at San Rafael, upang ligtas ang paglalakbay ni Ibarra."
	},
	{
		name: "[Narration]",
		msg: "(Tumango si Maria Clara habang pinapahid ang luha. Lumapit si Ibarra at marahang hinalikan ang kamay niya.)"
	},
	{
		name: "Crisostomo Ibarra",
		msg: "Hanggang sa muli, Maria Clara. Sa pagbalik ko, dala ko ang liwanag ng iyong mga mata."
	},
	{
		name: "[Narration]",
		msg: "(Dahan-dahan siyang lumakad palayo. Naiwan si Maria Clara sa asotea, pinagmamasdan ang papalayong karwahe, habang unti-unting dumidilim ang langit.)"
	},
]


// level 3 
chap13_dial1 = [
	{
		name: "Crisostomo Ibarra",
		msg: "Narito ba tayo sa tamang lugar? Sabi mo’y dito nakahimlay si Ama."
	},
	{
		name: "Katiwala",
		msg: "Opo, Don Crisóstomo. Dito po ako nagtanim ng mga bulaklak at nagtayo ng krus bilang palatandaan. Ngunit... matagal na rin akong ‘di nakabalik dahil nagkasakit ako. Si Kapitan Tiago po ang nagsabing siya na ang bahalang magpaayos ng nitso."
	},
	{
		name: "[Narration]",
		msg: "(Lumapit sila sa lugar. Huminto si Ibarra sa harap ng isang malungkot na tanawin—may lupa, ngunit wala ang krus.)"
	},
	{
		name: "Crisostomo Ibarra (nalilito)",
		msg: "Nasaan ang libingan ng aking ama? Nasaan ang krus na iyong itinayo?"
	},
	{
		name: "Katiwala (gulat)",
		msg: "Diyos ko! Nandito po iyon! May mga bulaklak pa nga noon... hindi ko alam kung bakit nawala!"
	},
	{
		name: "[Narration]",
		msg: "(Agad silang nagtungo sa bahay ng sepulturero na nasa dulo ng sementeryo.)"
	},
	{
		name: "Katiwala ",
		msg: "Tao po! Kaibigan, may natanaw ka bang libing na may krus at mga bulaklak? Ang kay Don Rafael Ibarra!"
	},
	{
		name: "Sepulturero (humihikab, tila walang malasakit)",
		msg: "Ah... iyon ba? Sinunog ko na ang krus. Utos ni Padre Garrote."
	},
	{
		name: "Crisostomo Ibarra (matigas ang tinig)",
		msg: "Sinunog? Bakit?! Nasaan ang bangkay ng aking ama?!"
	},
	{
		name: "Sepulturero (humihikab, tila walang malasakit)",
		msg: "Eh... eh... pinaalis daw ni Padre Damaso—este, ni Padre Garrote. Ipinapalipat sa libingan ng mga Intsik. Pero dahil sa bigat ng bangkay at lakas ng ulan, eh... tinapon na lang namin sa lawa."
	},
	{
		name: "[Narration]",
		msg: "(Napatigagal si Ibarra. Tila napako sa kinatatayuan. Ang hangin ay biglang lumakas, kumidlat.)"
	},
	{
		name: "Katiwala (naluluha)",
		msg: "Diyos ko... kaawa-awang Don Rafael!"
	},
	{
		name: "Crisostomo Ibarra (nanlilisik ang mga mata)",
		msg: "Tinapon... sa lawa ang aking ama?! Wala bang konsensya ang mga paring iyon?!"
	},
	{
		name: "[Narration]",
		msg: "(Bigla siyang tumakbo palabas ng sementeryo. Bumuhos ang ulan. Sa daan, nasalubong niya si Padre Salvi.)"
	},
]
chap13_dial3 = [
	{
		name: "Padre Salvi (nagulat)",
		msg: "Don Crisóstomo! Anong nangyayari sa inyo?"
	},
	{
		name: "Crisostomo Ibarra (galit na galit, hinawakan sa balikat ang pari)",
		msg: "Ikaw ba ang may kagagawan nito?! Ikaw ba ang nag-utos na itapon ang bangkay ng aking ama?!"
	},
	{
		name: "Padre Salvi (nanginginig)",
		msg: "Hindi! Hindi ako! Ako’y walang alam sa bagay na iyan!"
	},
	{
		name: "Crisostomo Ibarra ",
		msg: "Kung hindi ikaw... sino?! Sino ang hayop na gumawa nito?!"
	},
	{
		name: "Padre Salvi (mahina)",
		msg: "Si... si Padre Damaso. Siya ang tinutukoy nilang “Padre Garrote.”"
	},
	{
		name: "[Narration]",
		msg: "(Binitiwan ni Ibarra si Padre Salvi. Nanginginig ito sa galit, halos di makahinga sa bigat ng damdamin.)"
	},
	{
		name: "Crisostomo Ibarra ",
		msg: "Padre Damaso... Kay tagal kong pinigil ang aking damdamin, ngunit ngayon—hindi ko na kaya!"
	},
	{
		name: "[Narration]",
		msg: "(Lumiksi ang kidlat, kasabay ng kulog. Tumakbo si Ibarra palayo, basang-basa sa ulan, habang ang langit ay tila nakikidalamhati sa kanyang poot.)"
	},
]

// level 3 
//chapter 19
chap19_dial1 = [
	{
		name: "[Narration]",
		msg: "(Tahimik silang naglalakad sa gilid ng lawa. Sandaling huminto si Ibarra at tumingin sa tubig.)"
	},
	{
		name: "Crisostomo Ibarra",
		msg: "Dito... dito raw itinapon ang bangkay ng aking ama. Kay lupit ng tadhana. Ngunit ngayon, gusto kong gawing lugar ng pag-asa ang pook na ito."
	},
	{
		name: "Guro (mahinahon)",
		msg: "Don Crisóstomo, wala kayong dapat ipagpasalamat sa aking pagpunta. Malaki ang utang na loob ko kay Don Rafael. Noong siya’y nabubuhay pa, tinulungan niya kaming mga guro, gayon din ang mga batang walang kakayahang mag-aral."
	},
	{
		name: "Crisostomo Ibarra",
		msg: "Kung gayon, natutuwa akong marinig na may naiwang kabutihan ang aking ama. Ngunit... ano na ang kalagayan ng mga paaralan ngayon?"
	},
	{
		name: "Guro (malungkot na tinig)",
		msg: "Ah, Ginoo... Marami pong suliranin. Walang interes ang mga bata sa pag-aaral, at ang mga magulang naman ay hindi nagkakaisa. Kulang kami sa kagamitan, sa silid-aralan, at sa pag-asa. At higit sa lahat ang mga pari ay labis na nakikialam sa aming paraan ng pagtuturo."
	},
	{
		name: "Crisostomo Ibarra (nakikinig nang mabuti)",
		msg: "Paanong panghihimasok, Ginoo?"
	},
	{
		name: "Guro (mahinahon)",
		msg: "Kung minsan, ipinagbabawal nila ang pagtuturo ng wikang Kastila. Sinasaway ang paggamit ng mga bagong aklat at itinuturo sa amin na takutin na lang ang mga bata kaysa turuan. Kaya kahit magsikap kami, nananatiling mangmang ang marami.."
	},
	{
		name: "[Narration]",
		msg: "(Tumango si Ibarra, halatang naantig.)"
	},
	{
		name: "Crisostomo Ibarra (nakikinig nang mabuti)",
		msg: "Tama ka, Ginoo. Ang lipunan ay di uunlad hangga’t hindi natututong mag-isip ang kabataan. Pangako ko sa iyo sa abot ng aking makakaya, tutulungan ko ang mga guro at ang mga mag-aaral ng San Diego. Magtatayo ako ng isang paaralang maayos, isang paaralang magtuturo ng karunungan at dangal."
	},
	{
		name: "Guro (napaluha)",
		msg: "Don Crisóstomo... kung magagawa ninyo iyon, hinding-hindi ko malilimutan ang kabutihang iyon. Maging ang inyong ama ay matutuwa kung siya’y nakikinig ngayon."
	},
	{
		name: "Crisostomo Ibarra (matatag ang tinig)",
		msg: "Sa darating na pagpupulong sa bulwagang bayan, ipahahatid ko ang ating napag-usapan. Hindi ko hahayaang manatili sa dilim ang ating bayan."
	},
	{
		name: "[Narration]",
		msg: "(Tumingin si Ibarra sa lawa, habang humahampas ang alon sa pampang. Lumambot ang ekspresyon ng kanyang mukha.)"
	},
	{
		name: "Crisostomo Ibarra (matatag ang tinig)",
		msg: "Ama... sa tubig na nagkubli sa iyong katahimikan, dito ko ipapangako ang liwanag ay muling sisikat para sa mga anak ng San Diego."
	},
	{
		name: "[Narration]",
		msg: "(Tila sumabay ang ihip ng hangin sa kanyang mga salita. Nagtapos ang tagpo sa tanawing payapa ngunit puno ng pag-asa.)"
	},
]


// level 4
chap22_dial1 = [
	{
		name: "[Narration]",
		msg: "(Sa labas, maririnig ang pagdating ng karwahe. Bumaba si Ibarra, suot ang marangal na kasuotan. Lumingon siya sa bintana at ngumiti.)"
	},
	{
		name: "Crisostomo Ibarra",
		msg: "Maria Clara!"
	},
	{
		name: "Maria Clara (masiglang tumakbo pababa)",
		msg: "Crisóstomo! Mabuti’t nakarating ka!"
	},
	{
		name: "Crisostomo Ibarra",
		msg: "Nauna akong dumating upang ipaalam sa’yo — nais kong magdaos tayo ng isang piknik sa tabing-ilog bukas. Sama-sama tayo ng ating mga kaibigan."
	},
	{
		name: "Maria Clara (nag-aalangan)",
		msg: "Nakakatuwa iyon... ngunit, Crisóstomo, kung maaari lamang huwag mo sanang isama si Padre Salvi. Hindi ako mapalagay kapag naroon siya."
	},
	{
		name: "Crisostomo Ibarra (mahinahon)",
		msg: "Ngunit, Maria Clara, siya ay panauhin mo. At mabuti naman ang kanyang pakikitungo sa akin. Huwag kang mag-alala sa ibang bangka ko siya patatawirin, upang di siya makasama sa ating paglalayag."
	},
	{
		name: "Maria Clara (napangiti)",
		msg: "Kung gayon, ayon na nga. Ayokong masira ang araw nating iyon."
	},
	{
		name: "[Narration]",
		msg: "(Biglang dumating si Padre Salvi. Napatingin si Maria Clara at nagpaalam upang magpahinga.)"
	},
]
chap22_dial2 = [
	{
		name: "Padre Salvi",
		msg: "Magandang gabi, Don Crisóstomo. Hindi ko akalaing matatagpuan kita rito."
	},
	{
		name: "Crisostomo Ibarra (magalang)",
		msg: "Padre, nagkataon lamang po. Nais ko sanang anyayahan kayo bukas sa aming munting piknik sa tabing-ilog."
	},
	{
		name: "Padre Salvi (nakangiti ngunit malamig ang tinig)",
		msg: "Isang malaking karangalan iyan. Salamat, Don Ibarra. Ako’y sasama."
	},
	{
		name: "[Narration]",
		msg: "(Paglubog ng araw, nagpaalam si Ibarra.)"
	},
	{
		name: "Crisostomo Ibarra",
		msg: "Magandang gabi po, Padre. Magpahinga na rin po kayo. Maraming dapat asikasuhin bukas."
	},
	{
		name: "Padre Salvi ",
		msg: "Gayon din sa inyo, Don Crisóstomo. Nawa’y maging mapayapa ang inyong gabi."
	},
]

//level 4
//chapter 23
chap23_dial1 = [
	{
		name: "[Narration]",
		msg: "(Tawanan ang mga dalaga. Pagdating nila sa tabing-ilog, naroon na ang mga binata.)"
	},
	{
		name: "Crisostomo Ibarra",
		msg: "Magandang umaga sa inyo! Tila mga bulaklak kayo sa umagang ito."
	},
	{
		name: "Sinang (mahinhing ngumiti bigla)",
		msg: "Magandang umaga rin po, Don Crisóstomo."
	},
	{
		name: "[Narration]",
		msg: "(Nagsimula silang maglayag. Ang mga lalaki’y nasa kabilang bangka.)"
	},
]
chap23_dial2 =[
	{
		name: "Elias",
		msg: "Magaan itong bangka... pero teka—ano iyon? May tumutulo!"
	},
	{
		name: "Crisostomo Ibarra",
		msg: "Limang butas! Maglipat na tayo bago tayo lumubog!"
	},
	{
		name: "[Narration]",
		msg: "(Agad silang lumipat sa bangkang sinasakyan ng mga dalaga. Nagkatinginan ang lahat, napayuko ang mga babae.)"
	},
	{
		name: "Iday (mahina)",
		msg: "Nakakahiya naman, andito na sila sa bangka natin..."
	},
	{
		name: "Maria Clara (mahinang tawa)",
		msg: "Hayaan mo na, Iday. Mas masaya naman pag-sama-sama."
	},
	{
		name: "[Narration]",
		msg: "(Umawit si Maria Clara ng isang kundiman, lahat ay natahimik at nakinig.)"
	},
	{
		name: "[Narration]",
		msg: "(May sumulpot na buwaya sa ilog! at tumalon si Elias sa tubig, walang pag-aalinlangan.)"
	},
	{
		name: "[Narration]",
		msg: "(Nilusob ni Elias ang buwaya, ngunit malakas ito. Hindi na nakatiis si Ibarra tumalon din siya upang tulungan si Elias.)"
	},
	{
		name: "Crisostomo Ibarra",
		msg: "Hawakang mabuti ang bangka! Ako na ang bahala rito!"
	},
	{
		name: "[Narration]",
		msg: "(May sagupaan sa tubig. Saglit na tensyon, hanggang sa tuluyang napatay ang buwaya.)"
	},
	{
		name: "[Narration]",
		msg: "(Nang makabalik si Elias at Ibarra, basang-basa ngunit ligtas, muling bumalik ang ngiti sa lahat. Nagpatuloy sila sa pangingisda, at sa wakas ay nakahuli rin ng sariwang isda.)"
	},
]


//level 5
//chapter 31
chap31_dial1 = [
	{
		name: "[Narration]",
		msg: "Nagsimula na ang misa. Lahat ng mata ay nakatuon kay Padre Damaso habang siya’y umaakyat sa pulpito upang magsermon."
	},
	{
		name: "Padre Damaso (malakas ang tinig)",
		msg: "Ang salita ng Diyos ay tulad ng binhing dapat itanim sa mabuting lupa!(Mayabang ang tindig) Ngunit, mga anak, ano ang saysay kung ito’y itatanim sa mabatong puso? Wala itong tutubong bunga!"
	},
	{
		name: "[Narration]",
		msg: "Namangha sina Padre Sibyla at Padre Martin sa simula ng sermon. Maganda ang daloy ng pananalita ng pari, ngunit habang tumatagal—unti-unti nang nagiging mapanumbat ang tono."
	},
	{
		name: "Padre Damaso",
		msg: "Tingnan ninyo si David! Si Roland! Mga bayani ng pananampalataya! Ngunit sa ating bayan, ilan kaya ang tunay na sumusunod sa Diyos? May mga anak ngayon ng mga erehe!—walang galang, bastos, at akala mo’y kung sinong banal!"
	},
	{
		name: "[Narration]",
		msg: "(Tahimik ang mga tao. Ang mga Indio ay nagkakatinginan, di naiintindihan ang sermon na puro Kastila.)"
	},
	{
		name: "[Narration]",
		msg: "Hindi maintindihan ng mga Indio ang sermon. Tanging mga salitang “tulisan,” “gwardiya sibil,” “San Francisco,” at “San Diego” lamang ang naiintindihan nila. Marami na ang nahihimbing—si Kapitan Tiago ay naghihikab, at si Maria Clara ay palihim na sumusulyap kay Ibarra."
	},
	{
		name: "Crisostomo Ibarra",
		msg: "Samantala, nanatiling tahimik si Ibarra ngunit bakas sa mukha niya ang galit. Alam niyang siya ang pinatatamaan ni Padre Damaso."
	},
	{
		name: "Padre Damaso (malakas, may diin)",
		msg: "Ang mga anak ng erehe ay walang galang sa simbahan! Sila’y mga binhing itinanim ng demonyo sa lupain ng Diyos!"
	},
	{
		name: "[Narration]",
		msg: "(Tumahimik ang lahat. Napatungo si Ibarra, mahigpit ang pagkakakuyom ng kamao.)"
	},
	{
		name: "Crisostomo Ibarra (mahinang bulong)",
		msg: "Sobra na ito, Padre..."
	},
	{
		name: "[Narration]",
		msg: "Ngunit bago pa man makagawa ng hakbang si Ibarra, isang lalaking hindi napansin ng sinuman ang pumasok sa simbahan si Elias."
	},
]
chapt31_dial2 = [
	{
		name: "Elias (mahinang boses, lumapit kay Ibarra)",
		msg: "Don Crisóstomo, mag-ingat ka bukas sa seremonya ng pagbabasbas. Huwag kang lalapit sa pundasyong bato... baka iyon na ang huling araw mo."
	},
	{
		name: "Crisostomo Ibarra (nagulat)",
		msg: "Elias? Bakit—"
	},
	{
		name: "[Narration]",
		msg: "Ngunit nang lingunin niya, wala na si Elias. Tanging sermon ni Padre Damaso at bulungan ng mga tao ang naririnig. At sa katahimikang iyon, naramdaman ni Ibarra ang papalapit na bagyo ang bagyong magpapabago sa kanyang kapalaran."
	},
]
//chapter 32
chap32_dial1 = [
	{
		name: "[Narration]",
		msg: "Isang mahalagang araw para kay Ibarra. Itatayo na ang paaralang matagal niyang pinangarap, alaala ng kanyang ama."
	},
	{
		name: "[Narration]",
		msg: "(Maririnig ang tugtugan ng banda. May mga palosebo, pabitin, at pukpok sa palayok.)"
	},
	{
		name: "Guro",
		msg: "Don Crisóstomo, napakaganda po ng handa ninyo! Tiyak na matutuwa ang mga bata sa bagong paaralan."
	},
	{
		name: "Crisostomo Ibarra (nagulat)",
		msg: "Sana nga. Ang paaralang ito’y para sa kanila—para sa kinabukasan ng San Diego."
	},
	{
		name: "[Narration]",
		msg: "Dumating ang mga panauhin: ang alkalde, Kapitan Tiago, Alperes, at si Padre Salvi. Sa gitna ng kasiyahan, kapansin-pansin ang kagandahan ni Maria Clara."
	},
	{
		name: "[Narration]",
		msg: "(Huminto ang banda. Tumahimik ang lahat.)"
	},
]
chap32_dial2 = [
	{
		name: "Alkalde",
		msg: "Mga ginoo at ginang, magsisimula na tayo sa seremonya ng paghuhugos!"
	},
	{
		name: "[Narration]",
		msg: "Pinalibutan ng lahat ang malaking uka sa lupa. Sa itaas ng makinarya ay naroon ang taong madilaw—nakangisi, at tila may inaantabayanan."
	},
	{
		name: "[Narration]",
		msg: "(Napatitig si Ibarra sa itaas, kumabog ang kanyang dibdib.)"
	},
	{
		name: "Crisostomo Ibarra (mahina)",
		msg: "Ang taong iyon… (Biglang naalala ang tinig ni Elias: “Huwag kang lalapit sa pundasyong bato…”)"
	},
	{
		name: "[Narration]",
		msg: "Ngunit nabuhayan siya ng loob nang mapansin si Elias sa may tabi ng makinarya—tila nagmamasid at handang kumilos."
	},
	{
		name: "Padre Salvi (nanginginig ang tinig habang nagbabasa)",
		msg: "Pagpalain nawa ng Diyos ang bagong bahay-aralan na maghahatid ng liwanag sa San Diego…"
	},
	{
		name: "[Narration]",
		msg: "Ipinasok na ang kahong kristal sa tinggang bumbong. Nagmungkahi ang alkalde na si Ibarra ang maglagay sa uka ng bato."
	},
	{
		name: "Crisostomo Ibarra",
		msg: "Hindi, ginoo. Ang karangalan ay ibigay na lamang natin sa Eskribano."
	},
	{
		name: "[Narration]",
		msg: "(Inilagay ng Eskribano ang bumbong sa uka. Sinundan ito ng basbas ni Padre Salvi at ng mga piling panauhin.)"
	},
	{
		name: "[Narration]",
		msg: "Isa-isa silang bumaba. Una ang alkalde, sinundan ni Padre Salvi na halatang nanginginig habang naglalagay ng simyento."
	},
	{
		name: "Padre Salvi (mahina, nanginginig)",
		msg: "S-sumainyo nawa ang pagpapala ng langit..."
	},
	{
		name: "[Narration]",
		msg: "Napansin ni Padre Salvi na hindi pa nagpapalitada si Ibarra. Pinilit niya itong lumapit."
	},
	{
		name: "Padre Salvi (mahina, nanginginig)",
		msg: "Don Crisóstomo, kayo naman. Ang bayan ay naghihintay."
	},
	{
		name: "[Narration]",
		msg: "(Ngumiti si Ibarra at kinuha ang pala.)"
	},
	{
		name: "Crisostomo Ibarra",
		msg: "Kung gano’n… para sa bayan at sa kabataan ng San Diego."
	},
	{
		name: "[Narration]",
		msg: "(Habang itinataas niya ang pala, biglang pumutok ang tunog ng lubid—“KRRAAAK!”)"
	},
	{
		name: "[Narration]",
		msg: "Isang iglap lang, bumagsak ang malaking bato! Nagkagulo ang lahat—sigawan, takbuhan, alikabok at ingay!"
	},
	{
		name: "Maria Clara",
		msg: "Ibarraaa!"
	},
	{
		name: "[Narration]",
		msg: "(Tumigil ang lahat. Dahan-dahang lumitaw si Ibarra mula sa usok, hawak pa rin ang pala.)"
	},
	{
		name: "[Narration]",
		msg: "Nakita siyang nakatayo, buhay. Ngunit sa kanyang paanan-ay ang duguang katawan ng taong madilaw."
	},
	{
		name: "Elias (mahina, nakatingin kay Ibarra)",
		msg: "Salamat sa Diyos… nakaligtas ka."
	},
	{
		name: "[Narration]",
		msg: "At sa gitna ng sigawan, natanto ni Ibarra ang babala ni Elias ay totoo.Ang liwanag na kanyang hinahangad,ay muntik nang lamunin ng dilim."
	},
]
// chapter 33
chap33_dial1 = [
	{
		name: "[Narration]",
		msg: "(May marahang katok sa pinto.)"
	},
	{
		name: "Crisostomo Ibarra (lumapit)",
		msg: "Sino ‘yan?"
	},
	{
		name: "Elias (mahinahon)",
		msg: "Ako ito, Don Crisóstomo. Si Elias."
	},
	{
		name: "Crisostomo Ibarra",
		msg: "Ipakita mo sa akin ang nitso ng aking ama"
	},
	{
		name: "[Narration]",
		msg: "(Binuksan ni Ibarra ang pinto. Lumitaw si Elias, basang-basa ng ulan.)"
	},
	{
		name: "Crisostomo Ibarra",
		msg: "Elias! Hindi ko inaasahan ang pagdalaw mo. Halika, pumasok ka."
	},
	{
		name: "Elias (umiling)",
		msg: "Hindi na, Don Crisóstomo. Sandali lang ako. Nais ko lang magbigay ng babala."
	},
	{
		name: "Crisostomo Ibarra",
		msg: "Babala? Tungkol saan?"
	},
	{
		name: "Elias",
		msg: "Mag-ingat ka. Hindi mo alam kung sino ang tunay mong mga kaaway. Kailangang paniwalaan nilang pinagkakatiwalaan mo sila—iyan lamang ang paraan para manatili kang ligtas."
	},
	{
		name: "Crisostomo Ibarra (naguguluhan)",
		msg: "Sino ang tinutukoy mo, Elias? Sino ang mga kalaban kong iyon?"
	},
	{
		name: "Elias",
		msg: "Isa na roon ang taong madilaw—ang nagtangkang pumatay sa iyo sa seremonya ng paghuhugos."
	},
	{
		name: "Crisostomo Ibarra (malungkot)",
		msg: "Sayang at namatay siya. Makakausap sana natin, malalaman sana natin ang dahilan."
	},
	{
		name: "Elias (matigas ang tinig)",
		msg: "Mas mabuti nang ganoon. Kung nabuhay siya, baka makatakas pa at maghasik ng mas malaking kasamaan."
	},
	{
		name: "[Narration]",
		msg: "(Sandaling katahimikan. Dumadagundong ang kulog sa labas.)"
	},
	{
		name: "Crisostomo Ibarra (malungkot)",
		msg: "Mabigat pakinggan, Elias. Ngunit salamat sa iyong paalala."
	},
	{
		name: "Elias",
		msg: "Hindi ko ginagawa ito para sa akin. Ginagawa ko ito dahil naniniwala ako sa iyo, sa iyong mga layunin."
	},
	{
		name: "Crisostomo Ibarra (malungkot)",
		msg: "At naniniwala ako sa Diyos—higit pa sa mga himala na pinaniniwalaan ng marami."
	},
	{
		name: "Elias (tumango)",
		msg: "Tama ka. Ang pananampalataya sa Diyos ay higit na totoo kaysa sa mga milagro ng mga taong mapagpanggap."
	},
	{
		name: "[Narration]",
		msg: "(Tahimik silang nagkatitigan. Ramdam ang bigat ng gabi.)"
	},
	{
		name: "Elias",
		msg: "Kailangan ko nang umalis. Tandaan mo, Don Crisóstomo: kung sakaling mangailangan ka ng tulong, darating ako."
	},
	{
		name: "Crisostomo Ibarra (mataimtim)",
		msg: "At ako naman ay nangangako—ang sinabi mo ngayong gabi ay mananatiling lihim."
	},
	{
		name: "[Narration]",
		msg: "(Tumango si Elias at unti-unting naglakad palayo sa ulan.)"
	},
	{
		name: "[Narration]",
		msg: "Sa pag-alis ni Elias, nanatiling nakatayo si Ibarra sa pintuan, pinagmamasdan ang dilim ng gabi—tila iniisip kung sino nga ba ang tunay na mga kaaway sa likod ng kanyang mabubuting hangarin."
	},
]
// chapter 34
chap34_dial1 = [
	{
		name: "[Narration]",
		msg: "Nagtipon ang mga iginagalang na tao sa San Diego para sa isang marangyang pananghalian. Naroon si Ibarra, ang alkalde, si Maria Clara, Kapitan Tiago, Padre Salvi, Padre Sibyla, ang alperes, tinyente, at ilan pang dalagang bisita."
	},
	{
		name: "[Narration]",
		msg: "(Nasa magkabilang dulo ng lamesa sina Ibarra at ang alkalde. Habang kumakain, biglang may pumasok na tagadala ng telegrama.)"
	},
	{
		name: "Tagadala ng Telegrama",
		msg: "Kapitan Tiago! May telegrama po kayo!"
	},
	{
		name: "Kapitan Tiago (kinuha at binasa ang papel)",
		msg: "Ang Kapitan Heneral... darating daw bukas—at dito raw siya tutuloy, sa aking bahay!"
	},
	{
		name: "[Narration]",
		msg: "(Nagkagulo ang mga panauhin. Ang iba’y napasigaw sa tuwa, ang iba nama’y napangiwi sa inis.)"
	},
	{
		name: "Padre Sibyla (mahina ngunit may inis)",
		msg: "Hindi man lang sa kumbento..."
	},
	{
		name: "Padre Sibyla (mapait ang ngiti)",
		msg: "Marahil ay nais niyang magpahinga sa ingay ng simbahan..."
	},
	{
		name: "[Narration]",
		msg: "(Natawa nang bahagya ang alkalde, samantalang tahimik lamang si Ibarra.)"
	},
	{
		name: "Alperes",
		msg: "Aba, Kapitan Tiago, malaking karangalan ito para sa San Diego!"
	},
	{
		name: "Kapitan Tiago (nangingiti, halatang tuwang-tuwa)",
		msg: "Oo nga! Isang pagpapala!"
	},
	{
		name: "[Narration]",
		msg: "(Biglang bumukas ang pinto. Pumasok si Padre Damaso, nakangiti ngunit may halatang yabang.)"
	},
	{
		name: "Padre Damaso",
		msg: "Magandang tanghali! Aba, parang walang nagsabi sa akin na may handaan!"
	},
	{
		name: "[Narration]",
		msg: "(Tahimik sandali. Kita sa mukha ni Ibarra ang pagpipigil.)"
	},
	{
		name: "Alkalde (magalang)",
		msg: "Padre Damaso! Maupo po kayo."
	},
	{
		name: "Padre Damaso (umupo at ngumiti ng may panunuya)",
		msg: "Ah, narito pala si Don Crisóstomo Ibarra. Kumusta, hijo? Hindi ka na yata nagmimisa? Baka nakakalimot ka na sa pananampalataya."
	},
	{
		name: "[Narration]",
		msg: "(Napatingin ang lahat kay Ibarra. Si Maria Clara ay kabadong nakamasid.)"
	},
	{
		name: "Crisostomo Ibarra (kalma ngunit malamig)",
		msg: "Hindi po, Padre. May oras para sa lahat—oras ng pananampalataya at oras ng paggawa para sa bayan."
	},
	{
		name: "Padre Damaso (tumawa ng mapanlait)",
		msg: "Bayan? Bayan ang pinag-uusapan mo? Eh ang ama mo, si Don Rafael—hindi ba’t isang erehe at filibustero?"
	},
	{
		name: "[Narration]",
		msg: "(Tahimik ang lahat. Napatingin si Ibarra, nanginginig sa galit.)"
	},
	{
		name: "Maria Clara (mahina)",
		msg: "Crisóstomo…"
	},
	{
		name: "Crisostomo Ibarra (tumayo, galit na galit)",
		msg: "Padre! Huwag mong dungisan ang alaala ng aking ama!"
	},
	{
		name: "Padre Damaso (nakangisi)",
		msg: "Aba, nagagalit? Totoo lang naman ang sinasabi ko!"
	},
	{
		name: "[Narration]",
		msg: "(Hinugot ni Ibarra ang kutsilyo at pasugod na humakbang, ngunit agad siyang napigilan ni Maria Clara.)"
	},
	{
		name: "Maria Clara (mahina)",
		msg: "Crisóstomo, huwag! Para sa akin, huwag!"
	},
	{
		name: "[Narration]",
		msg: "(Sandaling katahimikan. Huminga nang malalim si Ibarra, pinilit ang sarili na kumalma.)"
	},
	{
		name: "Crisostomo Ibarra (malamig ang tinig)",
		msg: "Patawarin ninyo ako. Hindi ako dapat magpadala sa galit."
	},
	{
		name: "[Narration]",
		msg: "(Lumingon siya sa mga panauhin, tapos kay Maria Clara.)"
	},
	{
		name: "Crisostomo Ibarra (malamig ang tinig)",
		msg: "Paalam. Mas mabuti nang ako’y umalis."
	},
	{
		name: "[Narration]",
		msg: "(Lumakad siyang palabas ng silid, iniwan ang tahimik at nagulat na mga panauhin.)"
	},
	{
		name: "[Narration]",
		msg: "At sa kanyang pag-alis, iniwan ni Ibarra ang hapag na puno ng pagkain, ngunit walang sinuman ang nakaramdam ng gana—sapagkat ang araw ng pananghalian ay naging araw ng kahihiyan at pighati."
	},
]


// level 6
//chapter 37
chap37_dial1 = [
	{
		name: "[Narration]",
		msg: "Ipinatawag ng Kapitan Heneral si Ibarra. Inakala ng lahat na pagagalitan siya dahil sa nangyaring pagtatalo sa pananghalian. Ngunit makalipas ang ilang sandali, lumabas si Ibarra mula sa silid ng Heneral—nakangiti.."
	},
	{
		name: "[Narration]",
		msg: "(Nagkatinginan ang mga pari, halatang naiinis.)"
	},
	{
		name: "Padre Sibyla",
		msg: "Bakit parang... masaya si Ibarra? Hindi ba’t dapat ay pinagsabihan siya?"
	},
	{
		name: "Padre Salvi (mahina ngunit may galit)",
		msg: "Hmph. Marahil marunong magpakitang-tao ang binata."
	},
	{
		name: "Padre Martin",
		msg: "Ngunit bakit hindi tayo ang unang pinatawag ng Heneral? Kami ang mga lingkod ng simbahan!"
	},
	{
		name: "[Narration]",
		msg: "Isa-isa silang tinawag ng kawal—una si Padre Sibyla, kasunod si Padre Salvi, at ang iba pang pari."
	},
]
chap37_dial2 = [
	{
		name: "[Narration]",
		msg: "(Sa loob ng silid, kausap ng Heneral si Ibarra.)"
	},
	{
		name: "Kapitan Heneral (magiliw)",
		msg: "Ibarra, narinig ko ang tungkol sa iyong ama. Isang mabuting tao raw siya—matapat at marangal. Hindi ko maipagkakaila, ako’y humahanga sa iyo sa pagtatanggol mo sa kanyang dangal."
	},
	{
		name: "Crisostomo Ibarra",
		msg: "Maraming salamat po, Kapitan Heneral. Ginawa ko lamang ang tama."
	},
	{
		name: "Kapitan Heneral ",
		msg: "Alam mo ba? Maraming nagsabi sa akin na ikaw ay ekskomunikado, ngunit hindi ko iyon pinaniniwalaan agad. Ipag-uutos kong kausapin ang Arsobispo tungkol diyan."
	},
	{
		name: "Crisostomo Ibarra (nagulat, may halong pag-asa)",
		msg: "Napakalaking biyaya po niyan, Ginoo."
	},
	{
		name: "Kapitan Heneral ",
		msg: "Isa kang matalinong binata, Ibarra. Ngunit bakit hindi mo ipagbili ang iyong mga ari-arian dito at manirahan sa Espanya? Maraming pagkakataon doon para sa kagaya mong may magandang kaisipan."
	},
	{
		name: "Crisostomo Ibarra (ngumingiti, mariin)",
		msg: "Hindi po ako aalis. Mas matamis po ang maglingkod sa sariling bayan."
	},
	{
		name: "Kapitan Heneral (tumango, humanga)",
		msg: "Maganda ang iyong puso, hijo. Pangarap kong magtagumpay ang mga kagaya mo. Protektahan ka sana ng Diyos."
	},
]
//  chapter 40
chap40_dial1 = [
	{
		name: "[Narration]",
		msg: "(Dumating si Ibarra. Napatingin ang lahat. Si Padre Damaso ay napabuntong-hininga.)"
	},
	{
		name: "Padre Damaso (mababa ang boses, puno ng inis)",
		msg: "Diyos ko… kahit saan ako magpunta, naroon ang ereheng iyan!"
	},
	{
		name: "[Narration]",
		msg: "Lumapit si Ibarra kay Maria Clara at magiliw itong binati. Nagusap sila nang masinsinan, halatang sabik sa isa’t isa."
	},
	{
		name: "Padre Damaso (galit na tumayo)",
		msg: "Don Filipo! Bakit naririto ang Ibarra? Alam mo bang siya’y ekskomunikado?!"
	},
	{
		name: "Don Filipo (kalma))",
		msg: "Padre, siya po ang isa sa pinakamalaking nag-abuloy para sa pagtatanghal na ito. Hindi ko po siya maaaring paalisin."
	},
	{
		name: "Padre Damaso (pasigaw)",
		msg: "Kung ganyan, ako na ang aalis! Halina kayo, mga kapatid!"
	},
	{
		name: "[Narration]",
		msg: "At umalis si Padre Damaso kasama ang ibang pari. Tahimik na napayuko si Ibarra, nahihiya sa pangyayari."
	},
	{
		name: "Crisostomo Ibarra (mahina kay Maria Clara)",
		msg: "Patawarin mo ako, Maria. Marahil mas mabuting umalis na rin ako."
	},
	{
		name: "[Narration]",
		msg: "(Tumayo siya at tuluyang umalis.)"
	},
	{
		name: "[Narration]",
		msg: "Pagkaraan ng ilang sandali, dumating ang dalawang sundalo."
	},
	{
		name: "Unang Sundalo",
		msg: "Ihinto ninyo ang pagtatanghal! Nagagalit ang alperes at ang kanyang senyora—hindi daw makatulog sa ingay!"
	},
	{
		name: "Don Filipo (matatag)",
		msg: "Hindi ko po ihihinto ang dula! Ito’y para sa bayan at hindi lamang para sa iilan!"
	},
	{
		name: "[Narration]",
		msg: "Nag-ingay ang mga tao. Ang ilan ay nagsigawan, ang iba nama’y nagbato ng kung ano-anong bagay sa mga sundalo. Nagkagulo ang lahat."
	},
	{
		name: "Don Filipo (sigaw)",
		msg: "Tumigil kayo! Mga kababayan, kalma lang!"
	},
	{
		name: "[Narration]",
		msg: "(Ngunit walang nakikinig. Biglang dumating si Ibarra, hingal na hingal.)"
	},
	
]
chap40_dial2 = [
	{
		name: "Crisostomo Ibarra",
		msg: "Don Filipo! Nasaan si Maria Clara? Ano’ng nangyayari rito?"
	},
	{
		name: "Don Filipo",
		msg: "Tulungan mo akong awatin sila, Ibarra! Hindi ko na kayang pigilan ang lahat!"
	},
	{
		name: "[Narration]",
		msg: "Ngunit napakarami ng tao. Wala nang makapigil—hanggang sa dumating si Elias."
	},
]
chap40_dial3 = [
	{
		name: "Crisostomo Ibarra (mabilis)",
		msg: "Elias! Tulungan mo ako!"
	},
	{
		name: "Elias: (tumango)",
		msg: "Ako ang bahala rito."
	},
	{
		name: "[Narration]",
		msg: "Ilang saglit pa’y unti-unting tumahimik ang mga tao. Ang sigawan ay naging bulungan."
	},
]
// chapter 41
chap41_dial1 = [
	{
		name: "[Narration]",
		msg: "Hindi makatulog si Ibarra nang gabing iyon. Upang maibsan ang bigat ng isip, nagpunta siya sa kaniyang laboratoryo at nagpatuloy sa pag-eeksperimento."
	},
	{
		name: "Crisostomo Ibarra (nagsasalita sa sarili habang nagmamasid sa mga kasangkapan)",
		msg: "Marahil... sa siyensya ko matatagpuan ang katahimikan na hindi kayang ibigay ng lipunan."
	},
	{
		name: "[Narration]",
		msg: "Abala siya sa gawain nang hindi namalayang lumipas na ang oras. Maya-maya’y kumatok si Elias at pumasok nang tahimik."
	},
]
chap41_dial2 =[
	{
		name: "Elias",
		msg: "Senyor Ibarra, dumaan ako upang ibalita—nagkasakit si Maria Clara."
	},
	{
		name: "Crisostomo Ibarra",
		msg: "Ano?! Si Maria Clara? Ano’ng nangyari sa kanya?"
	},
	{
		name: "Elias",
		msg: "Pagod marahil sa mga nangyari kagabi. Ngunit huwag kang mag-alala, may mga nag-aalaga sa kanya."
	},
	{
		name: "Crisostomo Ibarra (huminga nang malalim)",
		msg: "Salamat, Elias. Ngunit... gusto ko ring malaman—paano mo napatigil ang kaguluhan sa plasa?"
	},
	{
		name: "Elias (mahinahon)",
		msg: "Kilala ko ang magkapatid na nanguna sa gulo. Minsan ko na silang tinulungan nang sila’y parusahan. Kinausap ko sila kagabi—at sila mismo ang nakiusap sa iba na magpahupa ng galit.	"
	},
	{
		name: "Crisostomo Ibarra (ngumiti ng bahagya)",
		msg: "Walang hindi mo kayang ayusin, Elias."
	},
	{
		name: "Elias",
		msg: "Hindi iyon dahil sa akin, Senyor. Kundi dahil naniniwala pa rin silang may kabutihan sa’yo."
	},
	{
		name: "[Narration]",
		msg: "Ilang sandali pa, nagpaalam si Elias at umalis. Agad namang nagbihis si Ibarra at naglakad patungo sa bahay ni Maria Clara."
	},
]
// chapter 48
chap48_dial1 = [
	{
		name: "[Narration]",
		msg: "(Sa bahay ni Kapitan Tiago)"
	},
	{
		name: "Crisostomo Ibarra (may ngiti)",
		msg: "Magandang umaga, Tiya Isabel. Nandito ako upang dalawin si Maria Clara. May dala rin akong magandang balita — napawalang-bisa na ang aking pagiging ekskomunikado."
	},
	{
		name: "Tiya Isabel (tuwa)",
		msg: "Aba! Purihin ang Diyos! Maria Clara! Halika’t narito na si Crisostomo!"
	},
	{
		name: "[Narration]",
		msg: "(Sa bahay ni Kapitan Tiago)"
	},
	{
		name: "Maria Clara (may ngiti ngunit tila alangan)",
		msg: "Crisostomo… pasensya na, may panauhin ako."
	},
	{
		name: "[Narration]",
		msg: "(Lumabas si Linares mula sa loob ng bahay, magalang na yumuko kay Ibarra.)"
	},
	{
		name: "Crisostomo Ibarra (nagulat at tila malamig ang tono)",
		msg: "Ah… ganoon ba? Pasensya na. Marahil ay babalik na lamang ako sa ibang araw."
	},
	{
		name: "Maria Clara (bahagyang nag-aalala)",
		msg: "Crisostomo, huwag kang—"
	},
	{
		name: "Crisostomo Ibarra (mahinahon)",
		msg: "Hindi, Maria. Naiintindihan ko. Magandang araw sa’yo."
	},
	{
		name: "[Narration]",
		msg: "(Umalis si Ibarra, mabigat ang loob. Dumiretso siya sa lugar ng ginagawang paaralan.)"
	},
]

// level 7
//chapter 49
chap49_dial1 = [
	{
		name: "[Narration]",
		msg: "(Sa tabing-lawa, papalubog ang araw. Nakita ni Ibarra si Elias sa bangka.)"
	},
	{
		name: "Elias",
		msg: "Don Crisostomo, pasensya ka na kung dito tayo mag-uusap. Mas tahimik dito — walang makakarinig."
	},
	{
		name: "Crisostomo Ibarra",
		msg: "Ayos lang, Elias. Sabihin mo, ano ba ang pakay mo?"
	},
	{
		name: "Elias",
		msg: "Ako’y inutusan na iparating sa’yo ang mga hinaing ng mga inaapi. Hinihiling nila ang respeto sa dangal ng tao, kaligtasan ng bawat isa, at kaunting malasakit mula sa mga may kapangyarihan."
	},
	{
		name: "Crisostomo Ibarra (seryoso)",
		msg: "Naiintindihan ko. Kung pera o tulong sa mga kaibigan ko sa Madrid ang kailangan, makatutulong ako. Kahit sa Kapitan Heneral, susubukan kong makiusap."
	},
	{
		name: "Elias (umiling)",
		msg: "Hindi lamang tulong, Don Crisostomo. Ang kailangan ay pagkilos, pagbabago sa loob mismo ng bayan."
	},
	{
		name: "Crisostomo Ibarra (nag-aalinlangan)",
		msg: "Elias… baka sa halip na makatulong, lalo lang tayong mapahamak. Hindi pa handa ang bayan sa ganyang hakbang."
	},
	{
		name: "Elias (malungkot)",
		msg: "Kung gayon, sasabihin ko na lang sa kanila na hindi ka pumayag. Pero sana, huwag mo kaming kalimutan."
	},
	{
		name: "Crisostomo Ibarra (mahina)",
		msg: "Hindi ko kayo kalilimutan, Elias. Pero… umasa tayo sa Diyos. Siya lamang ang makapagtatama ng lahat."
	},
	{
		name: "[Narration]",
		msg: "(Tahimik na tumingin si Elias sa papalubog na araw, at dahan-dahang itinuloy ang pagsagwan.)"
	},
]
//chapter 54
chap54_dial1 = [
	{
		name: "Elias",
		msg: "Don Crisostomo! Umalis ka na agad! Kalat na ang balitang ikaw ang nag-utos sa mga sasalakay sa kwartel!"
	},
	{
		name: "Crisostomo Ibarra (nagulat)",
		msg: "Ano? Hindi ako sangkot diyan! Elias, tulungan mo akong iligpit ang mahahalagang papeles!"
	},
	{
		name: "[Narration]",
		msg: "(Habang nagliligpit, nakita ni Elias ang pangalang “Don Pedro Eibarramendia.”)"
	},
	{
		name: "Elias",
		msg: "Don Pedro Eibarramendia? Kaanu-ano mo siya?"
	},
	{
		name: "Crisostomo Ibarra",
		msg: "Lolo ko siya. Bakit mo tinatanong?"
	},
	{
		name: "Elias (namutla)",
		msg: "Siya… siya ang dahilan ng pagkawasak ng aming pamilya!"
	},
	{
		name: "[Narration]",
		msg: "(Tahimik na tumindig si Elias, may galit at kirot sa mata, saka mabilis na umalis.)"
	},
]
//chapter 55
chap55_dial1 = [
	{
		name: "[Narration]",
		msg: "(Sa bahay ni Ibarra…)"
	},
	{
		name: "Crisostomo Ibarra (mabilisan)",
		msg: "Ihanda ang kabayo! Ilagay ko muna ang salapi, alahas, at ang larawan ni Maria Clara…"
	},
	{
		name: "[Narration]",
		msg: "(Biglang may kumatok nang malakas.)"
	},
]
chap55_dial2 = [
	{
		name: "Gwardiya Sibil",
		msg: "Buksan mo, sa ngalan ng batas!"
	},
	{
		name: "Crisostomo Ibarra",
		msg: "Ako? Aarestuhin? Pero bakit?"
	},
	{
		name: "Gwardiya Sibil",
		msg: "Walang paliwanag — sumama ka!"
	},
	{
		name: "Crisostomo Ibarra (huminga nang malalim)",
		msg: "Sige."
	},
]
//chapter 58
chap58_dial1 = [
	{
		name: "[Narration]",
		msg: "(Biglang may kumatok nang malakas.)"
	},
	{
		name: "Crisostomo Ibarra",
		msg: "Narito na tayo......"
	},
	{
		name: "Crisostomo Ibarra",
		msg: "Ipakita mo sa akin ang nitso ng aking ama"
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
