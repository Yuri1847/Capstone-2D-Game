function scr_quest_setup() {
    var g1 = new QuestGoal("Talk to the teacher", "teacher_npc", 1);
    var g2 = new QuestGoal("Collect book", "book_item", 1);

    global.QuestManager.add_quest("q_tutorial", "Introduction", "Learn how to play.", [g1, g2]);
}
