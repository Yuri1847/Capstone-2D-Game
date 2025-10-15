function room_start_UI_Folder(){
	sc_visible_layer(["load_game_menu_layer"])
	sc_invisible_layer([
	"load_slot1_main_dialog_layer",
	"load_slot2_main_dialog_layer",
	"load_slot3_main_dialog_layer"
	])
}

function room_end_UI_Folder(){
	sc_invisible_layer(["load_game_menu_layer"])
}