/// sc_getSplashForRoom(_room)
function sc_getSplashForRoom(_room) {
    switch (_room) {
        case rm_chapter2_crisostomo_ibarra: return spr_titleScreen_chap2;
        case rm_chapter3_hapunan: return spr_titleScreen_chap3;
		case rm_chapter4_erehe_at_filibustero: return spr_titleScreen_chap4;
		case rm_chapter5_liwanag_sa_gabing_madilim: return spr_titleScreen_chap5;
        // add more here
    }
    return noone;
}
