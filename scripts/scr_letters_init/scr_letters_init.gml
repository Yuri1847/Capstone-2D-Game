function scr_letters_init(){
	/// scr_letters_init()
// Call once at game start

// letters array (structs)
global.letters = [];

// Example letter (add more below or load from json)
var L_elias = {
    id: "elias_cry",
    title: "Liham ni Elias",
    author: "Elias",
    date: "1872-03-05",
    text: "Kung ang bayan ay patuloy na pipikit sa katotohanan, sino ang magbubukas ng kanyang mga mata? Hindi ako naghangad ng ginto. Ang hinihingi ko’y katarungan.",
    // prompt: question + choices (struct array)
    prompt: {
        question: "Ano ang tono ng liham na ito?",
        choices: [
            { id: "courage", label: "Tunay na tapang — laban sa pang-aapi.", theme: "Courage", value: 2, stamp: "courage_stamp" },
            { id: "justice", label: "Hinamon ang bayan para sa katarungan.", theme: "Justice", value: 2, stamp: "justice_stamp" },
            { id: "compassion", label: "Masakit, humihingi ng malasakit.", theme: "Compassion", value: 1, stamp: "compassion_stamp" }
        ]
    },
    consequences: { unlock_flag: "quest_elias", xp: 10 } // optional global consequences
};
array_push(global.letters, L_elias);

// Reflection system (entries array + stats)
global.reflection_system = {
    entries: [],  // array of ReflectionEntry structs
    stats: { Courage: 0, Justice: 0, Compassion: 0, Wisdom: 0, NationalInsight: 0 },

    add_entry: function(npc_name, letter_id, theme, choice_id, choice_label, value) {
        var entry = {
            npc: npc_name,
            letter_id: letter_id,
            theme: theme,
            choice_id: choice_id,
            choice_label: choice_label,
            value: value,
            timestamp: current_datetime()
        };
        array_push(self.entries, entry);
        // apply stat change (if theme exists)
        if (self.stats[? theme] != undefined) {
            self.stats[? theme] += value;
        } else {
            // fallback: count towards NationalInsight if unknown theme
            self.stats.NationalInsight += value;
        }
    },

    // helper getters
    get_theme_value: function(theme) { return (self.stats[? theme] != undefined) ? self.stats[? theme] : 0; },
    get_summary_text: function() {
        var s = "Reflection Summary:\n";
        var keys = array_create(0);
        // gather keys (since stats is a struct, enumerate manually)
        array_push(keys, "Courage"); array_push(keys, "Justice"); array_push(keys, "Compassion");
        array_push(keys, "Wisdom"); array_push(keys, "NationalInsight");
        for (var i=0; i<array_length(keys); i++) {
            var k = keys[i];
            s += k + ": " + string(self.stats[? k]) + "\n";
        }
        return s;
    },

    // JSON save/load helpers
    save_json: function(filename) {
        var j = {
            entries: self.entries,
            stats: self.stats
        };
        var str = json_encode(j);
        var f = file_text_open_write(filename);
        file_text_write_string(f, str);
        file_text_close(f);
    },

    load_json: function(filename) {
        if (!file_exists(filename)) return false;
        var f = file_text_open_read(filename);
        var s = file_text_read_string(f);
        file_text_close(f);
        var j = json_parse(s);
        if (j != undefined) {
            self.entries = j.entries;
            self.stats = j.stats;
            return true;
        }
        return false;
    }
};
	
}