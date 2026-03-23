const INTENT_RULES = [
    { intent: "visa_info", patterns: ["visa", "entry", "evisa", "visa on arrival"] },
    { intent: "emergency_numbers", patterns: ["emergency", "police", "ambulance", "fire"] },
    { intent: "health", patterns: ["health", "vaccine", "vaccination", "malaria", "disease", "outbreak", "cdc"] },
    { intent: "airport_info", patterns: ["airport", "airports", "iata", "terminal"] },
    { intent: "currency_info", patterns: ["currency", "exchange", "rate", "fx", "convert"] },
    { intent: "transportation", patterns: ["transport", "transportation", "taxi", "bus", "uber", "ride"] },
    { intent: "dos_donts", patterns: ["do's", "donts", "don't", "customs", "culture", "etiquette"] },
    { intent: "safety_alerts", patterns: ["alert", "safety", "warning", "travel advisory"] },
];

const normalize = (text) => {
    return (text || "")
        .toLowerCase()
        .replace(/[^a-z0-9\s]/g, " ")
        .replace(/\s+/g, " ")
        .trim();
};

export const analyzeQuery = (text) => {
    const normalized = normalize(text);
    const matched = INTENT_RULES.find(rule =>
        rule.patterns.some(pattern => normalized.includes(pattern))
    );

    return matched?.intent || "general_guide";
};
