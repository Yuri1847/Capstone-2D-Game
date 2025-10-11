function QuestManager() constructor {
    quests = ds_map_create(); // active + completed

    static add_quest = function(_id, _title, _desc, _goals) {
        if (ds_map_exists(quests, _id)) return; // prevent duplicates
        var q = new Quest(_id, _title, _desc, _goals);
        ds_map_add(quests, _id, q);
    };

    static get_quest = function(_id) {
        if (ds_map_exists(quests, _id)) return quests[? _id];
        return undefined;
    };

    static complete_quest = function(_id) {
	    var q = get_quest(_id);
	    if (is_undefined(q)) return;
	    if (!q.completed) {
	        q.completed = true;
	        scr_show_quest_notification(q.title);
	    }
	};


    static get_active_quests = function() {
        var list = ds_list_create();
        var keys = ds_map_keys(quests);
        for (var i = 0; i < array_length(keys); i++) {
            var q = quests[? keys[i]];
            if (!q.completed) ds_list_add(list, q);
        }
        return list;
    };

    static destroy = function() {
        ds_map_destroy(quests);
    };
}
