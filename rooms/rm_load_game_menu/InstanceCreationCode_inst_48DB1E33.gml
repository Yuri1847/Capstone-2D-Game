function room_start_UI_Folder(){
	sc_visible_layer(["load_game_menu_layer"])
	sc_invisible_layer([
	"state_slot1_dialog_layer",
	"state_slot2_dialog_layer",
	"state_slot3_dialog_layer"
	])
}

function room_end_UI_Folder(){
	sc_invisible_layer(["load_game_menu_layer"])
}