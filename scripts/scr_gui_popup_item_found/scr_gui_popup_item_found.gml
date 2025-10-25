function scr_gui_popup_item_found(_dialogf){
	/// scr_gui_popup_item_found(_dialog)
	var _dialog = _dialogf;
	var popup = instance_create_depth(0, 0, 0, obj_gui_popup);
	popup.dialog_ref = _dialog;
	popup.title = "Item Found";
	popup.text = "You got: Bronze Key";
	popup.button = "OK";
	popup.required = false;

}