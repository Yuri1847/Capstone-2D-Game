/// scr_reflection_get_data(_id)
/// @param _id string - Reflection ID key
/// @return struct containing all data

function scr_reflection_get_data(_id)
{
    switch (_id)
    {
        case "ibarra_damaso":
            return {
                header: "✦ REFLECTION ✦",
                question: "“If you were Ibarra, what would you do?”",
                scenario: "❝ Padre Dámaso insults your late father in front of everyone.\nSilence fills the room. ❞",
                choices: [
                    "🟥 [A] Speak up and defend your father’s honor. (Justice)",
                    "🟦 [B] Answer calmly with composure and reason. (Wisdom)",
                    "🟩 [C] Hold your silence to keep the peace. (Humility)"
                ],
                stats: "⚖️ Justice: ▓▓▓▓▓░░░ (5)   🧠 Wisdom: ▓▓░░░░░ (2)   🙇 Humility: ▓░░░░░░ (1)"
            };

        case "elias_guard":
            return {
                header: "✦ REFLECTION ✦",
                question: "“If you were Elias, what would you do?”",
                scenario: "❝ The guards accuse you of rebellion and your friend is at risk. ❞",
                choices: [
                    "🟥 [A] Defend your friend and face arrest. (Justice)",
                    "🟦 [B] Try to reason with the guards peacefully. (Wisdom)",
                    "🟩 [C] Flee to fight another day. (Humility)"
                ],
                stats: "⚖️ Justice: ▓▓▓░░░░ (3)   🧠 Wisdom: ▓▓▓▓░░░ (4)   🙇 Humility: ▓▓░░░░ (2)"
            };
    }

    return undefined; // fallback
}
