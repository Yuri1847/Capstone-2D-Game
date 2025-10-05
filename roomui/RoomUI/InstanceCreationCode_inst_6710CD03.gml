function clickButton(){
	sc_visible_layer([
	"right_option_layer", 
	"pause_button_layer", 
]);
	
	instance_activate_object(obj_player)
	instance_activate_object(obj_joystick_base)
	instance_activate_object(obj_multitouch_manager)
	instance_activate_object(obj_Inventory)
	instance_activate_object(obj_slider_bar)
	
	obj_player.x = 320;
	obj_player.y = 380;
	room_goto(rm_fondeDeLala);
}