depth =-y;

if(instance_exists(obj_dialog)) exit;

if(instance_exists(obj_player) && distance_to_object(obj_player) < 16){
	sc_visible_layer(["talk_button_layer","talk_panel"]);
	can_talk = true;
	if(global.talk_button_pressed == true){
		create_dialogue(dialog);
	}
}else{
	sc_invisible_layer(["talk_button_layer","talk_panel"]);
	can_talk = false;
}