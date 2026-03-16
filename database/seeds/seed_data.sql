-- ============================================================
-- Know Before You Go — Seed Data
-- Inserts base data for all 10 African countries.
-- Run after both migration files.
-- ============================================================


-- ── COUNTRIES ──────────────────────────────────────────────
INSERT INTO countries
  (country_code, country_name, region, capital, currency, language, population,
   power_voltage, timezone, tipping, climate, description, transportation, housing,
   flag, advisory_level, visa_status, cdc_notice_level, places)
VALUES
  ('RW', 'Rwanda', 'East Africa', 'Kigali', 'Rwandan Franc (RWF)', 'Kinyarwanda, English, French',
   '14 million', '230V / Type C & J', 'UTC+2', 'Not customary but appreciated',
   'Tropical highland', 'The land of a thousand hills — Rwanda is one of Africa''s most progressive nations, known for cleanliness, safety, and mountain gorilla trekking.',
   'Kigali has clean moto-taxis and taxis; intercity buses connect to Musanze, Rubavu, and Huye; car hire is available for national parks.',
   'Kigali offers midrange hotels and serviced apartments; lodges near Volcanoes and Lake Kivu book early in peak season.',
   '', 1, 'Visa on Arrival', 0,
   '[{"name":"Volcanoes National Park","description":"Home to endangered mountain gorillas","image":"https://images.unsplash.com/photo-1516026672322-bc52d61a55d5?w=600&q=75"},{"name":"Kigali Genocide Memorial","description":"A powerful tribute to the 1994 genocide","image":"https://images.unsplash.com/photo-1614859324967-b4e51c9d9c80?w=600&q=75"},{"name":"Lake Kivu","description":"Scenic lake shared with the DRC","image":"https://images.unsplash.com/photo-1580674285054-bed31e145f59?w=600&q=75"}]'),

  ('KE', 'Kenya', 'East Africa', 'Nairobi', 'Kenyan Shilling (KES)', 'Swahili, English',
   '55 million', '240V / Type G', 'UTC+3', 'Common in restaurants and hotels (10%)',
   'Varied — arid north, tropical coast', 'Kenya is the gateway to East African safari — from the Maasai Mara to pristine Indian Ocean beaches and the cosmopolitan capital Nairobi.',
   'Nairobi has ride-hailing and matatus; domestic flights connect Nairobi to Mombasa and Kisumu; safaris use tour vans or 4x4 vehicles.',
   'Options range from budget hostels to safari lodges and beach resorts; book the coast early in Dec-Mar and Jul-Oct.',
   '', 2, 'eVisa Required', 1,
   '[{"name":"Maasai Mara","description":"World-famous wildlife reserve and migration","image":"https://images.unsplash.com/photo-1547471080-7cc2caa01a7e?w=600&q=75"},{"name":"Diani Beach","description":"White sand beach on the Kenyan coast","image":"https://images.unsplash.com/photo-1507525428034-b723cf961d3e?w=600&q=75"},{"name":"Amboseli National Park","description":"Iconic views of Kilimanjaro with elephants","image":"https://images.unsplash.com/photo-1535941339077-2dd1c7963098?w=600&q=75"}]'),

  ('TZ', 'Tanzania', 'East Africa', 'Dodoma', 'Tanzanian Shilling (TZS)', 'Swahili, English',
   '63 million', '230V / Type D & G', 'UTC+3', 'Expected in tourist areas (10%)',
   'Tropical and semi-arid', 'Tanzania holds Africa''s highest peak, the largest wildlife reserve, and the magical islands of Zanzibar — a complete East African experience.',
   'Domestic flights link Dar es Salaam, Arusha, and Zanzibar; dala-dala minibuses run in cities; safari transfers are by 4x4.',
   'Hotels in Dar and Arusha, beach resorts in Zanzibar; park lodges are limited and should be booked early.',
   '', 1, 'Visa on Arrival', 1,
   '[{"name":"Serengeti National Park","description":"Endless plains and the great migration","image":"https://images.unsplash.com/photo-1516426122078-c23e76319801?w=600&q=75"},{"name":"Zanzibar","description":"Spice island with turquoise waters","image":"https://images.unsplash.com/photo-1559494007-9f5847c49d94?w=600&q=75"},{"name":"Mount Kilimanjaro","description":"Africa''s highest peak at 5,895m","image":"https://images.unsplash.com/photo-1589553416260-f586c8f1514f?w=600&q=75"}]'),

  ('UG', 'Uganda', 'East Africa', 'Kampala', 'Ugandan Shilling (UGX)', 'English, Swahili',
   '48 million', '240V / Type G', 'UTC+3', 'Not expected but appreciated',
   'Equatorial', 'The Pearl of Africa offers gorilla trekking, chimpanzee tracking, the source of the Nile, and some of the friendliest people on the continent.',
   'Kampala uses boda-bodas and minibus taxis; buses connect major towns; 4x4 transport is standard for parks.',
   'Guesthouses and midrange hotels in Kampala and Entebbe; safari lodges around Bwindi and Queen Elizabeth.',
   '', 1, 'eVisa Required', 1,
   '[{"name":"Bwindi Impenetrable Forest","description":"UNESCO site — home to half the world''s mountain gorillas","image":"https://images.unsplash.com/photo-1516026672322-bc52d61a55d5?w=600&q=75"},{"name":"Source of the Nile","description":"Jinja — where Lake Victoria meets the Nile","image":"https://images.unsplash.com/photo-1547471080-7cc2caa01a7e?w=600&q=75"},{"name":"Queen Elizabeth National Park","description":"Tree-climbing lions and hippo channels","image":"https://images.unsplash.com/photo-1535941339077-2dd1c7963098?w=600&q=75"}]'),

  ('NG', 'Nigeria', 'West Africa', 'Abuja', 'Nigerian Naira (NGN)', 'English',
   '220 million', '230V / Type D & G', 'UTC+1', 'Common in restaurants (10%)',
   'Tropical in south, arid in north', 'Africa''s most populous nation and largest economy — Nigeria pulses with Afrobeats, Nollywood, diverse cuisine, and an entrepreneurial energy unlike anywhere else.',
   'Ride-hailing in Lagos and Abuja; domestic flights connect major cities; public transport varies by city.',
   'Hotels and serviced apartments are common in Lagos and Abuja; book business districts in advance.',
   '', 2, 'Visa Required', 1,
   '[{"name":"Lagos","description":"Africa''s most dynamic megacity","image":"https://images.unsplash.com/photo-1580674285054-bed31e145f59?w=600&q=75"},{"name":"Yankari National Park","description":"Wildlife and warm springs","image":"https://images.unsplash.com/photo-1547471080-7cc2caa01a7e?w=600&q=75"},{"name":"Osun-Osogbo Sacred Grove","description":"UNESCO World Heritage site","image":"https://images.unsplash.com/photo-1516426122078-c23e76319801?w=600&q=75"}]'),

  ('GH', 'Ghana', 'West Africa', 'Accra', 'Ghanaian Cedi (GHS)', 'English',
   '33 million', '230V / Type D & G', 'UTC+0', 'Appreciated but not mandatory',
   'Tropical', 'Known as the gateway to West Africa — Ghana is celebrated for its warm hospitality, rich Ashanti heritage, Cape Coast history, and some of the continent''s best beaches.',
   'Taxis and ride-hailing in Accra; tro-tro minibuses for budget travel; domestic flights to Kumasi and Tamale.',
   'Accra has hotels and apartments; beach resorts near Cape Coast and Ada; book during festivals.',
   '', 1, 'Visa on Arrival', 0,
   '[{"name":"Cape Coast Castle","description":"UNESCO site — a powerful reminder of the slave trade","image":"https://images.unsplash.com/photo-1614859324967-b4e51c9d9c80?w=600&q=75"},{"name":"Kakum National Park","description":"Rainforest canopy walkway","image":"https://images.unsplash.com/photo-1516026672322-bc52d61a55d5?w=600&q=75"},{"name":"Labadi Beach","description":"Accra''s most popular urban beach","image":"https://images.unsplash.com/photo-1507525428034-b723cf961d3e?w=600&q=75"}]'),

  ('ZA', 'South Africa', 'Southern Africa', 'Pretoria', 'South African Rand (ZAR)', 'Zulu, Xhosa, Afrikaans, English + 8 others',
   '60 million', '230V / Type M', 'UTC+2', 'Expected in restaurants (10–15%)',
   'Varied — Mediterranean, semi-arid, subtropical', 'South Africa packs extraordinary diversity into one country — Cape Town''s mountains, Kruger''s wildlife, the Winelands, and a rich, complex history that shaped a rainbow nation.',
   'Domestic flights connect major cities; ride-hailing in metro areas; car hire is common for the Garden Route.',
   'Wide range from hostels to boutique hotels and safari lodges; peak season is Dec-Jan.',
   '', 2, 'Visa Free (many nationalities)', 0,
   '[{"name":"Kruger National Park","description":"One of Africa''s greatest wildlife experiences","image":"https://images.unsplash.com/photo-1547471080-7cc2caa01a7e?w=600&q=75"},{"name":"Cape Town","description":"Table Mountain, beaches, and world-class food","image":"https://images.unsplash.com/photo-1580060839134-75a5edca2e99?w=600&q=75"},{"name":"Garden Route","description":"Scenic coastal highway through forests and lakes","image":"https://images.unsplash.com/photo-1507525428034-b723cf961d3e?w=600&q=75"}]'),

  ('MA', 'Morocco', 'North Africa', 'Rabat', 'Moroccan Dirham (MAD)', 'Arabic, Amazigh, French',
   '37 million', '220V / Type C & E', 'UTC+1', 'Expected in restaurants and for guides (10–15%)',
   'Mediterranean coast, arid interior', 'Morocco is a sensory feast — ancient medinas, Saharan dunes, imperial cities, and the Atlas Mountains, all meeting point between Africa, Arabia, and Europe.',
   'Intercity trains (ONCF) and buses are reliable; taxis in cities; domestic flights to Marrakech and Agadir.',
   'Riads in medinas, modern hotels, and desert camps; book early for Marrakech and Fes.',
   '', 1, 'Visa Free (many nationalities)', 0,
   '[{"name":"Marrakech Medina","description":"UNESCO-listed ancient city and souks","image":"https://images.unsplash.com/photo-1548704606-571c77043fa3?w=600&q=75"},{"name":"Sahara Desert","description":"Erg Chebbi — camel treks and star-filled skies","image":"https://images.unsplash.com/photo-1509316785289-025f5b846b35?w=600&q=75"},{"name":"Chefchaouen","description":"The iconic blue city of the Rif Mountains","image":"https://images.unsplash.com/photo-1558618666-fcd25c85cd64?w=600&q=75"}]'),

  ('ET', 'Ethiopia', 'East Africa', 'Addis Ababa', 'Ethiopian Birr (ETB)', 'Amharic',
   '125 million', '220V / Type C & L', 'UTC+3', 'Not expected',
   'Varied — highland, semi-arid', 'Ethiopia is one of the oldest civilisations on Earth — home to the Ark of the Covenant, Lalibela''s rock-hewn churches, the ancient city of Axum, and the cradle of coffee.',
   'Domestic flights via Ethiopian Airlines; intercity buses and minibuses; ride-hailing is limited outside Addis.',
   'Hotels in Addis Ababa; lodges near Lalibela and the Simien Mountains; book for major holidays.',
   '', 2, 'eVisa Required', 1,
   '[{"name":"Lalibela","description":"Extraordinary rock-hewn churches carved from single stones","image":"https://images.unsplash.com/photo-1580060839134-75a5edca2e99?w=600&q=75"},{"name":"Simien Mountains","description":"UNESCO trekking destination with gelada baboons","image":"https://images.unsplash.com/photo-1589553416260-f586c8f1514f?w=600&q=75"},{"name":"Danakil Depression","description":"One of the most extreme landscapes on Earth","image":"https://images.unsplash.com/photo-1509316785289-025f5b846b35?w=600&q=75"}]'),

  ('SN', 'Senegal', 'West Africa', 'Dakar', 'West African CFA Franc (XOF)', 'French, Wolof',
   '17 million', '230V / Type C & D', 'UTC+0', 'Appreciated in restaurants (10%)',
   'Tropical, Sahelian', 'Senegal is West Africa''s most stable democracy and cultural capital — Dakar''s arts scene, the sacred Goree Island, pink Lake Retba, and Casamance''s lush landscapes.',
   'Taxis and ride-hailing in Dakar; sept-place shared taxis and buses to regions; ferry to Goree Island.',
   'Hotels in Dakar and beach resorts in Saly; guesthouses in Casamance; book in the dry season.',
   '', 1, 'Visa Free (many nationalities)', 0,
   '[{"name":"Goree Island","description":"UNESCO island — historic centre of the Atlantic slave trade","image":"https://images.unsplash.com/photo-1614859324967-b4e51c9d9c80?w=600&q=75"},{"name":"Lake Retba","description":"The Pink Lake — unique saline lake near Dakar","image":"https://images.unsplash.com/photo-1580674285054-bed31e145f59?w=600&q=75"},{"name":"Casamance","description":"Lush southern region with mangroves and beaches","image":"https://images.unsplash.com/photo-1507525428034-b723cf961d3e?w=600&q=75"}]')
