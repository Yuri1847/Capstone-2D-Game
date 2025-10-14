depth =-y;

if(instance_exists(obj_dialog)) exit;

if(instance_exists(obj_player) && distance_to_object(obj_player) < 16){
	//sc_visible_layer(["talk_button_layer","talk_panel"]);
	instance_activate_object(obj_talk_button)
	can_talk = true;
	if(global.talk_button_pressed == true){
		create_dialogue(dialog);
	}
}else if(distance_to_object(obj_player) > 16){
	//sc_invisible_layer(["talk_button_layer","talk_panel"]);
	instance_deactivate_object(obj_talk_button)
	can_talk = false;
}