/// sc_getSplashForRoom(_room)
function sc_getSplashForRoom(_room) {
    switch (_room) {
		//level 1
        case rm_chapter2_crisostomo_ibarra: return spr_titleScreen_chap2;
        case rm_chapter3_hapunan: return spr_titleScreen_chap3;
		case rm_chapter4_erehe_at_filibustero: return spr_titleScreen_chap4;
		case rm_chapter5_liwanag_sa_gabing_madilim: return spr_titleScreen_chap5;
        // level 2
		case rm_chapter7_ligawan_sa_asotea: return spr_titleScreen_chap7;
		case rm_chapter8_alaala: return spr_titleScreen_chap8;
		//level 3
		case rm_chapter13_BabalaNgSigwa: return spr_titleScreen_chap13;
		case rm_chapter19_KaranasanNgIsangGuro: return spr_titleScreen_chap19;
		//level 4
		case rm_chapter22_liwanagAtDilim: return spr_titleScreen_chap22;
        case rm_chapter23_piknik: return spr_titleScreen_chap23;
		case rm_chapter24_kagubatan: return spr_titleScreen_chap24;
		case rm_chapter25_bahayNiPilosopoTasyo: return spr_titleScreen_chap25;
		//level 5
		case rm_chapter27_pagtatakipsilim: return spr_titleScreen_chap27;
        case rm_chapter29_arawNgPista: return spr_titleScreen_chap29;
		case rm_chapter31_sermon: return spr_titleScreen_chap31;
		case rm_chapter32_paghugos: return spr_titleScreen_chap32;
		case rm_chapter33_malayangIsipan: return spr_titleScreen_chap33;
        case rm_chapter34_pananghalian: return spr_titleScreen_chap34;
		//level 6
		case rm_chapter37_kapitanHeneral: return spr_titleScreen_chap37;
        case rm_chapter40_karapatanAtLakas: return spr_titleScreen_chap40;
		case rm_chapter41_dalawangDalaw: return spr_titleScreen_chap41;
		case rm_chapter48_palaisipan: return spr_titleScreen_chap48;
		//level 7
		case rm_chapter49_hinaingNgMgaInuusig: return spr_titleScreen_chap49;
        case rm_chapter54_walangLihimAndHindiNabubunyag: return spr_titleScreen_chap54;
		case rm_chapter55_pagkakagulo: return spr_titleScreen_chap55;
		case rm_chapter58_sinumpa: return spr_titleScreen_chap58;
		//level 8
		case rm_chapter60_kasalNiMariaClara: return spr_titleScreen_chap60;
        case rm_chapter61_habulanSaLawa: return spr_titleScreen_chap61;
    }
    return noone;
}
