function scr_Quest_Complete(qid){
/// @func scr_Quest_Complete(qid)
var q = global.quests[? qid];
	if (q != undefined) {
	    q[? "status"] = "completed";
	    scr_Quest_Notify("Quest Completed: " + q[? "name"]);
	}

}