function Quest(_id, _title, _desc, _goals) constructor {
    id = _id;
    title = _title;
    description = _desc;
    goals = _goals; // array of goal structs
    completed = false;

    static is_completed = function() {
        for (var i = 0; i < array_length(goals); i++) {
            if (!goals[i].is_done()) return false;
        }
        return true;
    };

    static update = function() {
        if (is_completed()) completed = true;
    };
}