ON CONFLICT (country_code) DO NOTHING;


-- ── VISA REQUIREMENTS ──────────────────────────────────────
INSERT INTO visa_requirements
  (country_code, country_name, visa_status, visa_free_days, visa_title, visa_info)
VALUES
  ('RW', 'Rwanda',       'Visa on Arrival', 30, 'Visa on Arrival',
   'Citizens of most countries can obtain a 30-day visa on arrival at Kigali International Airport. East African Community members enter visa-free. Rwanda also accepts an eVisa applied online before travel.'),
  ('KE', 'Kenya',        'eVisa Required', 90, 'Electronic Travel Authorisation',
   'Kenya replaced the visa on arrival with a mandatory Electronic Travel Authorisation (ETA) in 2024. Apply online at etakenya.go.ke before your trip. Processing typically takes 72 hours. Fee: USD 30.'),
  ('TZ', 'Tanzania',     'Visa on Arrival', 90, 'Visa on Arrival',
   'Single-entry tourist visas are available on arrival at major ports of entry. An eVisa is also available in advance at eservices.immigration.go.tz. Fee: USD 50 for most nationalities.'),
  ('UG', 'Uganda',       'eVisa Required', 90, 'East Africa Tourist Visa',
   'Uganda requires an eVisa applied for in advance at visas.immigration.go.ug. The East Africa Tourist Visa allows multiple-entry travel to Kenya, Uganda, and Rwanda for USD 100.'),
  ('NG', 'Nigeria',      'Visa Required', 30, 'Visa Required',
   'Most visitors require a visa in advance from a Nigerian embassy or consulate. A visa on arrival facility exists for some nationalities at Lagos and Abuja airports. Apply at portal.immigration.gov.ng.'),
  ('GH', 'Ghana',        'Visa on Arrival', 60, 'Visa on Arrival',
   'Ghana offers visa on arrival for citizens of many countries. eVisa applications are available at ghana.embassyapplication.com. ECOWAS citizens enter visa-free. Fee: USD 150 for most.'),
  ('ZA', 'South Africa', 'Visa Free', 90, 'Visa Free Entry',
   'Citizens of most European, North American, and many African countries can visit South Africa visa-free for up to 90 days. Your passport must be valid for at least 30 days beyond your departure date.'),
  ('MA', 'Morocco',      'Visa Free', 90, 'Visa Free Entry',
   'Citizens of most countries including EU, USA, UK, and many African nations can enter Morocco visa-free for up to 90 days. No prior application required — your passport is stamped on arrival.'),
  ('ET', 'Ethiopia',     'eVisa Required', 30, 'eVisa Required',
   'Ethiopia requires an eVisa for most nationalities. Apply at evisa.gov.et at least 5 business days before travel. Single-entry eVisa costs USD 52. Visa on arrival is available at Addis Ababa Bole Airport for select nationalities.'),
  ('SN', 'Senegal',      'Visa Free', 90, 'Visa Free Entry',
   'Most nationalities including EU, USA, UK, and ECOWAS countries enter Senegal visa-free for up to 90 days. Extensions can be obtained at the Dakar immigration office.')
