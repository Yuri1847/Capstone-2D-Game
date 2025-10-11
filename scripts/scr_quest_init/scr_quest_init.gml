function scr_quest_init() {
    if (!variable_global_exists("QuestManager")) {
        global.QuestManager = new QuestManager();
    }
}
