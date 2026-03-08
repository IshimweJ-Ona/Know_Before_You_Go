-- Know Before You Go - Seed Data
-- Sample data for 10 African countries
-- This data is for demonstration purposes

-- ============================================
-- INSERT COUNTRIES
-- ============================================
INSERT INTO countries (country_code, name, region, capital, flag_url) VALUES
('RWA', 'Rwanda', 'East Africa', 'Kigali', 'https://flagcdn.com/rw.svg'),
('KEN', 'Kenya', 'East Africa', 'Nairobi', 'https://flagcdn.com/ke.svg'),
('TZA', 'Tanzania', 'East Africa', 'Dar es Salaam', 'https://flagcdn.com/tz.svg'),
('UGA', 'Uganda', 'East Africa', 'Kampala', 'https://flagcdn.com/ug.svg'),
('NGA', 'Nigeria', 'West Africa', 'Abuja', 'https://flagcdn.com/ng.svg'),
('GHA', 'Ghana', 'West Africa', 'Accra', 'https://flagcdn.com/gh.svg'),
('ZAF', 'South Africa', 'Southern Africa', 'Pretoria', 'https://flagcdn.com/za.svg'),
('MAR', 'Morocco', 'North Africa', 'Rabat', 'https://flagcdn.com/ma.svg'),
('ETH', 'Ethiopia', 'East Africa', 'Addis Ababa', 'https://flagcdn.com/et.svg'),
('SEN', 'Senegal', 'West Africa', 'Dakar', 'https://flagcdn.com/sn.svg')
ON CONFLICT (country_code) DO NOTHING;

-- ============================================
-- INSERT VISA REQUIREMENTS
-- ============================================
INSERT INTO visa_requirements (country_code, visa_type, duration_days, cost_usd, requirements, notes) VALUES
-- Rwanda
('RWA', 'Visa on Arrival', 30, 50, 'Passport (valid 6+ months), return ticket, proof of accommodation', 'Available at Kigali International Airport'),
('RWA', 'Tourist Visa', 90, 50, 'Application form, passport, 2 photos, proof of funds', 'Can be extended up to 90 days'),

-- Kenya
('KEN', 'Tourist Visa', 90, 51, 'Passport (valid 6+ months), return ticket, proof of accommodation', 'e-Visa available online'),
('KEN', 'Business Visa', 90, 100, 'Invitation letter, passport, proof of funds, hotel booking', 'Valid for business activities'),

-- Tanzania
('TZA', 'Tourist Visa', 90, 50, 'Passport (valid 6+ months), application form, 1 photo, proof of funds', 'Issued on arrival at Dar es Salaam'),
('TZA', 'East Africa Tourist Visa', 90, 100, 'Single application for Kenya, Uganda, Tanzania', 'Valid in all three countries'),

-- Uganda
('UGA', 'Tourist Visa', 90, 50, 'Passport (valid 6+ months), proof of accommodation, return ticket', 'Available on arrival or online'),
('UGA', 'Business Visa', 90, 72, 'Invitation letter, passport, proof of funds', 'Must be activated within 6 months'),

-- Nigeria
('NGA', 'Tourist Visa', 90, 100, 'Passport (valid 6+ months), completed form, 2 photos, hotel booking', 'Apply at embassy or consulate'),
('NGA', 'Business Visa', 90, 150, 'Invitation letter, bank statements, business registration certificate', 'Processing time: 2-4 weeks'),

-- Ghana
('GHA', 'Visa on Arrival', 30, 0, 'Passport (valid 6+ months), return ticket, proof of accommodation', 'Many nationalities exempt from visa'),
('GHA', 'Resident Visa', 365, 120, 'Proof of funds, accommodation letter, return ticket', 'Can be extended annually'),

-- South Africa
('ZAF', 'Tourist Visa', 90, 0, 'Passport (valid 30+ days), proof of accommodation, return ticket', 'Visa-free for many African nationalities'),
('ZAF', 'Business Visa', 90, 0, 'Invitation letter, proof of funds, business registration', 'Valid for business purposes'),

-- Morocco
('MAR', 'Tourist Visa', 90, 0, 'Passport (valid 6+ months), return ticket, proof of funds', 'Visa-free for many nationalities'),
('MAR', 'Business Visa', 90, 0, 'Invitation letter, business documents, proof of funds', 'Available for business travelers'),

-- Ethiopia
('ETH', 'Tourist Visa', 30, 20, 'Passport (valid 6+ months), application form, 1 photo, return ticket', 'e-Visa available online (recommended)'),
('ETH', 'Business Visa', 30, 20, 'Invitation letter, passport, proof of funds', 'Valid for business activities'),

