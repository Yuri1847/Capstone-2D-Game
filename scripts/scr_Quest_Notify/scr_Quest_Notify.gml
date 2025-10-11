function scr_Quest_Notify(message){
/// @func scr_Quest_Notify(message)
global.quest_notification = message;
global.quest_timer = room_speed * 3; // show for 3 seconds

}