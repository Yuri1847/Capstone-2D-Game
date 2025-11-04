/// @function show_tutorial(message)
function show_tutorial(_msg)
{
    global.tutorial_message = _msg;
    global.tutorial_visible = true;
    global.tutorial_alpha = 1; // (optional: if you later want to fade in/out)
}	
