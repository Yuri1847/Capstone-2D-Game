

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
