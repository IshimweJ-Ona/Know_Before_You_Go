const normalize = (text) =>
  String(text || "")
    .toLowerCase()
    .replace(/[^a-z0-9\s]/g, " ")
    .replace(/\s+/g, " ")
    .trim();

const DISALLOWED = [
  {
    name: "politics",
    patterns: [
      "politic",
      "government",
      "president",
      "prime minister",
      "election",
      "party",
      "parliament",
      "war",
      "conflict",
      "coup",
      "sanction",
      "diplomacy",
      "border dispute",
    ],
  },
  {
    name: "religion",
    patterns: [
      "religion",
      "faith",
      "church",
      "mosque",
      "temple",
      "islam",
      "christian",
      "christianity",
      "judaism",
      "hindu",
      "buddh",
    ],
  },
  {
    name: "relationships",
    patterns: [
      "relationship",
      "dating",
      "marriage",
      "sex",
      "sexual",
      "boyfriend",
      "girlfriend",
    ],
  },
  {
    name: "science",
    patterns: [
      "science",
      "physics",
      "chemistry",
      "biology",
      "research",
      "experiment",
    ],
  },
];

const EDUCATION_PATTERNS = [
  "education",
  "literacy",
  "school",
  "enrollment",
  "enrolment",
  "primary",
  "secondary",
  "tertiary",
];

const STUDY_PROGRAM_PATTERNS = [
  "study",
  "university",
  "college",
  "degree",
  "scholarship",
];

const ALLOWED_TRAVEL_PATTERNS = [
  "visa",
  "entry",
  "health",
  "vaccine",
  "emergency",
  "police",
  "ambulance",
  "fire",
  "culture",
  "customs",
  "etiquette",
  "transport",
  "taxi",
  "bus",
  "train",
  "airport",
  "flight",
  "safety",
  "law",
  "legal",
  "currency",
  "exchange",
  "climate",
  "weather",
  "budget",
  "cost",
  "accommodation",
  "housing",
  "places",
  "tourism",
  "tipping",
  "language",
  "time zone",
  "timezone",
];

const hasAny = (text, patterns) => patterns.some((p) => text.includes(p));

export const evaluateQueryPolicy = (query) => {
  const normalized = normalize(query);
  if (!normalized) {
    return { allowed: false, reason: "empty" };
  }

  const blocked = DISALLOWED.find((rule) => hasAny(normalized, rule.patterns));
  if (blocked) {
    return { allowed: false, reason: blocked.name };
  }

  const wantsEducation = hasAny(normalized, EDUCATION_PATTERNS);
  const mentionsStudyPrograms = hasAny(normalized, STUDY_PROGRAM_PATTERNS);

  if (mentionsStudyPrograms && !wantsEducation) {
    return { allowed: false, reason: "study_programs" };
  }

  const allowedByTravel = hasAny(normalized, ALLOWED_TRAVEL_PATTERNS);
  if (!allowedByTravel && !wantsEducation) {
    return { allowed: false, reason: "out_of_scope" };
  }

  return { allowed: true, wantsEducationStats: wantsEducation };
};

export const buildPolicyRefusal = (reason) => {
  switch (reason) {
    case "empty":
      return "Please ask a question about travel or education statistics for a country, and I will help.";
    case "study_programs":
      return "I can share education statistics for a country (like literacy or enrollment rates), but I cannot provide advice about studying, universities, or scholarships.";
    case "politics":
    case "religion":
    case "relationships":
    case "science":
      return "I can help with travel info and education statistics for countries, but I can't help with politics, religion, relationships, or general science topics.";
    default:
      return "I can help with travel info about countries (visas, health, emergency contacts, culture, transport) and education statistics. Please ask about one of those topics.";
  }
};
