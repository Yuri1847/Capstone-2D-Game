/// show_popup(_text, [_duration])
/// _text: string to display
/// _duration: optional, in frames (default = 120)

function show_popup(_text, _duration)
{
    // handle optional duration safely
    var duration = (argument_count > 1) ? _duration : 120;

    // Check if popup already exists
    if (instance_exists(obj_sps_popup)) {
        with (obj_sps_popup) {
            text = string(_text);
            timer = duration;
            alpha = 1;
            visible = true;
        }
    } 
    else {
        // Create new popup instance on GUI layer
        var inst = instance_create_layer(0, 0, "ins_gui", obj_sps_popup);
        with (inst) {
            text = string(_text);
            timer = duration;
            alpha = 1;
            visible = true;
        }
    }
}
