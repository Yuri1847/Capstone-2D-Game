// --------------------------------------------------
// Dialogue helper: scr_dialogue_start_action(action_struct, dialog_inst)
// --------------------------------------------------
function scr_dialogue_start_action(action_struct, dialog_inst)
{
    // ✅ Safety first — make sure parameters are valid
    if (is_undefined(action_struct) || !instance_exists(dialog_inst)) {
        if (instance_exists(dialog_inst)) scr_dialogue_action_complete(dialog_inst);
        return;
    }

    var _action = action_struct;
    var _dialog = dialog_inst;

    _dialog._action_running = true;

    // ✅ Disable talk button while an action is running
    if (instance_exists(obj_talk_button)) {
        with (obj_talk_button) {
            isEnabled = false;
            visible = false;
        }
    }

    // ============================================================
    // 🧩 CASE 1: STRUCT-based actions (preferred)
    // e.g. action: { type: "letter", id: "elias_cry" }
    // ============================================================
    if (is_struct(_action)) {
        if (variable_struct_exists(_action, "type")) {
            switch (_action.type) {
                case "letter":
                    scr_letter_system(_dialog, _action.id);
                    return;
            }
        }

        // Unknown struct type → complete immediately
        scr_dialogue_action_complete(_dialog);
        return;
    }

    // ============================================================
    // 🧩 CASE 2: String-based actions (legacy)
    // e.g. action: "letter:elias_cry"
    // ============================================================
    if (is_string(_action)) {
        // check if it follows "letter:" format
        if (string_pos("letter:", _action) > 0) {
            var ida = string_copy(_action, string_pos("letter:", _action) + 7, 999);
            scr_letter_system(_dialog, ida);
            return;
        }

        // Add more string action types here if needed
        // e.g. "warp:town", "quest:begin_intro", etc.

        // Otherwise complete immediately
        scr_dialogue_action_complete(_dialog);
        return;
    }

    // ============================================================
    // 🧩 CASE 3: Fallback for any other type
    // ============================================================
    scr_dialogue_action_complete(_dialog);
}