-- Senegal
('SEN', 'Visa on Arrival', 90, 0, 'Passport (valid 6+ months), return ticket, proof of accommodation', 'Visa-free entry for many nationalities'),
('SEN', 'Resident Visa', 365, 50, 'Proof of funds, employment contract, accommodation letter', 'Can be extended annually')
ON CONFLICT DO NOTHING;

-- ============================================
-- INSERT HEALTH REQUIREMENTS
-- ============================================
INSERT INTO health_requirements (country_code, requirement_name, is_mandatory, description, notes) VALUES
-- Rwanda
('RWA', 'Yellow Fever Vaccination', TRUE, 'Yellow fever vaccine required for entry from endemic countries', 'International vaccination certificate required'),
('RWA', 'Malaria Prophylaxis', FALSE, 'Recommended for travelers to rural areas', 'Consult doctor before travel'),
('RWA', 'Typhoid Vaccination', FALSE, 'Recommended but not mandatory', 'Food and water safety precautions still advised'),

-- Kenya
('KEN', 'Yellow Fever Vaccination', FALSE, 'Recommended, mandatory if arriving from endemic countries', 'Certificate needed only in specific cases'),
('KEN', 'Malaria Prophylaxis', FALSE, 'Highly recommended, especially for coastal and lake regions', 'Take precautions and use insect repellent'),
('KEN', 'Typhoid & Hepatitis A', FALSE, 'Recommended for most travelers', 'Vaccinations available before travel'),

-- Tanzania
('TZA', 'Yellow Fever Vaccination', FALSE, 'Recommended for most regions', 'Certificate may be required if traveling further'),
('TZA', 'Malaria Prophylaxis', FALSE, 'Essential, especially if visiting Zanzibar', 'Start 1-2 weeks before arrival'),
('TZA', 'Hepatitis A', FALSE, 'Recommended vaccination', 'Practice food and water safety'),

-- Uganda
('UGA', 'Yellow Fever Vaccination', FALSE, 'Recommended for entry from endemic regions', 'Certificate may be requested'),
('UGA', 'Malaria Prophylaxis', FALSE, 'Highly recommended throughout the country', 'Use nets and repellent daily'),
('UGA', 'Typhoid & Polio', FALSE, 'Recommended boosters', 'Previous vaccination may suffice'),

-- Nigeria
('NGA', 'Yellow Fever Vaccination', TRUE, 'Mandatory for entry to most parts', 'International certificate required'),
('NGA', 'Malaria Prophylaxis', FALSE, 'Essential throughout the country', 'Take all precautions seriously'),
('NGA', 'Meningitis Vaccination', FALSE, 'Recommended during harmattan season (Dec-Feb)', 'Consider protection during dry season'),

-- Ghana
('GHA', 'Yellow Fever Vaccination', FALSE, 'Recommended, check latest requirements', 'Certificate may be requested on entry'),
('GHA', 'Malaria Prophylaxis', FALSE, 'Recommended for most areas', 'Especially important during rainy season'),
('GHA', 'Hepatitis A & B', FALSE, 'Recommended vaccinations', 'Available before travel'),

-- South Africa
('ZAF', 'Routine Vaccinations', FALSE, 'Ensure up-to-date with routine vaccines', 'Check CDC recommendations'),
('ZAF', 'Malaria Prophylaxis', FALSE, 'Recommended only for Kruger National Park area', 'Not needed for major cities or Cape Town'),
('ZAF', 'Hepatitis A', FALSE, 'Recommended but not mandatory', 'Consider for rural travel'),

-- Morocco
('MAR', 'Routine Vaccinations', FALSE, 'Ensure standard immunizations are current', 'No special requirements for most travelers'),
('MAR', 'Hepatitis A', FALSE, 'Recommended for some travelers', 'Consider for rural areas'),
('MAR', 'Malaria Prophylaxis', FALSE, 'Not typically required in urban areas', 'Only consider for southern regions'),

-- Ethiopia
('ETH', 'Yellow Fever Vaccination', FALSE, 'Recommended, check for your country of origin', 'May be required on exit to other countries'),
('ETH', 'Malaria Prophylaxis', FALSE, 'Recommended for lowland areas', 'Not needed for Addis Ababa, high plateaus'),
('ETH', 'Typhoid & Hepatitis A', FALSE, 'Recommended vaccinations', 'Practice food safety'),

