function sc_timeline_encounter() {
    // Prevent duplicates
    if (instance_exists(obj_timeline_ui)) return;

    // Timeline sequence
    var timeline_cards = [
        "Ibarra introduced by Tiago",
        "Damaso insult",
        "Guevarra’s praise",
        "Tinong’s invitation",
        "Dinner call"
    ];

    // ✅ Create UI object on GUI layer
    var ui = instance_create_layer(0, 0, "ins_challenges", obj_timeline_ui);
    ui.timeline_cards = timeline_cards;

    // Success callback
    ui.on_success = function() {
        show_debug_message("Timeline challenge complete!");
    };
}
