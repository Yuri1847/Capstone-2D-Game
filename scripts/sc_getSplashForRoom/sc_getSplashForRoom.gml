/// sc_getSplashForRoom(_room)
function sc_getSplashForRoom(_room) {
    switch (_room) {
        case rm_chapter2_crisostomo_ibarra: return spr_titleScreen_chap2;
        case rm_chapter3_hapunan: return spr_titleScreen_chap3;
        // add more here
    }
    return noone;
}
