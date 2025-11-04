// Create Event of obj_joystick_base

global.enabledJOY = true;

joyX = 0;
joyY = 0;
touchId = -1;

// Get GUI camera area
var area = scr_get_camera_gui_area();

// ---[ Dynamic scaling section ]---
var base_gui_width  = 1920; // your reference design width
var base_gui_height = 1080; // your reference design height

// Compute width and height ratios
var scale_w = area.w / base_gui_width;
var scale_h = area.h / base_gui_height;

// Combine them: average the two or take the smaller one for safety
// "min" ensures UI never goes offscreen on extra wide screens
global.joystick_scale = clamp(min(scale_w, scale_h), 0.75, 1.25);

// ---[ Radius and position ]---
radius = (sprite_width / 2) * global.joystick_scale;

// Position joystick bottom-left with scaled margin
var margin = 128 * global.joystick_scale;
x = area.x + margin + radius;
y = area.y + area.h - margin - radius;

// Input assigner
input = function (touchId)
{
    self.touchId = touchId;
};


// Highlight settings for tutorial
highlight_alpha = 0;
highlight_dir = 1; // 1 = fade in, -1 = fade out
