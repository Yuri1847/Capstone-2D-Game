fade = 0;               // start hidden
fade_speed = 0.05;      // fade in/out speed
is_closing = false;     // flag for closing state
button_w = 150;         // button width
button_h = 50;          // button height


// In Create Event:
if (!variable_instance_exists(self, "data")) {
    data = {
        location: "Unknown",
        category: "Unknown",
        description: "",
        background: "",
        relevance: ""
    };
}