-- Senegal
('SEN', 'Yellow Fever Vaccination', FALSE, 'Recommended if arriving from endemic regions', 'Certificate may be requested'),
('SEN', 'Malaria Prophylaxis', FALSE, 'Recommended except Dec-May in northern areas', 'Essential during rainy season'),
('SEN', 'Hepatitis A', FALSE, 'Recommended vaccination', 'Ensure safe food and water consumption')
ON CONFLICT DO NOTHING;

-- ============================================
-- INSERT DOS AND DON'TS
-- ============================================
INSERT INTO dos_and_donts (country_code, type, description) VALUES
-- Rwanda
('RWA', 'do', 'Do respect the culture and traditions; Rwandans are generally friendly and welcoming'),
('RWA', 'do', 'Do visit the Kigali Genocide Memorial to understand the countrys history'),
('RWA', 'do', 'Do use official taxis (ubercab or known services) for safety'),
('RWA', 'dont', 'Don''t photograph people without permission, especially in rural areas'),
('RWA', 'dont', 'Don''t make light of the genocide or display insensitivity'),
('RWA', 'dont', 'Don''t wander alone at night in Kigali'),

-- Kenya
('KEN', 'do', 'Do hire a guide for wildlife safaris'),
('KEN', 'do', 'Do keep documents in a safe place; copies in your phone'),
('KEN', 'do', 'Do use bottled water and avoid street food unless confident'),
('KEN', 'dont', 'Don''t travel alone on remote roads, especially at night'),
('KEN', 'dont', 'Don''t take chances with your personal security; avoid certain areas'),
('KEN', 'dont', 'Don''t leave valuables visible in vehicles or on the street'),

-- Tanzania
('TZA', 'do', 'Do climb Mount Kilimanjaro with a licensed guide'),
('TZA', 'do', 'Do respect local customs when visiting villages'),
('TZA', 'do', 'Do use registered tour operators for reliability'),
('TZA', 'dont', 'Don''t swim in Lake Victoria; bilharzia parasites are present'),
('TZA', 'dont', 'Don''t take photos of people without asking'),
('TZA', 'dont', 'Don''t associate yourself with political discussions as a foreigner'),

-- Uganda
('UGA', 'do', 'Do visit Gorilla trekking in Bwindi National Park'),
('UGA', 'do', 'Do support local communities by buying crafts and using local guides'),
('UGA', 'do', 'Do dress modestly, especially in rural areas'),
('UGA', 'dont', 'Don''t use tap water in Kampala; drink bottled or boiled water'),
('UGA', 'dont', 'Don''t show large amounts of cash or expensive items'),
('UGA', 'dont', 'Don''t refuse local hospitality; it can be seen as rude'),

-- Nigeria
('NGA', 'do', 'Do visit Lagos and experience vibrant African culture'),
('NGA', 'do', 'Do taste local delicacies like jollof rice and suya'),
('NGA', 'do', 'Do respect for elders is important in Nigerian culture'),
('NGA', 'dont', 'Don''t travel to northern Nigeria due to security concerns (check travel advisories)'),
('NGA', 'dont', 'Don''t discuss politics or religion with strangers'),
('NGA', 'dont', 'Don''t drink tap water; use bottled water instead'),

-- Ghana
('GHA', 'do', 'Do visit Cape Coast Castle and learn the history of slavery'),
('GHA', 'do', 'Do explore Accra''s vibrant arts and music scene'),
('GHA', 'do', 'Do be respectful in conversations; Ghanaians value courtesy'),
('GHA', 'dont', 'Don''t assume Ghana is safe everywhere; avoid certain neighborhoods at night'),
('GHA', 'dont', 'Don''t engage in drug-related activities (harsh penalties)'),
('GHA', 'dont', 'Don''t refuse offered drinks; it can be seen as disrespectful'),

-- South Africa
('ZAF', 'do', 'Do visit Kruger National Park for wildlife viewing'),
('ZAF', 'do', 'Do experience Cape Town''s culture and Table Mountain hikes'),
('ZAF', 'do', 'Do use Uber or official taxis for getting around cities'),
('ZAF', 'dont', 'Don''t travel alone, especially at night in Johannesburg or Cape Town'),
('ZAF', 'dont', 'Don''t leave valuables unattended in vehicles'),
('ZAF', 'dont', 'Don''t make assumptions about politics or racism; tensions still exist'),

-- Morocco
('MAR', 'do', 'Do explore the medinas and marketplaces'),
('MAR', 'do', 'Do respect Islamic customs, especially during Ramadan'),
('MAR', 'do', 'Do try traditional Moroccan tea and tagines'),
('MAR', 'dont', 'Don''t disrespect Islam or display affection publicly'),
('MAR', 'dont', 'Don''t refuse to remove shoes when entering homes or mosques'),
('MAR', 'dont', 'Don''t take alcohol into Ramadan gatherings'),

