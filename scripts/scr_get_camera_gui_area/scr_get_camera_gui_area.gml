/// @function scr_get_camera_gui_area()
/// @description Returns a struct with {x, y, w, h} of the visible camera area in GUI space (no black bars).

function scr_get_camera_gui_area() {
    var cam = view_camera[0];
    var cam_w = camera_get_view_width(cam);
    var cam_h = camera_get_view_height(cam);

    var gui_w = display_get_gui_width();
    var gui_h = display_get_gui_height();

    var gui_aspect = gui_w / gui_h;
    var cam_aspect = cam_w / cam_h;

    var offset_x = 0;
    var offset_y = 0;
    var draw_w = gui_w;
    var draw_h = gui_h;

    if (cam_aspect > gui_aspect) {
        draw_h = gui_w / cam_aspect;
        offset_y = (gui_h - draw_h) * 0.5;
    } else if (cam_aspect < gui_aspect) {
        draw_w = gui_h * cam_aspect;
        offset_x = (gui_w - draw_w) * 0.5;
    }

    // Return as struct for convenience
    return {
        x: offset_x,
        y: offset_y,
        w: draw_w,
        h: draw_h
    };
}
