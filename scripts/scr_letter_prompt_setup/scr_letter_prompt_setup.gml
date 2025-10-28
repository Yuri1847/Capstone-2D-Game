/// scr_letter_prompt_setup(_header, _question, _scenario, _choices, _stats)
/// @param _header   string - Title text, like "✦ REFLECTION ✦"
/// @param _question string - The guiding question
/// @param _scenario string - The scenario description
/// @param _choices  array  - Array of 3+ choice strings
/// @param _stats    string - Stat summary to show below

function scr_letter_prompt_setup(_header, _question, _scenario, _choices, _stats)
{
    header_text   = _header;
    question_text = _question;
    scenario_text = _scenario;
    choice_list   = _choices;
    stat_text     = _stats;
    
    selected_choice = -1;
    hover_confirm   = false;
}
