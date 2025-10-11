function scr_Quest_Activate(qid){
var q = global.quests[? qid];
	if (q != undefined) {
	    q[? "status"] = "active";
	    array_push(global.activeQuests, qid);
	    scr_Quest_Notify("New Quest: " + q[? "name"]);
	}
}