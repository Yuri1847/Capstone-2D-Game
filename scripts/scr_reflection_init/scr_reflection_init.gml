global.reflection_data = {
    ibarra_damaso: {
        header: "✦ REFLECTION ✦",
        question: "“If you were Ibarra, what would you do?”",
        scenario: "❝ Padre Dámaso insults your late father in front of everyone. ❞",
        choices: [
            "🟥 [A] Speak up and defend your father’s honor. (Justice)",
            "🟦 [B] Answer calmly with composure and reason. (Wisdom)",
            "🟩 [C] Hold your silence to keep the peace. (Humility)"
        ],
        stat_text: "️Justice: (5)   Wisdom: (2)   Humility: (1)",
        stats: { justice: 5, wisdom: 2, humility: 1 },
        // 🔽 NEW: each choice gives specific stat points
        choice_stats: [
            { justice: 2, wisdom: 0, humility: 0 }, // A
            { justice: 0, wisdom: 2, humility: 0 }, // B
            { justice: 0, wisdom: 0, humility: 2 }  // C
        ],
    },

    elias_guard: {
        header: "✦ REFLECTION ✦",
        question: "“If you were Elias, what would you do?”",
        scenario: "❝ The guards accuse you of rebellion and your friend is at risk. ❞",
        choices: [
            "🟥 [A] Defend your friend and face arrest. (Justice)",
            "🟦 [B] Try to reason with the guards peacefully. (Wisdom)",
            "🟩 [C] Flee to fight another day. (Humility)"
        ],
        stat_text: "️Justice: (3)   Wisdom: (4)   Humility: (2)",
        stats: { justice: 3, wisdom: 4, humility: 2 },
        choice_stats: [
            { justice: 3, wisdom: 0, humility: 0 }, // A
            { justice: 0, wisdom: 3, humility: 0 }, // B
            { justice: 0, wisdom: 0, humility: 3 }  // C
        ],
    }
};
