/*if (!variable_global_exists("BM_id")) {
    global.BM_id = audio_play_sound(snd_background_music, 0, true);
    
    // Check if slider exists and has a value
    if (instance_exists(obj_slider_bar)) {
        audio_sound_gain(global.BM_id, obj_slider_bar.slider_bm_value, 0);
    }
}*/

// In Room Start Event of obj_Background_Music_Manager
var room_name = room_get_name(room);

switch (room_name) {
    case "rm_main_menu":
	case "rm_settings_menu":
	case "rm_load_game_menu": 
        sc_set_bgm(snd_main_music);
        break;
	case "rm_splash_screen":
	case "rm_loading_bar_first_map":
		audio_sound_gain(global.BM_id, 0, 0);
		break;
	case "rm_Hotel_Fonda_First_Floor":
	case "rm_Hotel_Fonda_Second_Floor":
	case "rm_binondo_church_inside":
	case "rm_maria_clara_house_inside_first_floor":
	case "rm_maria_clara_house_inside_second_floor":
		sc_set_bgm(snd_inside_room);
		break;
	case "rm_chapter2_crisostomo_ibarra":
		sc_set_bgm(snd_chapter1_room);
		break;
	case "rm_chapter3_hapunan":
		sc_set_bgm(snd_chapter2_room);
		break;
    default:
        sc_set_bgm(snd_outside_room);
        break;
    // add more rooms as needed
}