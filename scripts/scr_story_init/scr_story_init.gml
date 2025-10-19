/// @function scr_story_init()
/// @description Initialize linear story quest list

global.story_quests = [
    {//0
	    title: "Maglibot-libot sa paligid",
	    description: "Kakarating mo lang mula sa Europa. Tuklasin muna ang paligid.",
	    completed: false
	},
	// Chap 2 start
	{
	    title: "Pumasok sa handaan",
	    description: "Pumasok sa ginaganap na handaan upang makisalo sa mga panauhin.",
	    completed: false
	},
	{
	    title: "Lumapit sa Kapitan",
	    description: "Hanapin at lapitan ang Kapitan upang ipakilala ka sa iba pang mga panauhin.",
	    completed: false
	},
	{
	    title: "Batiin ang Padre",
	    description: "Lapitan ang Padre at magbigay-galang sa kanya.",
	    completed: false
	},
	{//4
	    title: "Kausapin ang Tenyente",
	    description: "Makipag-usap sa isang Tenyente na nais kang makilala.",
	    completed: false
	},
	{
	    title: "Batiin ang mga dilag",
	    description: "Lapitan at batiin ang mga hiyas ng Pilipinas na nasa handaan.",
	    completed: false
	},
	{
	    title: "Magpakilala sa mga kalalakihan",
	    description: "Batiin ang mga kalalakihan gamit ang kaugaliang Aleman.",
	    completed: false
	},
	{
	    title: "Kausapin ang Kapitan",
	    description: "Makipag-usap sa Kapitan na nag-anyaya sa iyong dumalaw sa kaniyang tahanan.",
	    completed: false
	},
	{//8 
	    title: "Pumunta sa kainan",
	    description: "Handa na ang pagkain ayon sa katulong. Pumunta na sa hapag.",
	    completed: false
	},
	
	// Chapter 3
	{//9
	    title: "Hapunan",
	    description: "Makipag-usap sa mga panauhing kasabay mo sa hapag.",
	    completed: false
	},
	{//10
	    title: "Umalis sa kainan",
	    description: "Matapos ang hapunan, lumabas at umalis mula sa kainan.",
	    completed: false
	},
	
	//chapter 4
	{//11
	    title: "Kausapin ang Tenyente",
	    description: "Malalaman mo mula sa Tenyente ang katotohanan tungkol sa iyong ama.",
	    completed: false
	},
	{//12
	    title: "Magpatuloy sa paglalakad",
	    description: "Ipagpatuloy ang paglalakad patungo sa iyong tinutuluyan.",
	    completed: false
	},
	//chapter 5
	{//13
	    title: "Liwanag sa Gabing Madilim",
	    description: "Nagmuni muni si Ibarra mga nalaman tungkol sa ama.",
	    completed: false
	},
	//chapter 6
	{//14
	    title: "Pumunta sa bahay ni Kapitan Tiago",
	    description: "Bumalik si Ibarra upang bisitahin si Maria Clara.",
	    completed: false
	},
	//chapter 7
	{//15
	    title: "Ligawan sa Asotea",
	    description: "Bumalik si Ibarra upang bisitahin si Maria Clara.",
	    completed: false
	},
	{//16
	    title: "Lumapit sa Kapitan",
	    description: "Tinanong ni Ibarra kung nasaan and dilag.",
	    completed: false
	},
	{//17
	    title: "Kausapin ang dilag",
	    description: "Nag usap ng masinsinan and dalawa.",
	    completed: false
	},
	//chapter 8
	{//18
	    title: "Ang mga alaala",
	    description: "Nagpaalam at umalis na si Ibarra patungong San Diego.",
	    completed: false
	},

];

global.current_story_index = 0; // start at first quest