-- Ethiopia
('ETH', 'do', 'Do experience unique Ethiopian culture and coffee ceremony'),
('ETH', 'do', 'Do visit historical sites like Axum and Lalibela'),
('ETH', 'do', 'Do respect the Orthodox Christian traditions'),
('ETH', 'dont', 'Don''t take photos of people without permission'),
('ETH', 'dont', 'Don''t point at people; it''s considered rude'),
('ETH', 'dont', 'Don''t refuse food; refusing hospitality is insulting'),

-- Senegal
('SEN', 'do', 'Do experience Dakar''s music and arts festivals'),
('SEN', 'do', 'Do visit Gorée Island and its historical significance'),
('SEN', 'do', 'Do greet people respectfully before business conversations'),
('SEN', 'dont', 'Don''t eat with your left hand; the right hand is customary'),
('SEN', 'dont', 'Don''t photography without consent in villages'),
('SEN', 'dont', 'Don''t disrespect Islamic values; Islam is central to society')
ON CONFLICT DO NOTHING;

-- ============================================
-- INSERT GENERAL REQUIREMENTS
-- ============================================
INSERT INTO general_requirements (country_code, title, description, is_mandatory) VALUES
-- Rwanda
('RWA', 'Passport Validity', 'Passport must be valid for at least 6 months beyond your stay', TRUE),
('RWA', 'Return Ticket', 'Proof of onward or return travel may be requested', FALSE),
('RWA', 'Proof of Funds', 'Show evidence of sufficient funds for your stay (bank statements or credit cards)', FALSE),

-- Kenya
('KEN', 'Passport Validity', 'Passport must be valid for at least 6 months from date of entry', TRUE),
('KEN', 'Travel Insurance', 'Travel health insurance strongly recommended', FALSE),
('KEN', 'Yellow Fever Certificate', 'May be required if arriving from endemic countries', FALSE),

-- Tanzania
('TZA', 'Passport Validity', 'Must be valid for 6 months beyond intended stay', TRUE),
('TZA', 'Accommodation Confirmation', 'Proof of accommodation may be requested at immigration', FALSE),
('TZA', 'Emergency Contact', 'Provide emergency contact details upon arrival', FALSE),

-- Uganda
('UGA', 'Passport Validity', 'Minimum 6 months validity from date of entry', TRUE),
('UGA', 'Return Ticket', 'Proof of return travel may be requested', FALSE),
('UGA', 'Travel Insurance', 'Recommended but not mandatory', FALSE),

-- Nigeria
('NGA', 'Passport Validity', 'Must be valid for at least 6 months from date of arrival', TRUE),
('NGA', 'Yellow Fever Vaccination', 'International certificate is mandatory', TRUE),
('NGA', 'Bank Statement', 'Proof of financial means for stay', FALSE),

-- Ghana
('GHA', 'Passport Validity', 'Valid for at least 6 months beyond your stay', TRUE),
('GHA', 'Return Ticket', 'Proof of return or onward travel may be requested', FALSE),
('GHA', 'Accommodation Letter', 'Confirmation of hotel or accommodation details', FALSE),

-- South Africa
('ZAF', 'Passport Validity', 'Must be valid for at least 30 days beyond your intended stay', TRUE),
('ZAF', 'Return Ticket', 'Proof of onward travel may be required', FALSE),
('ZAF', 'Travel Insurance', 'Recommended for international travel', FALSE),

-- Morocco
('MAR', 'Passport Validity', 'Valid for at least 6 months from entry date', TRUE),
('MAR', 'Return Ticket', 'Proof of return or onward journey', FALSE),
('MAR', 'Accommodation', 'Confirmation of where you will stay', FALSE),

-- Ethiopia
('ETH', 'Passport Validity', 'At least 6 months validity from date of arrival', TRUE),
('ETH', 'Return Ticket', 'Proof of return travel', FALSE),
('ETH', 'Bank Statement', 'Evidence of sufficient funds for your stay', FALSE),

-- Senegal
('SEN', 'Passport Validity', 'Valid for 6 months beyond intended stay', TRUE),
('SEN', 'Return Ticket', 'Proof of return or onward travel', FALSE),
('SEN', 'Accommodation Proof', 'Confirmation of accommodation in Senegal', FALSE)
ON CONFLICT DO NOTHING;

