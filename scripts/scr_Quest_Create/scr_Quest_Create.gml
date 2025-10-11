function scr_Quest_Create(gName, gDesc, gType){
/// @func scr_Quest_Create(gName, gDesc, gType)
/// @desc Creates a new quest and adds it to the global quest list.
/// @param gName  String - Quest name
/// @param gDesc  String - Description
/// @param gType  String - "Main" or "Side"

var q = ds_map_create();
q[? "name"]        = gName;
q[? "desc"]        = gDesc;
q[? "type"]        = gType;
q[? "status"]      = "inactive";   // inactive | active | completed
q[? "progress"]    = 0;
q[? "goal"]        = 1;
q[? "objectives"]  = ds_list_create(); // optional sub-tasks

return q;

}