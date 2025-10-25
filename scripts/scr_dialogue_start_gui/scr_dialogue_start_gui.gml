function scr_dialogue_start_gui(action_struct, dialog_instf){
	/// scr_dialogue_start_gui(action_struct, dialog_inst)
	var a = action_struct;
	var dialog_inst = dialog_instf;

	// create a simple popup object which shows a title, text and a button
	var popup = instance_create_depth(0, 0, 0, obj_gui_popup);
	popup.title = a.title;
	popup.text = a.text;
	popup.button_text = (variable_struct_exists(a, "button") ? a.button : "OK");
	popup.dialog_ref = dialog_inst;

	// In obj_gui_popup, when player presses the button:
	//   scr_dialogue_action_complete(dialog_ref);
	//   instance_destroy(); // close popup

}