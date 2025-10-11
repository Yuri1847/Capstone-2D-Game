function scr_show_quest_notification(_quest_title) {
    if (!instance_exists(obj_QuestNotificationManager)) return;
    var mgr = obj_QuestNotificationManager;
    mgr.add_notification(_quest_title);
}


