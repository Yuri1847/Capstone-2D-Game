function scr_letter_prompt_setup(_header, _question, _scenario, _choices, _stat_text, _stats)
{
    if (!is_string(_header))   _header   = "";
    if (!is_string(_question)) _question = "";
    if (!is_string(_scenario)) _scenario = "";
    if (!is_array(_choices))   _choices  = [];
    if (!is_string(_stat_text)) _stat_text = "";
    if (!is_struct(_stats))    _stats = {}; // ← fixed

    header_text   = _header;
    question_text = _question;
    scenario_text = _scenario;
    choice_list   = _choices;
    stat_text     = _stat_text;
    stats         = _stats;

    selected_choice = -1;
    hover_confirm   = false;
}
