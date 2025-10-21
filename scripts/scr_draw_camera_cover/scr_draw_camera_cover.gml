/// @function scr_draw_camera_cover(sprite, frame)
/// @description Draws the given sprite stretched to cover only the camera view (excluding black bars).
/// @param sprite
/// @param frame

function scr_draw_camera_cover(_spr, _subimg) {
    var area = scr_get_camera_gui_area();
    draw_sprite_stretched(_spr, _subimg, area.x, area.y, area.w, area.h);
}
