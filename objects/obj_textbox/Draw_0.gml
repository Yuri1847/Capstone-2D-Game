accept_key = keyboard_check_pressed(vk_space);

var cam = view_camera[0];

// Get camera position and size
var cam_x = camera_get_view_x(cam);
var cam_y = camera_get_view_y(cam);
var cam_w = camera_get_view_width(cam);
var cam_h = camera_get_view_height(cam);

// Align textbox to bottom center of camera
textbox_x = cam_x + (cam_w - textbox_width) / 2;
textbox_y = cam_y + cam_h - textbox_height - border;

//setup
if setup == false{
	
	setup = true;
	draw_set_font(global.font_main);
	draw_set_valign(fa_top);
	draw_set_halign(fa_left);
	
	//loop throught pages
	page_number = array_length(text)
	for(var p = 0; p < page_number; p++){
		//find how many character each page and store that number in "text_length" array
		text_length[p] = string_length(text[p]);
		
		//get the x position of the text box
		//no character (centered textbox)
		text_x_offset[p] = 80;
	}
	
}


//typing the test
if draw_char < text_length[page]{
	draw_char += txt_spd;
	draw_char = clamp(draw_char, 0, text_length[page]);
}


//flip through pages
if accept_key{
	
	// if typing is donw
	if draw_char == text_length[page]{
		//next page 
		if page < page_number-1{
			page++;
			draw_char = 0;
		}
		// destroy the textbox
		else{
			instance_destroy();
		}	
	}
	// if not done typing
	else{
		draw_char = text_length[page];
	}
}


//draw the textbox
txt_spd += txt_spd;
txtb_spr_w = sprite_get_width(txtb_spr);
txtb_spr_h = sprite_get_height(txtb_spr);
//back to textbox
draw_sprite_ext(txtb_spr, txtb_img, textbox_x, textbox_y, textbox_width/txtb_spr_w, textbox_height/txtb_spr_h, 0, c_white, 1);

//draw text	
var _drawtext = string_copy(text[page], 1, draw_char);
draw_text_ext(textbox_x + border, textbox_y + border, _drawtext, line_sep, line_width);
















