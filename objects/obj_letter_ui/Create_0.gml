// === CREATE EVENT ===
header_text = "";
question_text = "";
scenario_text = "";
choice_list = [];
stat_text = "";
selected_choice = -1;
hover_confirm = false;

dialog_ref = noone;
reflection_id = "";

// --- New state flow variables ---
state = "instruction"; // "title" -> "instruction" -> "play" -> "summary"
_title_text = "Reflection";
_instruction_text = "Read the reflection and choose wisely.\nTap anywhere to continue.";
_summary_text = ""; // filled when entering summary
_tap_cooldown = 10; // frames to avoid accidental double-tap
_tap_timer = 0;

// keep original behaviour for file handling (will be used when confirming)