ON CONFLICT (country_code) DO NOTHING;


-- ── EMERGENCY CONTACTS ─────────────────────────────────────
INSERT INTO emergency_contacts
  (country_code, country_name, police_number, ambulance_number, fire_number, general_emergency, tourist_police)
VALUES
  ('RW', 'Rwanda',       '112', '912', '111', '112', '3512'),
  ('KE', 'Kenya',        '999', '999', '999', '112', '0800 723 715'),
  ('TZ', 'Tanzania',     '112', '112', '114', '112', '0800 110 003'),
  ('UG', 'Uganda',       '999', '999', '999', '112', '0800 199 699'),
  ('NG', 'Nigeria',      '199', '199', '199', '112', '0800 POLICE'),
  ('GH', 'Ghana',        '191', '193', '192', '112', '191'),
  ('ZA', 'South Africa', '10111', '10177', '10177', '112', '10111'),
  ('MA', 'Morocco',      '19', '15', '15', '112', '0537 20 13 00'),
  ('ET', 'Ethiopia',     '991', '907', '939', '112', '011 551 0666'),
  ('SN', 'Senegal',      '17', '15', '18', '112', '33 869 25 00')
ON CONFLICT (country_code) DO NOTHING;


-- ── CULTURAL GUIDELINES ────────────────────────────────────
INSERT INTO cultural_guidelines
  (country_code, country_name, dos, donts, dress_code, legal_warnings)
