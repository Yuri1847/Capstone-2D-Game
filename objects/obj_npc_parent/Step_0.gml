depth =-y;

if(instance_exists(obj_dialog)) exit;

if(instance_exists(obj_player) && distance_to_object(obj_player) < 16){
	//sc_visible_layer(["talk_button_layer","talk_panel"]);
	obj_talk_button.isEnabled = true;
	can_talk = true;
	if(global.talk_button_pressed == true){
		create_dialogue(dialog);
		obj_talk_button.isEnabled = false;
		global.talk_button_pressed = false;
	}
}else if(distance_to_object(obj_player) > 16){
	//sc_invisible_layer(["talk_button_layer","talk_panel"]);
	obj_talk_button.isEnabled = false;
	can_talk = false;
}