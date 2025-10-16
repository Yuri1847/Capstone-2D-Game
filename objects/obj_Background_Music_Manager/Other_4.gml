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
        sc_set_bgm(snd_background_music);
        break;
	case "rm_Hotel_Fonda_First_Floor":
	case "rm_Hotel_Fonda_Second_Floor":
		sc_set_bgm(snd_inside_room)
		break;
    default:
        sc_set_bgm(snd_outside_room);
        break;
    // add more rooms as needed
}