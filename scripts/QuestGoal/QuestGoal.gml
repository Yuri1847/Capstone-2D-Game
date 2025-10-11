function QuestGoal(_desc, _target, _amount) constructor {
    description = _desc;
    target = _target;
    amount = _amount;
    progress = 0;

    static is_done = function() {
        return progress >= amount;
    };

    static add_progress = function(_val) {
        progress = clamp(progress + _val, 0, amount);
    };
}