VALUES
  ('RW', 'Rwanda',
   ARRAY[
     'Carry your passport or ID at all times',
     'Remove shoes before entering homes',
     'Use both hands when giving or receiving items',
     'Participate in Umuganda (community service) if present on the last Saturday of each month',
     'Ask permission before photographing people'
   ],
   ARRAY[
     'Do not bring or use plastic bags - they are banned',
     'Do not litter - Rwanda takes cleanliness very seriously',
     'Avoid photographing government buildings and military installations',
     'Do not smoke in public spaces',
     'Avoid discussing the 1994 genocide casually'
   ],
   'Smart casual is appropriate in cities. Cover shoulders and knees when visiting churches.',
   '[{"title":"Plastic Bag Ban","description":"Importing, selling, or using plastic bags is illegal. Customs will confiscate them on arrival."},{"title":"Genocide Denial","description":"Denying, minimising, or trivialising the 1994 genocide against the Tutsi is a criminal offence."}]'),

  ('KE', 'Kenya',
   ARRAY[
     'Greet elders and those in authority first',
     'Bargain respectfully in markets',
     'Carry a copy of your passport at all times',
     'Tip safari guides and lodge staff',
     'Use your right hand for eating and handshakes'
   ],
   ARRAY[
     'Do not photograph police or military without permission',
     'Avoid public displays of affection',
     'Do not use your left hand to give or receive items',
     'Avoid walking alone after dark in Nairobi CBD',
     'Do not buy or sell wildlife products'
   ],
   'Modest dress is appreciated, especially in coastal areas. Remove shoes before entering mosques.',
   '[{"title":"Wildlife Trade","description":"Buying, selling, or possessing wildlife products including ivory is a serious criminal offence with heavy penalties."},{"title":"Drug Offences","description":"Drug offences carry severe penalties including lengthy prison sentences."}]'),

  ('ZA', 'South Africa',
   ARRAY[
     'Be aware of your surroundings, especially at night',
     'Use reputable metered taxis or ride-hailing apps',
     'Tip service staff 10-15%',
     'Lock your car and do not leave valuables visible',
     'Carry a photocopy of your passport'
   ],
   ARRAY[
     'Do not display expensive jewellery or electronics publicly',
     'Avoid walking alone at night in city centres',
     'Do not ignore load-shedding schedules - plan accordingly',
     'Do not underestimate driving distances',
     'Avoid hitchhiking'
   ],
   'No strict dress code, but modest dress is appropriate for religious sites.',
   '[{"title":"Xenophobia","description":"Be aware of occasional tensions between locals and foreign nationals in some areas. Exercise caution."},{"title":"Water Safety","description":"Tap water is safe in major cities but not in rural areas. Confirm before drinking."}]'),

  ('MA', 'Morocco',
   ARRAY[
     'Learn a few words of Arabic or French - it is appreciated',
     'Bargain in souks - it is expected and part of the culture',
     'Accept mint tea when offered - declining can be considered rude',
     'Dress modestly, especially in rural areas and medinas',
     'Remove shoes before entering mosques'
   ],
   ARRAY[
     'Do not photograph people without asking permission first',
     'Non-Muslims may not enter the interior of most mosques',
     'Avoid public displays of affection',
     'Do not drink alcohol in public or in non-licensed areas',
     'Avoid eating, drinking, or smoking in public during Ramadan'
   ],
   'Modest clothing is expected in medinas and rural areas. Women should cover shoulders and knees. Men should avoid shorts in traditional areas.',
   '[{"title":"Same-Sex Relations","description":"Same-sex sexual activity is illegal in Morocco and can result in prison sentences of up to 3 years."},{"title":"Drug Offences","description":"Cannabis possession, despite its visible presence in some areas, is illegal and can result in prison sentences."}]')
