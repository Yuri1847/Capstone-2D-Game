/// @function scr_story_init()
/// @description Initialize linear story quest list

global.story_quests = [
    {
        title: "Maglibot libot sa lugar",
        description: "Kakarating lng niya galing Europa. Naglibot libot muna.",
        completed: false
    },
	//chap 2 start
    {
        title: "Handaan",
        description: "Pumasok siya sa ginaganap na handaan.",
        completed: false
    },
    {
        title: "Lumapit si Ibarra sa Kapitan",
        description: "Ipapakilala siya niya sa iba pang dumalo.",
        completed: false
    },
    {
        title: "Bumati is Ibarra sa Padre",
        description: "Nakita niya ang Padre at babatiin ito",
        completed: false
    },
	{
        title: "Lumapit si Ibarra sa Tiniente",
        description: "Kinausap naman siya ng isang Tiniente",
        completed: false
    },
	{
        title: "Kinausap ni Ibarra ang mga dilag.",
        description: "Bumati siya sa mga hiyas ng pilipinas.",
        completed: false
    },
	{
        title: "Nagpakilala si Ibarra sa mga kalalakihan",
        description: "Bumati siya gamit ang kaugaliang Alemanya",
        completed: false
    },
	{
        title: "Kinausap si Ibarra ng isang Kapitan",
        description: "Inalok siya ng Kapitan na dumayo sa kaniyang tahanan",
        completed: false
    },
	
	{// 8 on story script
        title: "Pumunta si Ibarra sa kainan.",
        description: "Handa na ang pagkain ani ng Katulong",
        completed: false
    },
	//chapter 3
	{ //9
        title: "Hapunan",
        description: "Kinakausap ka ng mga nasa hapag.",
        completed: false
    },
	{
        title: "ssss",
        description: "ssss",
        completed: false
    },
	{
        title: "ssss",
        description: "ssss",
        completed: false
    },
	{
        title: "ssss",
        description: "ssss",
        completed: false
    },
];

global.current_story_index = 0; // start at first quest
