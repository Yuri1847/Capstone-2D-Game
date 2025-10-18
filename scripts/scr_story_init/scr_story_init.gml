/// @function scr_story_init()
/// @description Initialize linear story quest list

global.story_quests = [
    {
        title: "Maglibot libot sa lugar",
        description: "Kakarating mo lng galing pier. Maglibot libot sa lugar upang maging pamilyar.",
        completed: false
    },
    {
        title: "Handaan",
        description: "Pumasok sa ginaganap na handaan.",
        completed: false
    },
    {
        title: "Deliver the Message",
        description: "Bring the Elder’s message to the guard captain.",
        completed: false
    },
    {
        title: "Enter the Forest",
        description: "Head east to the forest entrance to begin your journey.",
        completed: false
    }
];

global.current_story_index = 0; // start at first quest
