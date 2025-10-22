/// Room title setup
title_text = room_get_name(room);

// Custom readable names per room
switch (room) {
    case rm_fondeDeLala:
        title_text = "Fonde de Lala";
        break;
    case rm_fonde_de_lala_market:
        title_text = "Market";
        break;
    case rm_Hotel_Fonda_First_Floor:
        title_text = "Fonde de Lala Reception";
        break;
    case rm_Hotel_Fonda_Second_Floor:
        title_text = "Fonde de Lala Sleeping Quarters";
        break;
		
	case rm_binondo_main:
        title_text = "Binondo Plaza";
        break;
	case rm_binondo_church_inside:
        title_text = "Simbahan ng Binondo";
        break
		
	case rm_anluwage:
        title_text = "Anluwage Street";
        break;
	case rm_chapter2_crisostomo_ibarra:
        title_text = "Bulwagan";
        break;
	case rm_chapter3_hapunan:
        title_text = "Silid Kainan";
        break;
	case rm_chapter4_erehe_at_filibustero:
        title_text = "Baybayin";
        break;
	case rm_chapter5_liwanag_sa_gabing_madilim:
        title_text = "Fonde de Lala Sleeping Quarters";
        break;
		
	case rm_maria_clara_house_inside_first_floor:
        title_text = "Sala";
        break;
	case rm_maria_clara_house_inside_second_floor:
        title_text = "Asotea";
        break;
		
	case rm_chapter8_alaala:
        title_text = "Fonde de Lala Sleeping Quarters";
        break;
	default:
		//For main menu room, settings room, lead room, loaing room, splash screen room
		title_text = "";
	break
	
	
    // Add more as needed
}


// Animation + layout config
alpha = 0;
state = "fade_in";
fade_speed = 0.05;
hold_time = room_speed * 2;
timer = 0;

// horizontal "stretch from center" progress (0..1)
width_scale = 0;           // 0 = collapsed, 1 = fully expanded
target_width_scale = 1;
transition_speed = 0.12;   // tweak for faster/slower expansion

// padding & margin
pad_x = 28;    // horizontal padding inside bg
pad_y = 12;    // vertical padding
margin_top = 32; // distance from top of GUI area to top of popup

// font to be used for measuring/drawing (set your font resource)
popup_font = fnt_rn; // change if needed