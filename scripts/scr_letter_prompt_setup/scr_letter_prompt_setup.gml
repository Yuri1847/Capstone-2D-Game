function scr_letter_prompt_setup(_header, _question, _scenario, _choices, _choice_stats)
{
    if (!is_string(_header))     _header   = "";
    if (!is_string(_question))   _question = "";
    if (!is_string(_scenario))   _scenario = "";
    if (!is_array(_choices))     _choices  = [];
    if (!is_array(_choice_stats)) _choice_stats = [];

    header_text   = _header;
    question_text = _question;
    scenario_text = _scenario;
    choice_list   = _choices;
    choice_stats  = _choice_stats;

    selected_choice = -1;
    hover_confirm   = false;
}