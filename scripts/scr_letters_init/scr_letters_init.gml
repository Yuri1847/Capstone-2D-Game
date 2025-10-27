// --------------------------------------------------
// scr_letters_init()
// Call once at game start
// --------------------------------------------------
function scr_letters_init() {
    /// scr_letters_init()
    global.letters = {};

    // Example letter
    global.letters.elias_cry = {
        id: "elias_cry",
        title: "Liham ni Elias",
        author: "Elias",
        date: "1872-03-05",
        text: "Kung ang bayan ay patuloy na pipikit sa katotohanan, sino ang magbubukas ng kanyang mga mata? Hindi ako naghangad ng ginto. Ang hinihingi ko’y katarungan.",
        prompt: {
            question: "Ano ang tono ng liham na ito?",
            choices: [
                { id: "courage", label: "Tunay na tapang — laban sa pang-aapi.", theme: "Courage", value: 2, stamp: "courage_stamp" },
                { id: "justice", label: "Hinamon ang bayan para sa katarungan.", theme: "Justice", value: 2, stamp: "justice_stamp" },
                { id: "compassion", label: "Masakit, humihingi ng malasakit.", theme: "Compassion", value: 1, stamp: "compassion_stamp" }
            ]
        },
        consequences: { unlock_flag: "quest_elias", xp: 10 }
    };

    // ✅ Reflection system
    global.reflection_system = {
        entries: [],
        stats: { Courage: 0, Justice: 0, Compassion: 0, Wisdom: 0, NationalInsight: 0 },

        add_entry: function(_npc_name, _letter_id, _theme, _choice_id, _choice_label, _value) {
            var entry = {
                npc: _npc_name,
                letter_id: _letter_id,
                theme: _theme,
                choice_id: _choice_id,
                choice_label: _choice_label,
                value: _value,
                timestamp: string(date_now())
            };
            array_push(this.entries, entry);

            if (struct_has_key(this.stats, _theme)) {
                this.stats[_theme] += _value;
            } else {
                this.stats.NationalInsight += _value;
            }
        },

        get_theme_value: function(_theme) {
            return (struct_has_key(this.stats, _theme)) ? this.stats[_theme] : 0;
        },

        get_summary_text: function() {
            var s = "Reflection Summary:\n";
            var keys = ["Courage", "Justice", "Compassion", "Wisdom", "NationalInsight"];
            for (var i = 0; i < array_length(keys); i++) {
                var k = keys[i];
                s += k + ": " + string(this.stats[k]) + "\n";
            }
            return s;
        }
    };
}
