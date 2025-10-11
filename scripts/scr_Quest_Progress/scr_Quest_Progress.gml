function scr_Quest_Progress(qid, amount){
/// @func scr_Quest_Progress(qid, amount)
var q = global.quests[? qid];
	if (q != undefined && q[? "status"] == "active") {
	    q[? "progress"] += amount;
	    if (q[? "progress"] >= q[? "goal"]) {
	        scr_Quest_Complete(qid);
	    }
	}

}