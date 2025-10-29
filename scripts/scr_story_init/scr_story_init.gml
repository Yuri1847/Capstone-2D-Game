
global.story_quests = [
	//chapter 1
    {//trigger Cutscene o diyalogo ng pagbati sa mga panauhin.
	    title: "Dumalo sa Handaan ni Kapitan Tiago",
	    description: "Pumasok sa bulwagan at obserbahan ang mga panauhin.",
	    completed: false
	},
	{//Tatanggihan ang iyong pagbati — magbubukas ng emosyonal na reaksyon o pagpipilian ng tugon.
	    title: "Kapitan Tiago",
	    description: "Lapitan si Kapitan Tiago",
		npc_id: "chap1Tiago",
	    completed: false
	},
	{//Tatanggihan ang iyong pagbati — magbubukas ng emosyonal na reaksyon o pagpipilian ng tugon.
	    title: "Batiin si Padre Damaso",
	    description: "Lapitan at kamayan si Padre Damaso.",
		npc_id: "chap1Damaso",
	    completed: false
	},
	{//Gantimpala: Nagbubukas ng tala sa “Kwento ng Ama ni Ibarra” sa iyong talaarawan o journal.
	    title: "Pakinggan ang kuwento tungkol sa kabutihan ng iyong ama.",
	    description: "Pumasok sa bulwagan at obserbahan ang mga panauhin.",
		npc_id: "chap1Guevarra",
	    completed: false
	},
	{//Mekaniko: Pumili kung anong paraan ng pagpapakilala — tradisyonal o Europeo. -- Epekto: Tataas o bababa ang respeto ng mga panauhin depende sa pagpili.
	    title: "Magpakilala sa mga Panauhin",
	    description: "Lapitan ang tatlong grupo (mga babae, mga lalaki, at si Kapitan Tinong)..",
		npc_id: "chap1Binibini",
	    completed: false
	},
	{//Mekaniko: Pumili kung anong paraan ng pagpapakilala — tradisyonal o Europeo. -- Epekto: Tataas o bababa ang respeto ng mga panauhin depende sa pagpili.
	    title: "Magpakilala sa mga Panauhin",
	    description: "Lapitan ang tatlong grupo (mga babae, mga lalaki, at si Kapitan Tinong)..",
		npc_id: "chap1Kalalakihan",
	    completed: false
	},
	{//Kinalabasan: Maaaring magbukas ng karagdagang side quest sa susunod na kabanata.
	    title: "Tanggapin o Tanggihan ang Imbitasyon ni Kapitan Tinong",
	    description: "Pumili kung sasama sa hapunan kinabukasan.",
		npc_id: "chap1Tinong",
	    completed: false
	},
	
	
	//chapter 2
	{//Trigger: Cutscene kung saan makikita ang pagtatalo ng mga pari sa upuan. -- Kinalabasan: Simula ng eksenang sosyal na puno ng tensyon.
	    title: "Dumalo sa Hapunan",
	    description: "Umupo sa kabisera at makibahagi sa pagtitipon..",
	    completed: false
	},
	/*
	{//Resulta: Magbubukas ng journal entry — “Karangalan at Posisyon sa Simbahan.”
	    title: "Obserbahan ang Alitan ng mga Pari",
	    description: "Pakinggan o lapitan sina Padre Damaso at Padre Sibyla habang nagtatalo sa sentrong upuan..",
	    completed: false
	},
	{//Epekto: +Kaalaman o insight points (nagpapalawak sa pananaw ni Ibarra).
	    title: "Makipag-usap sa Tinyente o Don Tiburcio",
	    description: "Lapitan sila upang marinig ang iba’t ibang pananaw tungkol sa mga pari.",
	    completed: false
	},
	{//Pipiliin ng manlalaro kung: [Makialam] → +Empatiya - [Manahimik] → Neutral - [Tawanan] → -Respeto
	    title: "Kaunting Insidente: Natapakan si Donya Victorina",
	    description: "Pumili kung makikialam ba o mananatiling tahimik.",
	    completed: false
	},
	{//Event: Mapapansin mong galit si Padre Damaso dahil puro leeg at upo ang sa kanya. - Epekto: +Observation Entry: “Galit sa Hapag.”
	    title: "Tanggapin ang Tinola",
	    description: "Kumain ng tinolang inihanda para sa iyo.",
	    completed: false
	},
	{//Mini dialogue choices: “Nalimutan ko man ang Europa, ang Pilipinas ay di ko nalimutan.” → +Patriotismo - “Sa Europa, mas mabilis ang pag-unlad.” → +Katalinuhan pero -Pakikisama - “Ang Pilipinas ay tulad ng aking tahanan.” → Balanced response
	    title: "Sagutin ang mga Tanong ng mga Panauhin",
	    description: "Makipag-usap sa grupo nina Laruja at Donya Victorina..",
	    completed: false
	},
	{//Resulta: Magbubukas ng journal entry — “Ang Katahimikan ni Don Rafael.”
	    title: "Ipahayag ang Damdamin Tungkol sa Ama",
	    description: "Sabihin kung ano ang iyong saloobin sa pagkawala ng iyong ama.",
	    completed: false
	},*/
	
	//chapter 3
	{//Trigger: Matapos ang eksena ng hapunan. - Resulta: Bubukas ang exploration scene sa Binondo Plaza.
	    title: "Lumabas ng Bahay ni Kapitan Tiago",
	    description: "Umalis upang maglakad-lakad at makahinga ng sariwang hangin.",
	    completed: false
	},
	{//Mekaniko: Pindutin o lapitan ang mga tindera upang marinig ang mga linya gaya ng - “Ganyan pa rin dito, ginoo.” antimpala: +Reflection Points (“Walang Pagbabago sa Bayan”).
	    title: "Maglakad sa Plasa ng Binondo",
	    description: "Obserbahan ang paligid at makausap ang mga tindera.",
	    completed: false
	},
	{//Trigger: Automatic dialogue cutscene. - Resulta: Bubukas ang “Kwento ng Ama.”
	    title: "Makita si Tinyente Guevarra",
	    description: "Lapitan si Tinyente na nasa gilid ng plasa.",
	    completed: false
	},
	/*
	{//Cutscene: Habang naglalakad, isinasalaysay ng Tinyente ang kaso ni Don Rafael. - Resulta: +Knowledge Entry — “Ang Katotohanan sa Pagkamatay ni Don Rafael.”
	    title: "Pakinggan ang Salaysay ng Tinyente",
	    description: "Pakinggan ang Salaysay ng Tinyente",
	    completed: false
	},
	{//Trigger: Huling dialogue ng Tinyente: “Napatunayan siyang walang sala, ngunit huli na.”  Resulta: Cinematic / Reflection Scene ni Ibarra (internal dialogue o monologo). ➤ Gantimpala: +Emotional Insight, bubukas ang bagong misyon: “Ang Lihim ni San Diego.”
	    title: "Matapos ang Salaysay",
	    description: "Makinig hanggang dulo ng kwento ng pagkakulong at pagkamatay ng ama.",
	    completed: false
	},
	*/
		//chapter 4
		{//rigger: Matapos ang eksenang may Tinyente Guevarra (mula Kabanata 4).➤ Resulta: Bubukas ang quiet scene sa loob ng silid ni Ibarra.➤ Gantimpala: +Checkpoint “Pahinga sa Fonda.”
		    title: "Dumating sa Fonda de Lala",
		    description: "Ipatuloy ang biyahe at pumasok sa tinutuluyan ni Ibarra.",
		    completed: false
		},
		{//Mekaniko: Gamitin ang “Look” interaction sa mga bagay tulad ng mesa, ilaw, o bintana.➤ Gantimpala: +Reflection Entry — “Ang Alaala ng Nakaraan.”
		    title: "Magmasid sa Silid at Kapaligiran",
		    description: "Obserbahan ang mga gamit sa silid at mga tanawin sa labas ng bintana.",
		    completed: false
		},
		{//Resulta: Mapapansin ni Ibarra ang kasayahan, musika, at liwanag mula sa bahay ni Kapitan Tiago. ➤ Symbolic Effect: +Hope / +Memory of Home.
		    title: "Tumingin sa Bintana",
		    description: "Lapitan ang bintana upang simulan ang cutscene kung saan makikita ang bahay sa kabilang ilog.",
		    completed: false
		},
		{//Cutscene: Makikilala si Maria Clara. ➤ Resulta: Journal update — “Ang Alaala ng Pag-ibig.”
		    title: "Matunghayan si Maria Clara",
		    description: "Obserbahan ang babaeng nagliliwanag sa kasuotan ng ginto’t diyamante.",
		    completed: false
		},
		{//rigger: Pagkatapos makita si Maria Clara. ➤ Resulta: Fade-out cutscene → Simula ng susunod na kabanata (“Paglalakbay ni Ibarra”). ➤ Gantimpala: +Emotional Recovery.
		    title: "Magpahinga",
		    description: "Matulog upang tapusin ang gabi.",
		    completed: false
		},

	
	//chapter 5
	{//Trigger: Cutscene ng pagdating ni Ibarra sa bahay.
	    title: "Dumating sa Bahay ni Kapitan Tiago",
	    description: "Pumunta sa bahay matapos ang misa upang dalawin si Maria Clara.",
	    completed: false
	},
	{//Kinalabasan: Pahihintulutan kang pumunta sa asotea.
	    title: "Makipag-usap kay Tiya Isabel",
	    description: "Humingi ng pahintulot na makausap si Maria Clara.",
	    completed: false
	},
	{//Mekaniko: Maaaring maglibot at magmasid (mini-interaction habang naghihintay).
	    title: "Hintayin si Maria Clara sa Asotea",
	    description: "Maghintay habang nag-aayos si Maria Clara sa kanyang silid.",
	    completed: false
	},
	{//Nilalaman: Pagbabalikan ng kabataan, Pagpapahayag ng damdamin, Pagpapakita ng tuyong dahon ng sambong
	    title: "Makipag-usap kay Maria Clara",
	    description: "Simulan ang diyalogo sa asotea.",
	    completed: false
	},
	{//Epekto: Magkakaroon ng Memory Scene kung saan ipapakita ang nakaraan.
	    title: "Ipakita ang Liham",
	    description: "Ibigay at ipabasa kay Maria Clara ang liham bago ka tumungo sa San Diego.",
	    completed: false
	},
	{//Trigger: Ibarra sabihing kailangan niyang umalis para sa Todos los Santos. ➤ Resulta: Maria Clara maluluha → magtatapos ang kabanata sa emosyonal na tono.
	    title: "Magpaalam kay Maria Clara",
	    description: "Tapusin ang pag-uusap at magpaalam nang magalang.",
	    completed: false
	},
	
	//chapter 6
	{//Trigger: Cutscene matapos ang kabanata 7 (Ligawan sa Asotea). ➤ Epekto: Bubukas ang map o on-rails sequence na nagpapakita ng mga tanawin.
	    title: "Sumakay ng Kalesa",
	    description: "Umalis mula sa bahay ni Maria Clara at maglibot sa Maynila.",
	    completed: false
	},
	{//Mga Lugar na Mabibisita:Mga kalsadang baku-bako at maalikabok - Escolta (mga bagong gusali) - Pagawaan ng tabako sa Arroceros - Hardin ng Botaniko - Bagumbayan
	    title: "Libutin ang Kamaynilaan",
	    description: "Pagmasdan ang paligid habang bumibiyahe.",
	    completed: false
	},
	{//Halimbawa:Sa kalsada: “Walang pinagbago — tila pati dangal ng bayan ay nilulubog sa putik.” - Sa Escolta: “Ang progreso’y para lang sa iilan.” - Sa Bagumbayan: “Dito, tumatapos ang buhay ng mga umibig sa bayan.”
	    title: "Magmasid at Mag-reflect sa Bawat Lokasyon",
	    description: "Tumigil o mag-trigger ng mga monologo ni Ibarra sa bawat lugar.",
	    completed: false
	},
	{//Epekto: Ibarra makakaramdam ng halo-halong emosyon — inis, awa, pag-aalala.
	    title: "Makita si Padre Damaso sa Kalesa",
	    description: "I-trigger ang maikling cutscene ng pagdaan ni Padre Damaso.",
	    completed: false
	},
	{//Resulta: Reflection scene tungkol sa kaibahan ng edukasyon at kalinangan.
	    title: "Bumisita sa Hardin ng Botaniko",
	    description: "Maglakad sandali at ikumpara ang tanawin sa mga hardin ng Europa.",
	    completed: false
	},
	{//Dialogue/Narration: “Karunungan ang liwanag sa dilim — ito ang sandata ng pagbabago.” ➤ Gantimpala: Journal Entry — “Liwanag ng Karunungan”.
	    title: "Pag-ninilay sa Bagumbayan",
	    description: "Magkaroon ng maikling eksena ng tahimik na pagmumuni.",
	    completed: false
	},
	{//
	    title: "",
	    description: "",
	    completed: false
	},
]


global.current_story_index = 0;







































































































































