/// @function next_tutorial()
function next_tutorial()
{
    with (obj_tutorial)
    {
        if (!tutorial_done)
        {
            tutorial_stage += 1;
            tutorial_shown = false;
            global.tutorial_visible = false;
            global.tutorial_message = "";
        }
    }
}
