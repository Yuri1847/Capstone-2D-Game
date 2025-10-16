function quiz_start() {
    global.quiz_active = true;
    global.quiz_done = false;

    // Choose questions based on warp’s quiz_id
    switch(global.quiz_id) {
        case "fonde_market":
            global.quiz_data = {
                question_index: 0,
                score: 0,
                questions: [
                    { text: "Who insulted Don Rafael?", choices:["Padre Damaso","Padre Sibyla","Tiniente Guevarra"], correct:0 },
                    { text: "Guevarra’s tone?", choices:["Angry","Sympathetic","Arrogant"], correct:1 },
                    { text: "What does 'ang anak ng leon ay leon din naman' mean?", choices:["Truth cannot be silenced","Ibarra is dangerous","Europeans are superior"], correct:0 }
                ],
                selected: -1
            };
            break;

        default:
            global.quiz_data = {
                question_index: 0,
                score: 0,
                questions: [],
                selected: -1
            };
            break;
    }

    // Spawn the quiz object in the GUI layer if not existing
    if (!instance_exists(obj_quiz)) {
        instance_create_layer(0, 0, "ins_challenges", obj_quiz);
    }
}
