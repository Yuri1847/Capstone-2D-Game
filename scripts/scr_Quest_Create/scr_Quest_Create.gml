function scr_Quest_Create(nameq, desc, type){
	/// @func scr_Quest_Create(_name, _desc, _type)
	/// @return ds_map

	var q = ds_map_create();
	q[? "name"]    = nameq;
	q[? "desc"]    = desc;
	q[? "type"]    = type; // "Main" or "Side"
	q[? "status"]  = "inactive";
	q[? "progress"] = 0;
	q[? "goal"]     = 1;

	return q;

}