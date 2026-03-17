const formatList = (items) => items?.length ? items : ["Not available yet"];

export const formatGuide = ({ country, emergency, places, cultural, health, visa }) => {
    if (!country) {
        return {
            title: "Travel Guide",
            sections: [
                {
                    title: "Missing Details",
                    items: ["Country information is not available."],
                },
            ],
        };
    }
    return {
        title: `${country.country_name} Travel Guide`,
        sections: [
            {
                title: "Basics",
                items: [
                    `Capital: ${country.capital || "Not available yet"}`,
                    `Currency: ${country.currency || "Not available yet"}`,
                    `Region: ${country.region || "Not available yet"}`,
                    `Language: ${country.language || "Not available yet"}`,
                ],
            },
            {
                title: "Emergency",
                items: emergency
                    ? [
                        `Police: ${emergency.police_number || "N/A"}`,
                        `Ambulance: ${emergency.ambulance_number || "N/A"}`,
                        `Fire: ${emergency.fire_number || "N/A"}`,
                        `General: ${emergency.general_emergency || "N/A"}`,
                    ]
                    : ["Not available yet"],
            },
            {
                title: "Places",
                items: places?.length
                    ? places.map(place => `${place.name} - ${place.description || "N/A"}`)
                    : ["Not available yet"],
            },
            {
                title: "Do's",
                items: formatList(cultural?.dos),
            },
            {
                title: "Don'ts",
                items: formatList(cultural?.donts),
            },
            {
                title: "Dress Code",
                items: [cultural?.dress_code || "Not available yet"],
            },
            {
                title: "Health Advisory",
                items: health
                    ? [
                        `CDC Notice Level: ${health.cdc_notice_level ?? "N/A"}`,
                        `Required Vaccines: ${(health.required_vaccines || []).join(", ") || "N/A"}`,
                        `Recommended Vaccines: ${(health.recommended_vaccines || []).join(", ") || "N/A"}`,
                        `Health Risks: ${(health.health_risks || []).join(", ") || "N/A"}`,
                        `Medication Rules: ${health.medication_rules || "N/A"}`,
                    ]
                    : ["Not available yet"],
            },
            {
                title: "Visa",
                items: visa
                    ? [
                        `Status: ${visa.visa_status || "N/A"}`,
                        `Title: ${visa.visa_title || "N/A"}`,
                        `Free Days: ${visa.visa_free_days || "N/A"}`,
                        `Details: ${visa.visa_info || "N/A"}`,
                    ]
                    : ["Not available yet"],
            },
        ],
    };
};

export const formatVisa = ({ country, visa }) => {
    if (!country) {
        return {
            title: "Visa Information",
            sections: [
                {
                    title: "Missing Details",
                    items: ["Please specify a destination country."],
                },
            ],
        };
    }

    return {
        title: `Visa: ${country.country_name}`,
        sections: [
            {
                title: "Rules",
                items: visa
                    ? [
                        `${visa.visa_status || "Unknown"} - ${visa.visa_free_days || "N/A"} days (${visa.visa_title || "No title"})`,
                        visa.visa_info || "No details",
                    ]
                    : ["No visa rule found yet"],
            },
        ],
    };
};