-- ============================================
-- INSERT EMERGENCY CONTACTS
-- ============================================
INSERT INTO emergency_contacts (country_code, embassy_name, phone, email, address, website) VALUES
-- Rwanda
('RWA', 'Embassy of Rwanda in Kenya', '+254 20 4443 567', 'info@rwandaembassy.or.ke', 'Nairobi, Kenya', 'www.rwandaembassy.or.ke'),
('RWA', 'Kigali Emergency Services', '112', 'emergency@gov.rw', 'Kigali, Rwanda', ''),

-- Kenya
('KEN', 'British High Commission', '+254 20 2874 000', 'hc.nairobi@fco.gov.uk', 'Upper Hill, Nairobi', 'www.gov.uk/world/organisations'),
('KEN', 'US Embassy Nairobi', '+254 20 363 6000', 'acsnairobi@state.gov', 'UN Avenue, Nairobi', 'https://ke.usembassy.gov/'),

-- Tanzania
('TZA', 'British High Commission Dar es Salaam', '+255 22 211 0100', 'dhc@fco.gov.uk', 'Dar es Salaam', 'www.gov.uk/world/organisations'),
('TZA', 'Emergency Services', '112', 'police@gov.tz', 'Dar es Salaam', ''),

-- Uganda
('UGA', 'British High Commission Kampala', '+256 31 230 7000', 'khc@fco.gov.uk', 'Kampala, Uganda', 'www.gov.uk/world/organisations'),
('UGA', 'Embassy of USA', '+256 41 4259 791', 'acsKampala@state.gov', 'Kampala, Uganda', 'https://ug.usembassy.gov/'),

-- Nigeria
('NGA', 'US Embassy Lagos', '+234 1 4450 5900', 'lagerinfo@state.gov', 'Lagos, Nigeria', 'https://ng.usembassy.gov/'),
('NGA', 'British High Commission', '+234 9 2613 6000', 'bhc.abuja@fco.gov.uk', 'Abuja, Nigeria', 'www.gov.uk/world/organisations'),

-- Ghana
('GHA', 'US Embassy Accra', '+233 30 2741 000', 'acraacs@state.gov', 'Accra, Ghana', 'https://gh.usembassy.gov/'),
('GHA', 'British High Commission', '+233 30 2143 143', 'bhc.accra@fco.gov.uk', 'Accra, Ghana', 'www.gov.uk/world/organisations'),

-- South Africa
('ZAF', 'US Embassy Pretoria', '+27 12 431 4000', 'pretoriaacs@state.gov', 'Pretoria, South Africa', 'https://za.usembassy.gov/'),
('ZAF', 'British High Commission', '+27 12 421 7500', 'bhc.pretoria@fco.gov.uk', 'Pretoria, South Africa', 'www.gov.uk/world/organisations'),

-- Morocco
('MAR', 'US Embassy Rabat', '+212 5 3776 2265', 'rabatvisa@state.gov', 'Rabat, Morocco', 'https://ma.usembassy.gov/'),
('MAR', 'British Embassy Rabat', '+212 537 636 363', 'rabat@fco.gov.uk', 'Rabat, Morocco', 'www.gov.uk/world/organisations'),

-- Ethiopia
('ETH', 'US Embassy Addis Ababa', '+251 11 517 40 00', 'acsaddis@state.gov', 'Addis Ababa, Ethiopia', 'https://et.usembassy.gov/'),
('ETH', 'British Embassy', '+251 11 661 2354', 'Addis.Abuja@fco.gov.uk', 'Addis Ababa, Ethiopia', 'www.gov.uk/world/organisations'),

-- Senegal
('SEN', 'US Embassy Dakar', '+221 33 829 2000', 'dakar-acs@state.gov', 'Dakar, Senegal', 'https://sn.usembassy.gov/'),
('SEN', 'British High Commission', '+221 33 823 7392', 'dakar@fco.gov.uk', 'Dakar, Senegal', 'www.gov.uk/world/organisations')
ON CONFLICT DO NOTHING;

-- ============================================
-- VERIFICATION QUERY
-- ============================================
-- Uncomment below to verify data was inserted correctly
-- SELECT COUNT(*) as total_countries FROM countries;
-- SELECT COUNT(*) as total_visas FROM visa_requirements;
-- SELECT COUNT(*) as total_health FROM health_requirements;
-- SELECT COUNT(*) as total_dosdont FROM dos_and_donts;
-- SELECT COUNT(*) as total_general FROM general_requirements;
-- SELECT COUNT(*) as total_emergency FROM emergency_contacts;
-- SELECT COUNT(*) as total_subscribers FROM subscribers;