ON CONFLICT (country_code) DO NOTHING;


-- ── HEALTH ADVISORIES ──────────────────────────────────────
INSERT INTO health_advisories
  (country_code, country_name, required_vaccines, recommended_vaccines, health_risks, active_outbreaks, medication_rules, cdc_notice_level)
VALUES
  ('RW', 'Rwanda',
   ARRAY['Yellow Fever (if arriving from endemic country)'],
   ARRAY['Hepatitis A', 'Typhoid', 'Malaria prophylaxis', 'Rabies (for long-term stays)', 'Meningitis'],
   ARRAY['Malaria', 'Cholera', 'Typhoid'],
   ARRAY[]::TEXT[],
   'Malaria prophylaxis is strongly recommended for all travellers. Bring adequate supplies of any prescription medication as availability may be limited.',
   1),

  ('KE', 'Kenya',
   ARRAY['Yellow Fever (if arriving from endemic country)'],
   ARRAY['Hepatitis A', 'Typhoid', 'Malaria prophylaxis', 'Rabies', 'Meningitis', 'Cholera'],
   ARRAY['Malaria', 'Dengue', 'Cholera'],
   ARRAY[]::TEXT[],
   'Malaria risk is high in coastal and low-altitude areas. Prescription antimalarials are recommended. Altitude sickness may affect travellers to highland areas above 2500m.',
   1),

  ('ZA', 'South Africa',
   ARRAY[]::TEXT[],
   ARRAY['Hepatitis A', 'Typhoid', 'Malaria prophylaxis (Limpopo & KwaZulu-Natal)', 'Rabies'],
   ARRAY['HIV', 'Malaria (north)', 'Tuberculosis'],
   ARRAY[]::TEXT[],
   'Malaria risk exists in the Limpopo, Mpumalanga, and KwaZulu-Natal provinces near the borders. Prophylaxis is recommended if visiting Kruger National Park. No risk in Cape Town or Johannesburg.',
   0),

  ('MA', 'Morocco',
   ARRAY[]::TEXT[],
   ARRAY['Hepatitis A', 'Typhoid', 'Rabies', 'Hepatitis B'],
   ARRAY['Hepatitis A', 'Typhoid', 'Rabies'],
   ARRAY[]::TEXT[],
   'No malaria risk. Tap water is generally safe in cities but travellers with sensitive stomachs should stick to bottled water. Food safety standards vary widely.',
   0),

  ('TZ', 'Tanzania',
   ARRAY['Yellow Fever (if arriving from endemic country)'],
   ARRAY['Hepatitis A', 'Typhoid', 'Malaria prophylaxis', 'Rabies', 'Meningitis', 'Cholera'],
   ARRAY['Malaria', 'Typhoid', 'Cholera'],
   ARRAY[]::TEXT[],
   'Malaria is prevalent throughout Tanzania including Zanzibar. Prophylaxis is strongly recommended. Avoid swimming in Lake Victoria and other freshwater bodies due to schistosomiasis risk.',
   1),

  ('UG', 'Uganda',
   ARRAY['Yellow Fever required'],
   ARRAY['Hepatitis A', 'Typhoid', 'Malaria prophylaxis', 'Rabies', 'Meningitis', 'Cholera'],
   ARRAY['Malaria', 'Cholera', 'Ebola (monitoring)'],
   ARRAY[]::TEXT[],
   'Yellow Fever vaccination is mandatory for all travellers. Malaria prophylaxis is essential. Monitor travel advisories for Ebola outbreaks in border regions with DRC.',
   1),

  ('NG', 'Nigeria',
   ARRAY['Yellow Fever required'],
   ARRAY['Hepatitis A', 'Typhoid', 'Malaria prophylaxis', 'Meningitis', 'Polio booster', 'Cholera'],
   ARRAY['Malaria', 'Lassa Fever', 'Cholera'],
   ARRAY[]::TEXT[],
   'Yellow Fever vaccination certificate is required for entry. Malaria is prevalent throughout the country. Lassa Fever is endemic in some areas. Avoid drinking tap water.',
   2),

  ('GH', 'Ghana',
   ARRAY['Yellow Fever required'],
   ARRAY['Hepatitis A', 'Typhoid', 'Malaria prophylaxis', 'Meningitis', 'Rabies', 'Cholera'],
   ARRAY['Malaria', 'Typhoid', 'Hepatitis A'],
   ARRAY[]::TEXT[],
   'Yellow Fever vaccination is mandatory. Malaria is prevalent across the country - prophylaxis is essential. Avoid tap water; use bottled or treated water.',
   1),

  ('ET', 'Ethiopia',
   ARRAY['Yellow Fever (if arriving from endemic country)'],
   ARRAY['Hepatitis A', 'Typhoid', 'Malaria prophylaxis', 'Rabies', 'Meningitis', 'Cholera'],
   ARRAY['Malaria (lowlands)', 'Typhoid', 'Cholera'],
   ARRAY[]::TEXT[],
   'Malaria exists at altitudes below 2000m. Addis Ababa at 2400m is malaria-free. Altitude sickness may affect travellers arriving in Addis Ababa - allow 2-3 days to acclimatise before trekking.',
   1),

  ('SN', 'Senegal',
   ARRAY['Yellow Fever required'],
   ARRAY['Hepatitis A', 'Typhoid', 'Malaria prophylaxis', 'Meningitis', 'Rabies', 'Cholera'],
   ARRAY['Malaria', 'Dengue', 'Cholera'],
   ARRAY[]::TEXT[],
   'Yellow Fever vaccination certificate is required for entry. Malaria prophylaxis is essential for all travellers. Dakar has lower risk than rural areas but prophylaxis is still recommended.',
   1)
ON CONFLICT (country_code) DO NOTHING; 