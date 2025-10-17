function sc_profiles_init(){
	/// sc_profiles_init.gml
	global.profile_count = 3; // change if you want more slots
	global.profiles = [];     // will be an array of structs
	global.current_profile = -1; // index of active profile, -1 = none

	// default slot structure
	function _profile_default() {
	    return {
	        name: "",
	        last_save: "",
	        summary: "" // small text like "Chapter 2 - 1:12"
	    };
	}

	// initialize defaults
	for (var i = 0; i < global.profile_count; ++i) {
	    array_push(global.profiles, _profile_default());
	}

}