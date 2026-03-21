USE ai_db;

-- -- COUNTRIES 
INSERT IGNORE INTO countries
  (country_code, country_name, region, capital, currency, language, population,
   power_voltage, timezone, tipping, climate, description, transportation, housing,
   flag_url, advisory_level, visa_status, cdc_notice_level)
VALUES
  ('RW', 'Rwanda', 'East Africa', 'Kigali', 'Rwandan Franc (RWF)', 'Kinyarwanda, English, French',
   '14 million', '230V / Type C & J', 'UTC+2', 'Not customary but appreciated',
   'Tropical highland', 'The land of a thousand hills – Rwanda is one of Africa''s most progressive nations, known for cleanliness, safety, and mountain gorilla trekking.',
   'International: Kigali Airport (KGL) — RwandAir, Kenya Airways, Ethiopian Airlines. Road: Moto-taxis (RWF 500–1500) are the main urban transport. Intercity: Horizon Express, Ritco to Musanze, Rubavu, Huye. Apps: Yego Moto, Move app. Rail: None.',
   'Luxury (USD 300–1500+/night): Singita Kwitonda Lodge, Bisate Lodge, Kigali Marriott. Mid-Range (USD 80–200/night): Radisson Blu, Hotel des Mille Collines. Budget (USD 20–50/night): Dream House Hostel, Discover Rwanda Youth Hostel. Book early for gorilla season (Jun–Sep, Dec–Feb).',
   '', 1, 'Visa on Arrival', 0),

  ('KE', 'Kenya', 'East Africa', 'Nairobi', 'Kenyan Shilling (KES)', 'Swahili, English',
   '55 million', '240V / Type G', 'UTC+3', 'Common in restaurants and hotels (10%)',
   'Varied – arid north, tropical coast', 'Kenya is the gateway to East African safari – from the Maasai Mara to pristine Indian Ocean beaches and the cosmopolitan capital Nairobi.',
   'International: JKIA Nairobi (NBO), Moi Airport Mombasa (MBA). Domestic: Safarilink, AirKenya to Mara, Amboseli, Lamu. Road: Matatus and boda-bodas for short trips. Intercity: Easy Coach, Modern Coast, Mash Poa. Apps: Uber, Bolt. Rail: SGR Madaraka Express Nairobi–Mombasa (4.5 hrs).',
   'Luxury (USD 300–2000+/night): Giraffe Manor, Angama Mara, Ol Pejeta Bush Camp. Mid-Range (USD 80–250/night): Nairobi Serena, Sarova Stanley, Leopard Beach Resort. Budget (USD 15–50/night): Milimani Backpackers, Diani Backpackers. Book Mara lodges 6–12 months ahead for the Great Migration (Jul–Oct).',
   '', 2, 'eVisa Required', 1),

  ('TZ', 'Tanzania', 'East Africa', 'Dodoma', 'Tanzanian Shilling (TZS)', 'Swahili, English',
   '63 million', '230V / Type D & G', 'UTC+3', 'Expected in tourist areas (10%)',
   'Tropical and semi-arid', 'Tanzania holds Africa''s highest peak, the largest wildlife reserve, and the magical islands of Zanzibar – a complete East African experience.',
   'International: Julius Nyerere Airport Dar (DAR), Kilimanjaro (JRO), Zanzibar (ZNZ). Domestic: Precision Air, Coastal Aviation to Serengeti, Zanzibar. Road: Dala-dalas in cities; 4WD for parks. Intercity: Dar Express, Scandinavian Express. Apps: Bolt in Dar and Zanzibar. Rail: TAZARA to Zambia.',
   'Luxury (USD 400–2500+/night): Four Seasons Serengeti, &Beyond Ngorongoro, The Residence Zanzibar. Mid-Range (USD 100–300/night): Serengeti Sopa Lodge, Zanzibar Serena Inn. Budget (USD 20–60/night): Jambo Inn Dar, Stone Town Cafe & Bed. Book Serengeti 6–12 months ahead (Jun–Oct).',
   '', 1, 'Visa on Arrival', 1),

  ('UG', 'Uganda', 'East Africa', 'Kampala', 'Ugandan Shilling (UGX)', 'English, Swahili',
   '48 million', '240V / Type G', 'UTC+3', 'Not expected but appreciated',
   'Equatorial', 'The Pearl of Africa offers gorilla trekking, chimpanzee tracking, the source of the Nile, and some of the friendliest people on the continent.',
   'International: Entebbe Airport (EBB), 40km from Kampala. No domestic flights. Road: Boda-bodas for urban trips; 4WD essential for Bwindi and Murchison Falls. Intercity: Post Bus, Gateway Bus. Apps: Bolt, Uber, SafeBoda in Kampala. Rail: None.',
   'Luxury (USD 250–1000+/night): Bwindi Lodge, Sanctuary Gorilla Forest Camp, Chobe Safari Lodge. Mid-Range (USD 70–200/night): Protea Hotel Kampala, Serena Hotel Kampala. Budget (USD 15–40/night): Red Chilli Hideaway, Bwindi Backpackers. Book gorilla permits first, then accommodation around them.',
   '', 1, 'eVisa Required', 1),

  ('NG', 'Nigeria', 'West Africa', 'Abuja', 'Nigerian Naira (NGN)', 'English',
   '220 million', '230V / Type D & G', 'UTC+1', 'Common in restaurants (10%)',
   'Tropical in south, arid in north', 'Africa''s most populous nation and largest economy � Nigeria pulses with Afrobeats, Nollywood, diverse cuisine, and an entrepreneurial energy unlike anywhere else.',
   'International: Lagos (LOS), Abuja (ABV). Domestic: Air Peace, Arik Air to Port Harcourt, Kano — flying between cities is strongly recommended. Road: Danfo buses in Lagos; Keke napep in most cities. Intercity: ABC Transport, GUO (daytime only). Apps: Uber, Bolt, InDrive. Rail: Abuja–Kaduna and Lagos–Ibadan lines operational.',
   'Luxury (USD 200–600+/night): Eko Hotel Lagos, Transcorp Hilton Abuja, Radisson Blu Lagos. Mid-Range (USD 80–200/night): BON Hotel Abuja, Lagos Continental Hotel. Budget (USD 30–70/night): Bettacare Hotel Abuja. Book hotels with confirmed security. Serviced apartments are popular for stays of 1 week+.',
   '', 2, 'Visa Required', 1),

  ('GH', 'Ghana', 'West Africa', 'Accra', 'Ghanaian Cedi (GHS)', 'English',
   '33 million', '230V / Type D & G', 'UTC+0', 'Appreciated but not mandatory',
   'Tropical', 'Known as the gateway to West Africa – Ghana is celebrated for its warm hospitality, rich Ashanti heritage, Cape Coast history, and some of the continent''s best beaches.',
   'International: Kotoka Airport Accra (ACC). Domestic: Africa World Airlines to Tamale, Kumasi. Road: Trotros (shared minibuses) throughout; metered taxis in Accra. Intercity: VIP and STC buses — Accra to Kumasi 3–4 hrs, Cape Coast 2–3 hrs. Apps: Uber, Bolt, Yango. Rail: None.',
   'Luxury (USD 200–600+/night): Kempinski Gold Coast Accra, Labadi Beach Hotel. Mid-Range (USD 70–200/night): Novotel Accra, Coconut Grove Beach Resort. Budget (USD 20–50/night): Accra Backpackers, Hans Cottage Botel Cape Coast. Book well ahead during December (Detty December festival).',
   '', 1, 'Visa on Arrival', 0),

  ('ZA', 'South Africa', 'Southern Africa', 'Pretoria', 'South African Rand (ZAR)', 'Zulu, Xhosa, Afrikaans, English + 8 others',
   '60 million', '230V / Type M', 'UTC+2', 'Expected in restaurants (10�15%)',
   'Varied – Mediterranean, semi-arid, subtropical', 'South Africa packs extraordinary diversity into one country – Cape Town''s mountains, Kruger''s wildlife, the Winelands, and a rich, complex history that shaped a rainbow nation.',
   'International: OR Tambo Johannesburg (JNB), Cape Town (CPT), King Shaka Durban (DUR). Domestic: FlySafair, Kulula, Lift — extensive network. Road: Self-drive is practical; car hire widely available. Intercity: Intercape, Greyhound, FlixBus. Apps: Uber excellent in all major cities. Rail: Gautrain connects JNB, Pretoria, Sandton and OR Tambo.',
   'Luxury (USD 300–3000+/night): Sabi Sabi Earth Lodge, The Silo Cape Town, Royal Malewane. Mid-Range (USD 70–200/night): The Vineyard Cape Town, Protea Hotel Kruger Gate. Budget (USD 15–50/night): The Backpack Cape Town, Kruger SANParks Restcamps. Kruger restcamps book out a year ahead for school holidays.',
   '', 2, 'Visa Free (many nationalities)', 0),

  ('MA', 'Morocco', 'North Africa', 'Rabat', 'Moroccan Dirham (MAD)', 'Arabic, Amazigh, French',
   '37 million', '220V / Type C & E', 'UTC+1', 'Expected in restaurants and for guides (10�15%)',
   'Mediterranean coast, arid interior', 'Morocco is a sensory feast – ancient medinas, Saharan dunes, imperial cities, and the Atlas Mountains, all meeting point between Africa, Arabia, and Europe.',
   'International: Casablanca (CMN), Marrakech (RAK), Fes (FEZ), Agadir (AGA). Domestic: Royal Air Maroc, Air Arabia Maroc. Road: Grands Taxis for intercity; Petits Taxis in cities. Intercity: CTM and Supratours buses to all major cities. Apps: inDrive, Heetch in Casablanca and Marrakech. Rail: ONCF trains — Al Boraq high-speed Casablanca–Tangier (320km/h).',
   'Luxury (USD 250–2000+/night): La Mamounia Marrakech, Royal Mansour, Amanjena. Mid-Range (USD 60–180/night): Riad Yasmine Marrakech, Palais Faraj Fes, Sofitel Agadir. Budget (USD 15–40/night): Riad Dar Zitoun, Hostel Fes, Surf Berbere Taghazout. Staying in a traditional riad inside the medina is highly recommended.',
   '', 1, 'Visa Free (many nationalities)', 0),

  ('ET', 'Ethiopia', 'East Africa', 'Addis Ababa', 'Ethiopian Birr (ETB)', 'Amharic',
   '125 million', '220V / Type C & L', 'UTC+3', 'Not expected',
   'Varied – highland, semi-arid', 'Ethiopia is one of the oldest civilisations on Earth – home to the Ark of the Covenant, Lalibela''s rock-hewn churches, the ancient city of Axum, and the cradle of coffee.',
   'International: Addis Ababa Bole (ADD) — Ethiopian Airlines main hub. Domestic: Ethiopian Airlines to Lalibela, Gondar, Axum — flying strongly recommended over road. Road: Minibuses in Addis; hire a vehicle with driver for tourist routes. Intercity: Selam Bus, Sky Bus to Hawassa, Bahir Dar, Gondar. Apps: Ride app, ZayRide. Rail: Addis–Djibouti electric railway; Addis LRT within city.',
   'Luxury (USD 180–500+/night): Sheraton Addis, Hyatt Regency Addis. Mid-Range (USD 60–180/night): Radisson Blu Addis, Lalibela Dream, Goha Hotel Gondar. Budget (USD 15–40/night): Bete Abraham Guest House Lalibela, Itegue Taitu Hotel Addis. Lalibela books out fast — reserve 3–6 months ahead, especially for Ethiopian Christmas (Jan 7).',
   '', 2, 'eVisa Required', 1),

  ('SN', 'Senegal', 'West Africa', 'Dakar', 'West African CFA Franc (XOF)', 'French, Wolof',
   '17 million', '230V / Type C & D', 'UTC+0', 'Appreciated in restaurants (10%)',
   'Tropical, Sahelian', 'Senegal is West Africa''s most stable democracy and cultural capital – Dakar''s arts scene, the sacred Goree Island, pink Lake Retba, and Casamance''s lush landscapes.',
   'International: Blaise Diagne Airport Dakar (DSS), 45km from city. Domestic: Air Senegal to Ziguinchor, Saint-Louis. Road: Car rapides and Dakar Dem Dikk buses; Sept-Place shared taxis for intercity. Apps: Yango, inDrive in Dakar. Rail: TER connects Dakar to AIBD airport — fast and affordable.',
   'Luxury (USD 180–500+/night): Radisson Blu Dakar Sea Plaza, King Fahd Palace. Mid-Range (USD 60–180/night): Terrou-Bi Hotel, Hotel des Almadies, La Palmeraie Saint-Louis. Budget (USD 15–45/night): Auberge Keur Diame, Campement Villageois eco-lodges. Book ahead during Magal de Touba and major Islamic holidays.',
   '', 1, 'Visa Free (many nationalities)', 0);

-- The rest of the seed data (places, visa_requirements, emergency_contacts,
-- cultural_guidelines, health_advisories and related detail tables)
-- should be appended below. If you want, I can paste the full remaining block
-- in a second step to keep this manageable.

-- -- PLACES ------------------------------------------------
INSERT IGNORE INTO places (country_id, name, description, image_url)
SELECT c.id, 'Volcanoes National Park', 'Home to endangered mountain gorillas', 'https://images.unsplash.com/photo-1516026672322-bc52d61a55d5?w=600&q=75'
FROM countries c WHERE c.country_code = 'RW';

INSERT IGNORE INTO places (country_id, name, description, image_url)
SELECT c.id, 'Kigali Genocide Memorial', 'A powerful tribute to the 1994 genocide', 'https://images.unsplash.com/photo-1614859324967-b4e51c9d9c80?w=600&q=75'
FROM countries c WHERE c.country_code = 'RW';

INSERT IGNORE INTO places (country_id, name, description, image_url)
SELECT c.id, 'Lake Kivu', 'Scenic lake shared with the DRC', 'https://images.unsplash.com/photo-1580674285054-bed31e145f59?w=600&q=75'
FROM countries c WHERE c.country_code = 'RW';

INSERT IGNORE INTO places (country_id, name, description, image_url)
SELECT c.id, 'Maasai Mara', 'World-famous wildlife reserve and migration', 'https://images.unsplash.com/photo-1547471080-7cc2caa01a7e?w=600&q=75'
FROM countries c WHERE c.country_code = 'KE';

INSERT IGNORE INTO places (country_id, name, description, image_url)
SELECT c.id, 'Diani Beach', 'White sand beach on the Kenyan coast', 'https://images.unsplash.com/photo-1507525428034-b723cf961d3e?w=600&q=75'
FROM countries c WHERE c.country_code = 'KE';

INSERT IGNORE INTO places (country_id, name, description, image_url)
SELECT c.id, 'Amboseli National Park', 'Iconic views of Kilimanjaro with elephants', 'https://images.unsplash.com/photo-1535941339077-2dd1c7963098?w=600&q=75'
FROM countries c WHERE c.country_code = 'KE';

INSERT IGNORE INTO places (country_id, name, description, image_url)
SELECT c.id, 'Serengeti National Park', 'Endless plains and the great migration', 'https://images.unsplash.com/photo-1516426122078-c23e76319801?w=600&q=75'
FROM countries c WHERE c.country_code = 'TZ';

INSERT IGNORE INTO places (country_id, name, description, image_url)
SELECT c.id, 'Zanzibar', 'Spice island with turquoise waters', 'https://images.unsplash.com/photo-1559494007-9f5847c49d94?w=600&q=75'
FROM countries c WHERE c.country_code = 'TZ';

INSERT IGNORE INTO places (country_id, name, description, image_url)
SELECT c.id, 'Mount Kilimanjaro', 'Africa''s highest peak at 5,895m', 'https://images.unsplash.com/photo-1589553416260-f586c8f1514f?w=600&q=75'
FROM countries c WHERE c.country_code = 'TZ';

INSERT IGNORE INTO places (country_id, name, description, image_url)
SELECT c.id, 'Bwindi Impenetrable Forest', 'UNESCO site – home to half the world''s mountain gorillas', 'https://images.unsplash.com/photo-1516026672322-bc52d61a55d5?w=600&q=75'
FROM countries c WHERE c.country_code = 'UG';

INSERT IGNORE INTO places (country_id, name, description, image_url)
SELECT c.id, 'Source of the Nile', 'Jinja � where Lake Victoria meets the Nile', 'https://images.unsplash.com/photo-1547471080-7cc2caa01a7e?w=600&q=75'
FROM countries c WHERE c.country_code = 'UG';

INSERT IGNORE INTO places (country_id, name, description, image_url)
SELECT c.id, 'Queen Elizabeth National Park', 'Tree-climbing lions and hippo channels', 'https://images.unsplash.com/photo-1535941339077-2dd1c7963098?w=600&q=75'
FROM countries c WHERE c.country_code = 'UG';

INSERT IGNORE INTO places (country_id, name, description, image_url)
SELECT c.id, 'Lagos', 'Africa''s most dynamic megacity', 'https://images.unsplash.com/photo-1580674285054-bed31e145f59?w=600&q=75'
FROM countries c WHERE c.country_code = 'NG';

INSERT IGNORE INTO places (country_id, name, description, image_url)
SELECT c.id, 'Yankari National Park', 'Wildlife and warm springs', 'https://images.unsplash.com/photo-1547471080-7cc2caa01a7e?w=600&q=75'
FROM countries c WHERE c.country_code = 'NG';

INSERT IGNORE INTO places (country_id, name, description, image_url)
SELECT c.id, 'Osun-Osogbo Sacred Grove', 'UNESCO World Heritage site', 'https://images.unsplash.com/photo-1516426122078-c23e76319801?w=600&q=75'
FROM countries c WHERE c.country_code = 'NG';

INSERT IGNORE INTO places (country_id, name, description, image_url)
SELECT c.id, 'Cape Coast Castle', 'UNESCO site – a powerful reminder of the slave trade', 'https://images.unsplash.com/photo-1614859324967-b4e51c9d9c80?w=600&q=75'
FROM countries c WHERE c.country_code = 'GH';

INSERT IGNORE INTO places (country_id, name, description, image_url)
SELECT c.id, 'Kakum National Park', 'Rainforest canopy walkway', 'https://images.unsplash.com/photo-1516026672322-bc52d61a55d5?w=600&q=75'
FROM countries c WHERE c.country_code = 'GH';

INSERT IGNORE INTO places (country_id, name, description, image_url)
SELECT c.id, 'Labadi Beach', 'Accra''s most popular urban beach', 'https://images.unsplash.com/photo-1507525428034-b723cf961d3e?w=600&q=75'
FROM countries c WHERE c.country_code = 'GH';

INSERT IGNORE INTO places (country_id, name, description, image_url)
SELECT c.id, 'Kruger National Park', 'One of Africa''s greatest wildlife experiences', 'https://images.unsplash.com/photo-1547471080-7cc2caa01a7e?w=600&q=75'
FROM countries c WHERE c.country_code = 'ZA';

INSERT IGNORE INTO places (country_id, name, description, image_url)
SELECT c.id, 'Cape Town', 'Table Mountain, beaches, and world-class food', 'https://images.unsplash.com/photo-1580060839134-75a5edca2e99?w=600&q=75'
FROM countries c WHERE c.country_code = 'ZA';

INSERT IGNORE INTO places (country_id, name, description, image_url)
SELECT c.id, 'Garden Route', 'Scenic coastal highway through forests and lakes', 'https://images.unsplash.com/photo-1507525428034-b723cf961d3e?w=600&q=75'
FROM countries c WHERE c.country_code = 'ZA';

INSERT IGNORE INTO places (country_id, name, description, image_url)
SELECT c.id, 'Marrakech Medina', 'UNESCO-listed ancient city and souks', 'https://images.unsplash.com/photo-1548704606-571c77043fa3?w=600&q=75'
FROM countries c WHERE c.country_code = 'MA';

INSERT IGNORE INTO places (country_id, name, description, image_url)
SELECT c.id, 'Sahara Desert', 'Erg Chebbi � camel treks and star-filled skies', 'https://images.unsplash.com/photo-1509316785289-025f5b846b35?w=600&q=75'
FROM countries c WHERE c.country_code = 'MA';

INSERT IGNORE INTO places (country_id, name, description, image_url)
SELECT c.id, 'Chefchaouen', 'The iconic blue city of the Rif Mountains', 'https://images.unsplash.com/photo-1558618666-fcd25c85cd64?w=600&q=75'
FROM countries c WHERE c.country_code = 'MA';

INSERT IGNORE INTO places (country_id, name, description, image_url)
SELECT c.id, 'Lalibela', 'Extraordinary rock-hewn churches carved from single stones', 'https://images.unsplash.com/photo-1580060839134-75a5edca2e99?w=600&q=75'
FROM countries c WHERE c.country_code = 'ET';

INSERT IGNORE INTO places (country_id, name, description, image_url)
SELECT c.id, 'Simien Mountains', 'UNESCO trekking destination with gelada baboons', 'https://images.unsplash.com/photo-1589553416260-f586c8f1514f?w=600&q=75'
FROM countries c WHERE c.country_code = 'ET';

INSERT IGNORE INTO places (country_id, name, description, image_url)
SELECT c.id, 'Danakil Depression', 'One of the most extreme landscapes on Earth', 'https://images.unsplash.com/photo-1509316785289-025f5b846b35?w=600&q=75'
FROM countries c WHERE c.country_code = 'ET';

INSERT IGNORE INTO places (country_id, name, description, image_url)
SELECT c.id, 'Goree Island', 'UNESCO island – historic centre of the Atlantic slave trade', 'https://images.unsplash.com/photo-1614859324967-b4e51c9d9c80?w=600&q=75'
FROM countries c WHERE c.country_code = 'SN';

INSERT IGNORE INTO places (country_id, name, description, image_url)
SELECT c.id, 'Lake Retba', 'The Pink Lake � unique saline lake near Dakar', 'https://images.unsplash.com/photo-1580674285054-bed31e145f59?w=600&q=75'
FROM countries c WHERE c.country_code = 'SN';

INSERT IGNORE INTO places (country_id, name, description, image_url)
SELECT c.id, 'Casamance', 'Lush southern region with mangroves and beaches', 'https://images.unsplash.com/photo-1507525428034-b723cf961d3e?w=600&q=75'
FROM countries c WHERE c.country_code = 'SN';

-- -- VISA REQUIREMENTS -------------------------------------
INSERT IGNORE INTO visa_requirements (country_id, visa_status, visa_free_days, visa_title, visa_info)
SELECT c.id, 'Visa on Arrival', 30, 'Visa on Arrival',
       'Citizens of most countries can obtain a 30-day visa on arrival at Kigali International Airport. East African Community members enter visa-free. Rwanda also accepts an eVisa applied online before travel.'
FROM countries c WHERE c.country_code = 'RW';

INSERT IGNORE INTO visa_requirements (country_id, visa_status, visa_free_days, visa_title, visa_info)
SELECT c.id, 'eVisa Required', 90, 'Electronic Travel Authorisation',
       'Kenya replaced the visa on arrival with a mandatory Electronic Travel Authorisation (ETA) in 2024. Apply online at etakenya.go.ke before your trip. Processing typically takes 72 hours. Fee: USD 30.'
FROM countries c WHERE c.country_code = 'KE';

INSERT IGNORE INTO visa_requirements (country_id, visa_status, visa_free_days, visa_title, visa_info)
SELECT c.id, 'Visa on Arrival', 90, 'Visa on Arrival',
       'Single-entry tourist visas are available on arrival at major ports of entry. An eVisa is also available in advance at eservices.immigration.go.tz. Fee: USD 50 for most nationalities.'
FROM countries c WHERE c.country_code = 'TZ';

INSERT IGNORE INTO visa_requirements (country_id, visa_status, visa_free_days, visa_title, visa_info)
SELECT c.id, 'eVisa Required', 90, 'East Africa Tourist Visa',
       'Uganda requires an eVisa applied for in advance at visas.immigration.go.ug. The East Africa Tourist Visa allows multiple-entry travel to Kenya, Uganda, and Rwanda for USD 100.'
FROM countries c WHERE c.country_code = 'UG';

INSERT IGNORE INTO visa_requirements (country_id, visa_status, visa_free_days, visa_title, visa_info)
SELECT c.id, 'Visa Required', 30, 'Visa Required',
       'Most visitors require a visa in advance from a Nigerian embassy or consulate. A visa on arrival facility exists for some nationalities at Lagos and Abuja airports. Apply at portal.immigration.gov.ng.'
FROM countries c WHERE c.country_code = 'NG';

INSERT IGNORE INTO visa_requirements (country_id, visa_status, visa_free_days, visa_title, visa_info)
SELECT c.id, 'Visa on Arrival', 60, 'Visa on Arrival',
       'Ghana offers visa on arrival for citizens of many countries. eVisa applications are available at ghana.embassyapplication.com. ECOWAS citizens enter visa-free. Fee: USD 150 for most.'
FROM countries c WHERE c.country_code = 'GH';

INSERT IGNORE INTO visa_requirements (country_id, visa_status, visa_free_days, visa_title, visa_info)
SELECT c.id, 'Visa Free', 90, 'Visa Free Entry',
       'Citizens of most European, North American, and many African countries can visit South Africa visa-free for up to 90 days. Your passport must be valid for at least 30 days beyond your departure date.'
FROM countries c WHERE c.country_code = 'ZA';

INSERT IGNORE INTO visa_requirements (country_id, visa_status, visa_free_days, visa_title, visa_info)
SELECT c.id, 'Visa Free', 90, 'Visa Free Entry',
       'Citizens of most countries including EU, USA, UK, and many African nations can enter Morocco visa-free for up to 90 days. No prior application required � your passport is stamped on arrival.'
FROM countries c WHERE c.country_code = 'MA';

INSERT IGNORE INTO visa_requirements (country_id, visa_status, visa_free_days, visa_title, visa_info)
SELECT c.id, 'eVisa Required', 30, 'eVisa Required',
       'Ethiopia requires an eVisa for most nationalities. Apply at evisa.gov.et at least 5 business days before travel. Single-entry eVisa costs USD 52. Visa on arrival is available at Addis Ababa Bole Airport for select nationalities.'
FROM countries c WHERE c.country_code = 'ET';

INSERT IGNORE INTO visa_requirements (country_id, visa_status, visa_free_days, visa_title, visa_info)
SELECT c.id, 'Visa Free', 90, 'Visa Free Entry',
       'Most nationalities including EU, USA, UK, and ECOWAS countries enter Senegal visa-free for up to 90 days. Extensions can be obtained at the Dakar immigration office.'
FROM countries c WHERE c.country_code = 'SN';

-- -- EMERGENCY CONTACTS ------------------------------------
INSERT IGNORE INTO emergency_contacts (country_id, police_number, ambulance_number, fire_number, general_emergency, tourist_police)
SELECT c.id, '112', '912', '111', '112', '3512'
FROM countries c WHERE c.country_code = 'RW';

INSERT IGNORE INTO emergency_contacts (country_id, police_number, ambulance_number, fire_number, general_emergency, tourist_police)
SELECT c.id, '999', '999', '999', '112', '0800 723 715'
FROM countries c WHERE c.country_code = 'KE';

INSERT IGNORE INTO emergency_contacts (country_id, police_number, ambulance_number, fire_number, general_emergency, tourist_police)
SELECT c.id, '112', '112', '114', '112', '0800 110 003'
FROM countries c WHERE c.country_code = 'TZ';

INSERT IGNORE INTO emergency_contacts (country_id, police_number, ambulance_number, fire_number, general_emergency, tourist_police)
SELECT c.id, '999', '999', '999', '112', '0800 199 699'
FROM countries c WHERE c.country_code = 'UG';

INSERT IGNORE INTO emergency_contacts (country_id, police_number, ambulance_number, fire_number, general_emergency, tourist_police)
SELECT c.id, '199', '199', '199', '112', '0800 POLICE'
FROM countries c WHERE c.country_code = 'NG';

INSERT IGNORE INTO emergency_contacts (country_id, police_number, ambulance_number, fire_number, general_emergency, tourist_police)
SELECT c.id, '191', '193', '192', '112', '191'
FROM countries c WHERE c.country_code = 'GH';

INSERT IGNORE INTO emergency_contacts (country_id, police_number, ambulance_number, fire_number, general_emergency, tourist_police)
SELECT c.id, '10111', '10177', '10177', '112', '10111'
FROM countries c WHERE c.country_code = 'ZA';

INSERT IGNORE INTO emergency_contacts (country_id, police_number, ambulance_number, fire_number, general_emergency, tourist_police)
SELECT c.id, '19', '15', '15', '112', '0537 20 13 00'
FROM countries c WHERE c.country_code = 'MA';

INSERT IGNORE INTO emergency_contacts (country_id, police_number, ambulance_number, fire_number, general_emergency, tourist_police)
SELECT c.id, '991', '907', '939', '112', '011 551 0666'
FROM countries c WHERE c.country_code = 'ET';

INSERT IGNORE INTO emergency_contacts (country_id, police_number, ambulance_number, fire_number, general_emergency, tourist_police)
SELECT c.id, '17', '15', '18', '112', '33 869 25 00'
FROM countries c WHERE c.country_code = 'SN';

-- -- CULTURAL GUIDELINES -----------------------------------
INSERT IGNORE INTO cultural_guidelines (country_id, dress_code)
SELECT c.id, 'Smart casual is appropriate in cities. Cover shoulders and knees when visiting churches.'
FROM countries c WHERE c.country_code = 'RW';

INSERT IGNORE INTO cultural_guidelines (country_id, dress_code)
SELECT c.id, 'Modest dress is appreciated, especially in coastal areas. Remove shoes before entering mosques.'
FROM countries c WHERE c.country_code = 'KE';

INSERT IGNORE INTO cultural_guidelines (country_id, dress_code)
SELECT c.id, 'No strict dress code, but modest dress is appropriate for religious sites.'
FROM countries c WHERE c.country_code = 'ZA';

INSERT IGNORE INTO cultural_guidelines (country_id, dress_code)
SELECT c.id, 'Modest clothing is expected in medinas and rural areas. Women should cover shoulders and knees. Men should avoid shorts in traditional areas.'
FROM countries c WHERE c.country_code = 'MA';

-- Rwanda dos/donts/legal
INSERT IGNORE INTO cultural_dos (guideline_id, item)
SELECT g.guideline_id, item FROM (
  SELECT (SELECT id FROM cultural_guidelines WHERE country_id = (SELECT id FROM countries WHERE country_code = 'RW')) AS gid,
         'Carry your passport or ID at all times' AS item
  UNION ALL SELECT (SELECT id FROM cultural_guidelines WHERE country_id = (SELECT id FROM countries WHERE country_code = 'RW')),
         'Remove shoes before entering homes'
  UNION ALL SELECT (SELECT id FROM cultural_guidelines WHERE country_id = (SELECT id FROM countries WHERE country_code = 'RW')),
         'Use both hands when giving or receiving items'
  UNION ALL SELECT (SELECT id FROM cultural_guidelines WHERE country_id = (SELECT id FROM countries WHERE country_code = 'RW')),
         'Participate in Umuganda (community service) if present on the last Saturday of each month'
  UNION ALL SELECT (SELECT id FROM cultural_guidelines WHERE country_id = (SELECT id FROM countries WHERE country_code = 'RW')),
         'Ask permission before photographing people'
) AS g(guideline_id, item);

INSERT IGNORE INTO cultural_donts (guideline_id, item)
SELECT g.guideline_id, item FROM (
  SELECT (SELECT id FROM cultural_guidelines WHERE country_id = (SELECT id FROM countries WHERE country_code = 'RW')) AS gid,
         'Do not bring or use plastic bags - they are banned' AS item
  UNION ALL SELECT (SELECT id FROM cultural_guidelines WHERE country_id = (SELECT id FROM countries WHERE country_code = 'RW')),
         'Do not litter - Rwanda takes cleanliness very seriously'
  UNION ALL SELECT (SELECT id FROM cultural_guidelines WHERE country_id = (SELECT id FROM countries WHERE country_code = 'RW')),
         'Avoid photographing government buildings and military installations'
  UNION ALL SELECT (SELECT id FROM cultural_guidelines WHERE country_id = (SELECT id FROM countries WHERE country_code = 'RW')),
         'Do not smoke in public spaces'
  UNION ALL SELECT (SELECT id FROM cultural_guidelines WHERE country_id = (SELECT id FROM countries WHERE country_code = 'RW')),
         'Avoid discussing the 1994 genocide casually'
) AS g(guideline_id, item);

INSERT IGNORE INTO cultural_legal_warnings (guideline_id, title, description)
SELECT g.guideline_id, warning_title, warning_desc FROM (
  SELECT (SELECT id FROM cultural_guidelines WHERE country_id = (SELECT id FROM countries WHERE country_code = 'RW')) AS gid,
         'Plastic Bag Ban' AS warning_title,
         'Importing, selling, or using plastic bags is illegal. Customs will confiscate them on arrival.' AS warning_desc
  UNION ALL SELECT (SELECT id FROM cultural_guidelines WHERE country_id = (SELECT id FROM countries WHERE country_code = 'RW')),
         'Genocide Denial',
         'Denying, minimising, or trivialising the 1994 genocide against the Tutsi is a criminal offence.'
) AS g(guideline_id, warning_title, warning_desc);

-- Kenya dos/donts/legal
INSERT IGNORE INTO cultural_dos (guideline_id, item)
SELECT g.guideline_id, item FROM (
  SELECT (SELECT id FROM cultural_guidelines WHERE country_id = (SELECT id FROM countries WHERE country_code = 'KE')) AS gid,
         'Greet elders and those in authority first' AS item
  UNION ALL SELECT (SELECT id FROM cultural_guidelines WHERE country_id = (SELECT id FROM countries WHERE country_code = 'KE')),
         'Bargain respectfully in markets'
  UNION ALL SELECT (SELECT id FROM cultural_guidelines WHERE country_id = (SELECT id FROM countries WHERE country_code = 'KE')),
         'Carry a copy of your passport at all times'
  UNION ALL SELECT (SELECT id FROM cultural_guidelines WHERE country_id = (SELECT id FROM countries WHERE country_code = 'KE')),
         'Tip safari guides and lodge staff'
  UNION ALL SELECT (SELECT id FROM cultural_guidelines WHERE country_id = (SELECT id FROM countries WHERE country_code = 'KE')),
         'Use your right hand for eating and handshakes'
) AS g(guideline_id, item);

INSERT IGNORE INTO cultural_donts (guideline_id, item)
SELECT g.guideline_id, item FROM (
  SELECT (SELECT id FROM cultural_guidelines WHERE country_id = (SELECT id FROM countries WHERE country_code = 'KE')) AS gid,
         'Do not photograph police or military without permission' AS item
  UNION ALL SELECT (SELECT id FROM cultural_guidelines WHERE country_id = (SELECT id FROM countries WHERE country_code = 'KE')),
         'Avoid public displays of affection'
  UNION ALL SELECT (SELECT id FROM cultural_guidelines WHERE country_id = (SELECT id FROM countries WHERE country_code = 'KE')),
         'Do not use your left hand to give or receive items'
  UNION ALL SELECT (SELECT id FROM cultural_guidelines WHERE country_id = (SELECT id FROM countries WHERE country_code = 'KE')),
         'Avoid walking alone after dark in Nairobi CBD'
  UNION ALL SELECT (SELECT id FROM cultural_guidelines WHERE country_id = (SELECT id FROM countries WHERE country_code = 'KE')),
         'Do not buy or sell wildlife products'
) AS g(guideline_id, item);

INSERT IGNORE INTO cultural_legal_warnings (guideline_id, title, description)
SELECT g.guideline_id, warning_title, warning_desc FROM (
  SELECT (SELECT id FROM cultural_guidelines WHERE country_id = (SELECT id FROM countries WHERE country_code = 'KE')) AS gid,
         'Wildlife Trade' AS warning_title,
         'Buying, selling, or possessing wildlife products including ivory is a serious criminal offence with heavy penalties.' AS warning_desc
  UNION ALL SELECT (SELECT id FROM cultural_guidelines WHERE country_id = (SELECT id FROM countries WHERE country_code = 'KE')),
         'Drug Offences',
         'Drug offences carry severe penalties including lengthy prison sentences.'
) AS g(guideline_id, warning_title, warning_desc);

-- South Africa dos/donts/legal
INSERT IGNORE INTO cultural_dos (guideline_id, item)
SELECT g.guideline_id, item FROM (
  SELECT (SELECT id FROM cultural_guidelines WHERE country_id = (SELECT id FROM countries WHERE country_code = 'ZA')) AS gid,
         'Be aware of your surroundings, especially at night' AS item
  UNION ALL SELECT (SELECT id FROM cultural_guidelines WHERE country_id = (SELECT id FROM countries WHERE country_code = 'ZA')),
         'Use reputable metered taxis or ride-hailing apps'
  UNION ALL SELECT (SELECT id FROM cultural_guidelines WHERE country_id = (SELECT id FROM countries WHERE country_code = 'ZA')),
         'Tip service staff 10-15%'
  UNION ALL SELECT (SELECT id FROM cultural_guidelines WHERE country_id = (SELECT id FROM countries WHERE country_code = 'ZA')),
         'Lock your car and do not leave valuables visible'
  UNION ALL SELECT (SELECT id FROM cultural_guidelines WHERE country_id = (SELECT id FROM countries WHERE country_code = 'ZA')),
         'Carry a photocopy of your passport'
) AS g(guideline_id, item);

INSERT IGNORE INTO cultural_donts (guideline_id, item)
SELECT g.guideline_id, item FROM (
  SELECT (SELECT id FROM cultural_guidelines WHERE country_id = (SELECT id FROM countries WHERE country_code = 'ZA')) AS gid,
         'Do not display expensive jewellery or electronics publicly' AS item
  UNION ALL SELECT (SELECT id FROM cultural_guidelines WHERE country_id = (SELECT id FROM countries WHERE country_code = 'ZA')),
         'Avoid walking alone at night in city centres'
  UNION ALL SELECT (SELECT id FROM cultural_guidelines WHERE country_id = (SELECT id FROM countries WHERE country_code = 'ZA')),
         'Do not ignore load-shedding schedules - plan accordingly'
  UNION ALL SELECT (SELECT id FROM cultural_guidelines WHERE country_id = (SELECT id FROM countries WHERE country_code = 'ZA')),
         'Do not underestimate driving distances'
  UNION ALL SELECT (SELECT id FROM cultural_guidelines WHERE country_id = (SELECT id FROM countries WHERE country_code = 'ZA')),
         'Avoid hitchhiking'
) AS g(guideline_id, item);

INSERT IGNORE INTO cultural_legal_warnings (guideline_id, title, description)
SELECT g.guideline_id, warning_title, warning_desc FROM (
  SELECT (SELECT id FROM cultural_guidelines WHERE country_id = (SELECT id FROM countries WHERE country_code = 'ZA')) AS gid,
         'Xenophobia' AS warning_title,
         'Be aware of occasional tensions between locals and foreign nationals in some areas. Exercise caution.' AS warning_desc
  UNION ALL SELECT (SELECT id FROM cultural_guidelines WHERE country_id = (SELECT id FROM countries WHERE country_code = 'ZA')),
         'Water Safety',
         'Tap water is safe in major cities but not in rural areas. Confirm before drinking.'
) AS g(guideline_id, warning_title, warning_desc);

-- Morocco dos/donts/legal
INSERT IGNORE INTO cultural_dos (guideline_id, item)
SELECT g.guideline_id, item FROM (
  SELECT (SELECT id FROM cultural_guidelines WHERE country_id = (SELECT id FROM countries WHERE country_code = 'MA')) AS gid,
         'Learn a few words of Arabic or French - it is appreciated' AS item
  UNION ALL SELECT (SELECT id FROM cultural_guidelines WHERE country_id = (SELECT id FROM countries WHERE country_code = 'MA')),
         'Bargain in souks - it is expected and part of the culture'
  UNION ALL SELECT (SELECT id FROM cultural_guidelines WHERE country_id = (SELECT id FROM countries WHERE country_code = 'MA')),
         'Accept mint tea when offered - declining can be considered rude'
  UNION ALL SELECT (SELECT id FROM cultural_guidelines WHERE country_id = (SELECT id FROM countries WHERE country_code = 'MA')),
         'Dress modestly, especially in rural areas and medinas'
  UNION ALL SELECT (SELECT id FROM cultural_guidelines WHERE country_id = (SELECT id FROM countries WHERE country_code = 'MA')),
         'Remove shoes before entering mosques'
) AS g(guideline_id, item);

INSERT IGNORE INTO cultural_donts (guideline_id, item)
SELECT g.guideline_id, item FROM (
  SELECT (SELECT id FROM cultural_guidelines WHERE country_id = (SELECT id FROM countries WHERE country_code = 'MA')) AS gid,
         'Do not photograph people without asking permission first' AS item
  UNION ALL SELECT (SELECT id FROM cultural_guidelines WHERE country_id = (SELECT id FROM countries WHERE country_code = 'MA')),
         'Non-Muslims may not enter the interior of most mosques'
  UNION ALL SELECT (SELECT id FROM cultural_guidelines WHERE country_id = (SELECT id FROM countries WHERE country_code = 'MA')),
         'Avoid public displays of affection'
  UNION ALL SELECT (SELECT id FROM cultural_guidelines WHERE country_id = (SELECT id FROM countries WHERE country_code = 'MA')),
         'Do not drink alcohol in public or in non-licensed areas'
  UNION ALL SELECT (SELECT id FROM cultural_guidelines WHERE country_id = (SELECT id FROM countries WHERE country_code = 'MA')),
         'Avoid eating, drinking, or smoking in public during Ramadan'
) AS g(guideline_id, item);

INSERT IGNORE INTO cultural_legal_warnings (guideline_id, title, description)
SELECT g.guideline_id, warning_title, warning_desc FROM (
  SELECT (SELECT id FROM cultural_guidelines WHERE country_id = (SELECT id FROM countries WHERE country_code = 'MA')) AS gid,
         'Same-Sex Relations' AS warning_title,
         'Same-sex sexual activity is illegal in Morocco and can result in prison sentences of up to 3 years.' AS warning_desc
  UNION ALL SELECT (SELECT id FROM cultural_guidelines WHERE country_id = (SELECT id FROM countries WHERE country_code = 'MA')),
         'Drug Offences',
         'Cannabis possession, despite its visible presence in some areas, is illegal and can result in prison sentences.'
) AS g(guideline_id, warning_title, warning_desc);

-- Tanzania cultural guidelines
INSERT IGNORE INTO cultural_guidelines (country_id, dress_code)
SELECT c.id, 'Conservative dress is essential. In Zanzibar, women must cover shoulders and knees even on the street. Swimwear only at beach resorts.'
FROM countries c WHERE c.country_code = 'TZ';

INSERT IGNORE INTO cultural_dos (guideline_id, item)
SELECT g.guideline_id, item FROM (
  SELECT (SELECT id FROM cultural_guidelines WHERE country_id = (SELECT id FROM countries WHERE country_code = 'TZ')) AS gid,
         'Dress modestly, especially in Zanzibar and Muslim communities' AS item
  UNION ALL SELECT (SELECT id FROM cultural_guidelines WHERE country_id = (SELECT id FROM countries WHERE country_code = 'TZ')),
         'Remove shoes before entering mosques and some homes'
  UNION ALL SELECT (SELECT id FROM cultural_guidelines WHERE country_id = (SELECT id FROM countries WHERE country_code = 'TZ')),
         'Greet locals with Habari - Tanzanians appreciate Swahili greetings'
  UNION ALL SELECT (SELECT id FROM cultural_guidelines WHERE country_id = (SELECT id FROM countries WHERE country_code = 'TZ')),
         'Book safaris and Kilimanjaro climbs through licensed operators only'
  UNION ALL SELECT (SELECT id FROM cultural_guidelines WHERE country_id = (SELECT id FROM countries WHERE country_code = 'TZ')),
         'Carry cash in rural areas - card acceptance is limited'
) AS g(guideline_id, item);

INSERT IGNORE INTO cultural_donts (guideline_id, item)
SELECT g.guideline_id, item FROM (
  SELECT (SELECT id FROM cultural_guidelines WHERE country_id = (SELECT id FROM countries WHERE country_code = 'TZ')) AS gid,
         'Do not display public affection, especially in Zanzibar' AS item
  UNION ALL SELECT (SELECT id FROM cultural_guidelines WHERE country_id = (SELECT id FROM countries WHERE country_code = 'TZ')),
         'Do not bring or use plastic bags - banned nationwide'
  UNION ALL SELECT (SELECT id FROM cultural_guidelines WHERE country_id = (SELECT id FROM countries WHERE country_code = 'TZ')),
         'Do not attempt to climb Kilimanjaro without a licensed guide - it is illegal'
  UNION ALL SELECT (SELECT id FROM cultural_guidelines WHERE country_id = (SELECT id FROM countries WHERE country_code = 'TZ')),
         'Do not buy, sell, or transport ivory or wildlife products'
  UNION ALL SELECT (SELECT id FROM cultural_guidelines WHERE country_id = (SELECT id FROM countries WHERE country_code = 'TZ')),
         'Do not drink tap water anywhere in Tanzania'
) AS g(guideline_id, item);

INSERT IGNORE INTO cultural_legal_warnings (guideline_id, title, description)
SELECT g.guideline_id, warning_title, warning_desc FROM (
  SELECT (SELECT id FROM cultural_guidelines WHERE country_id = (SELECT id FROM countries WHERE country_code = 'TZ')) AS gid,
         'Same-Sex Relations' AS warning_title,
         'Same-sex relationships are criminalised with up to 30 years imprisonment.' AS warning_desc
  UNION ALL SELECT (SELECT id FROM cultural_guidelines WHERE country_id = (SELECT id FROM countries WHERE country_code = 'TZ')),
         'Wildlife Trafficking',
         'Mandatory minimum 20-year sentence for ivory or rhino horn possession.'
) AS g(guideline_id, warning_title, warning_desc);

-- Uganda cultural guidelines
INSERT IGNORE INTO cultural_guidelines (country_id, dress_code)
SELECT c.id, 'Modest dress required across Uganda. Cover shoulders and knees in rural areas, churches, and mosques. Swimwear only at hotel pools and lakeside resorts.'
FROM countries c WHERE c.country_code = 'UG';

INSERT IGNORE INTO cultural_dos (guideline_id, item)
SELECT g.guideline_id, item FROM (
  SELECT (SELECT id FROM cultural_guidelines WHERE country_id = (SELECT id FROM countries WHERE country_code = 'UG')) AS gid,
         'Get your Yellow Fever vaccination and carry the physical certificate' AS item
  UNION ALL SELECT (SELECT id FROM cultural_guidelines WHERE country_id = (SELECT id FROM countries WHERE country_code = 'UG')),
         'Dress modestly, especially in rural areas and religious sites'
  UNION ALL SELECT (SELECT id FROM cultural_guidelines WHERE country_id = (SELECT id FROM countries WHERE country_code = 'UG')),
         'Ask permission before photographing people and communities'
  UNION ALL SELECT (SELECT id FROM cultural_guidelines WHERE country_id = (SELECT id FROM countries WHERE country_code = 'UG')),
         'Book gorilla trekking permits well in advance through Uganda Wildlife Authority'
  UNION ALL SELECT (SELECT id FROM cultural_guidelines WHERE country_id = (SELECT id FROM countries WHERE country_code = 'UG')),
         'Use registered boda-bodas and always wear the provided helmet'
) AS g(guideline_id, item);

INSERT IGNORE INTO cultural_donts (guideline_id, item)
SELECT g.guideline_id, item FROM (
  SELECT (SELECT id FROM cultural_guidelines WHERE country_id = (SELECT id FROM countries WHERE country_code = 'UG')) AS gid,
         'Do not enter Uganda without a Yellow Fever certificate - entry will be refused' AS item
  UNION ALL SELECT (SELECT id FROM cultural_guidelines WHERE country_id = (SELECT id FROM countries WHERE country_code = 'UG')),
         'Do not photograph the President''s residence, military, or government buildings'
  UNION ALL SELECT (SELECT id FROM cultural_guidelines WHERE country_id = (SELECT id FROM countries WHERE country_code = 'UG')),
         'Do not travel to the DRC border without current security advice'
  UNION ALL SELECT (SELECT id FROM cultural_guidelines WHERE country_id = (SELECT id FROM countries WHERE country_code = 'UG')),
         'Do not purchase or possess wildlife products including gorilla souvenirs'
  UNION ALL SELECT (SELECT id FROM cultural_guidelines WHERE country_id = (SELECT id FROM countries WHERE country_code = 'UG')),
         'Do not use plastic bags - banned'
) AS g(guideline_id, item);

INSERT IGNORE INTO cultural_legal_warnings (guideline_id, title, description)
SELECT g.guideline_id, warning_title, warning_desc FROM (
  SELECT (SELECT id FROM cultural_guidelines WHERE country_id = (SELECT id FROM countries WHERE country_code = 'UG')) AS gid,
         'Anti-Homosexuality Act' AS warning_title,
         'The Anti-Homosexuality Act (2023) imposes severe penalties. LGBTQ+ travellers face serious risk.' AS warning_desc
  UNION ALL SELECT (SELECT id FROM cultural_guidelines WHERE country_id = (SELECT id FROM countries WHERE country_code = 'UG')),
         'Drug Trafficking',
         'Drug trafficking carries the death penalty in Uganda.'
) AS g(guideline_id, warning_title, warning_desc);

-- Nigeria cultural guidelines
INSERT IGNORE INTO cultural_guidelines (country_id, dress_code)
SELECT c.id, 'Business casual in Lagos and Abuja. Conservative dress in northern Muslim states. Traditional dress is welcomed at cultural events.'
FROM countries c WHERE c.country_code = 'NG';

INSERT IGNORE INTO cultural_dos (guideline_id, item)
SELECT g.guideline_id, item FROM (
  SELECT (SELECT id FROM cultural_guidelines WHERE country_id = (SELECT id FROM countries WHERE country_code = 'NG')) AS gid,
         'Register your arrival with your country''s embassy in Nigeria' AS item
  UNION ALL SELECT (SELECT id FROM cultural_guidelines WHERE country_id = (SELECT id FROM countries WHERE country_code = 'NG')),
         'Use only reputable hotels with security'
  UNION ALL SELECT (SELECT id FROM cultural_guidelines WHERE country_id = (SELECT id FROM countries WHERE country_code = 'NG')),
         'Carry Yellow Fever certificate at all times'
  UNION ALL SELECT (SELECT id FROM cultural_guidelines WHERE country_id = (SELECT id FROM countries WHERE country_code = 'NG')),
         'Use ATMs inside banks or hotels only'
  UNION ALL SELECT (SELECT id FROM cultural_guidelines WHERE country_id = (SELECT id FROM countries WHERE country_code = 'NG')),
         'Respect Islamic customs and prayer times in northern Nigeria'
) AS g(guideline_id, item);

INSERT IGNORE INTO cultural_donts (guideline_id, item)
SELECT g.guideline_id, item FROM (
  SELECT (SELECT id FROM cultural_guidelines WHERE country_id = (SELECT id FROM countries WHERE country_code = 'NG')) AS gid,
         'Do not travel to northeast Nigeria (Borno, Yobe) - active Boko Haram operations' AS item
  UNION ALL SELECT (SELECT id FROM cultural_guidelines WHERE country_id = (SELECT id FROM countries WHERE country_code = 'NG')),
         'Do not accept drinks or food from strangers'
  UNION ALL SELECT (SELECT id FROM cultural_guidelines WHERE country_id = (SELECT id FROM countries WHERE country_code = 'NG')),
         'Do not photograph airports, military, or government buildings'
  UNION ALL SELECT (SELECT id FROM cultural_guidelines WHERE country_id = (SELECT id FROM countries WHERE country_code = 'NG')),
         'Do not travel by road between cities at night'
  UNION ALL SELECT (SELECT id FROM cultural_guidelines WHERE country_id = (SELECT id FROM countries WHERE country_code = 'NG')),
         'Do not use unregistered taxis in Lagos'
) AS g(guideline_id, item);

INSERT IGNORE INTO cultural_legal_warnings (guideline_id, title, description)
SELECT g.guideline_id, warning_title, warning_desc FROM (
  SELECT (SELECT id FROM cultural_guidelines WHERE country_id = (SELECT id FROM countries WHERE country_code = 'NG')) AS gid,
         'Same-Sex Relations' AS warning_title,
         'Same-sex relationships are criminalised - up to 14 years in southern states; death by stoning in some northern states under Sharia law.' AS warning_desc
  UNION ALL SELECT (SELECT id FROM cultural_guidelines WHERE country_id = (SELECT id FROM countries WHERE country_code = 'NG')),
         'Drug Trafficking',
         'Drug trafficking carries the death penalty.'
) AS g(guideline_id, warning_title, warning_desc);

-- Ghana cultural guidelines
INSERT IGNORE INTO cultural_guidelines (country_id, dress_code)
SELECT c.id, 'Casual but respectful in Accra. Conservative dress in Muslim northern regions. Beach attire only at beach resorts.'
FROM countries c WHERE c.country_code = 'GH';

INSERT IGNORE INTO cultural_dos (guideline_id, item)
SELECT g.guideline_id, item FROM (
  SELECT (SELECT id FROM cultural_guidelines WHERE country_id = (SELECT id FROM countries WHERE country_code = 'GH')) AS gid,
         'Greet people warmly - Ghanaians are known for their friendliness' AS item
  UNION ALL SELECT (SELECT id FROM cultural_guidelines WHERE country_id = (SELECT id FROM countries WHERE country_code = 'GH')),
         'Use the right hand or both hands when giving, receiving, or greeting'
  UNION ALL SELECT (SELECT id FROM cultural_guidelines WHERE country_id = (SELECT id FROM countries WHERE country_code = 'GH')),
         'Bargain respectfully at local markets - it is culturally expected'
  UNION ALL SELECT (SELECT id FROM cultural_guidelines WHERE country_id = (SELECT id FROM countries WHERE country_code = 'GH')),
         'Visit Cape Coast Castle with respect - it is a deeply significant historical site'
  UNION ALL SELECT (SELECT id FROM cultural_guidelines WHERE country_id = (SELECT id FROM countries WHERE country_code = 'GH')),
         'Carry your Yellow Fever certificate - checked at entry'
) AS g(guideline_id, item);

INSERT IGNORE INTO cultural_donts (guideline_id, item)
SELECT g.guideline_id, item FROM (
  SELECT (SELECT id FROM cultural_guidelines WHERE country_id = (SELECT id FROM countries WHERE country_code = 'GH')) AS gid,
         'Do not use your left hand alone to eat, give, or receive' AS item
  UNION ALL SELECT (SELECT id FROM cultural_guidelines WHERE country_id = (SELECT id FROM countries WHERE country_code = 'GH')),
         'Do not travel to northern border regions with Burkina Faso without security advice'
  UNION ALL SELECT (SELECT id FROM cultural_guidelines WHERE country_id = (SELECT id FROM countries WHERE country_code = 'GH')),
         'Do not photograph military, police, or government buildings'
  UNION ALL SELECT (SELECT id FROM cultural_guidelines WHERE country_id = (SELECT id FROM countries WHERE country_code = 'GH')),
         'Do not leave valuables unattended on beaches in Accra'
  UNION ALL SELECT (SELECT id FROM cultural_guidelines WHERE country_id = (SELECT id FROM countries WHERE country_code = 'GH')),
         'Do not drink tap water - use bottled water'
) AS g(guideline_id, item);

INSERT IGNORE INTO cultural_legal_warnings (guideline_id, title, description)
SELECT g.guideline_id, warning_title, warning_desc FROM (
  SELECT (SELECT id FROM cultural_guidelines WHERE country_id = (SELECT id FROM countries WHERE country_code = 'GH')) AS gid,
         'Same-Sex Relations' AS warning_title,
         'Same-sex relationships are illegal. The Human Sexual Rights and Family Values Act (2024) significantly increased penalties.' AS warning_desc
  UNION ALL SELECT (SELECT id FROM cultural_guidelines WHERE country_id = (SELECT id FROM countries WHERE country_code = 'GH')),
         'Drug Offences',
         'Drug offences carry minimum 5-year imprisonment.'
) AS g(guideline_id, warning_title, warning_desc);

-- Ethiopia cultural guidelines
INSERT IGNORE INTO cultural_guidelines (country_id, dress_code)
SELECT c.id, 'Conservative dress is essential. Women should cover hair, shoulders, and knees when visiting Orthodox churches and mosques. Men should wear long trousers in religious sites.'
FROM countries c WHERE c.country_code = 'ET';

INSERT IGNORE INTO cultural_dos (guideline_id, item)
SELECT g.guideline_id, item FROM (
  SELECT (SELECT id FROM cultural_guidelines WHERE country_id = (SELECT id FROM countries WHERE country_code = 'ET')) AS gid,
         'Apply for your eVisa well in advance - allow at least 1 week' AS item
  UNION ALL SELECT (SELECT id FROM cultural_guidelines WHERE country_id = (SELECT id FROM countries WHERE country_code = 'ET')),
         'Remove shoes when entering churches and mosques - this is mandatory'
  UNION ALL SELECT (SELECT id FROM cultural_guidelines WHERE country_id = (SELECT id FROM countries WHERE country_code = 'ET')),
         'Respect religious fasting periods - many restaurants modify menus'
  UNION ALL SELECT (SELECT id FROM cultural_guidelines WHERE country_id = (SELECT id FROM countries WHERE country_code = 'ET')),
         'Register with your embassy if staying more than 1 week'
  UNION ALL SELECT (SELECT id FROM cultural_guidelines WHERE country_id = (SELECT id FROM countries WHERE country_code = 'ET')),
         'Use authorised forex offices or banks to exchange currency'
) AS g(guideline_id, item);

INSERT IGNORE INTO cultural_donts (guideline_id, item)
SELECT g.guideline_id, item FROM (
  SELECT (SELECT id FROM cultural_guidelines WHERE country_id = (SELECT id FROM countries WHERE country_code = 'ET')) AS gid,
         'Do not travel to Tigray, Afar, or Amhara regions without security clearance' AS item
  UNION ALL SELECT (SELECT id FROM cultural_guidelines WHERE country_id = (SELECT id FROM countries WHERE country_code = 'ET')),
         'Do not photograph military, government buildings, or airports'
  UNION ALL SELECT (SELECT id FROM cultural_guidelines WHERE country_id = (SELECT id FROM countries WHERE country_code = 'ET')),
         'Do not travel by road at night outside Addis Ababa'
  UNION ALL SELECT (SELECT id FROM cultural_guidelines WHERE country_id = (SELECT id FROM countries WHERE country_code = 'ET')),
         'Do not engage in political discussions or demonstrations'
  UNION ALL SELECT (SELECT id FROM cultural_guidelines WHERE country_id = (SELECT id FROM countries WHERE country_code = 'ET')),
         'Do not drink tap water anywhere in Ethiopia'
) AS g(guideline_id, item);

INSERT IGNORE INTO cultural_legal_warnings (guideline_id, title, description)
SELECT g.guideline_id, warning_title, warning_desc FROM (
  SELECT (SELECT id FROM cultural_guidelines WHERE country_id = (SELECT id FROM countries WHERE country_code = 'ET')) AS gid,
         'Conflict Zones' AS warning_title,
         'Travel to Tigray, parts of Amhara and Afar is extremely dangerous. Do not travel to these regions.' AS warning_desc
  UNION ALL SELECT (SELECT id FROM cultural_guidelines WHERE country_id = (SELECT id FROM countries WHERE country_code = 'ET')),
         'Same-Sex Relations',
         'Same-sex relationships are criminalised with up to 15 years imprisonment.'
) AS g(guideline_id, warning_title, warning_desc);

-- Senegal cultural guidelines
INSERT IGNORE INTO cultural_guidelines (country_id, dress_code)
SELECT c.id, 'Modest dress throughout Senegal. Women should cover shoulders and knees outside beach areas. Swimwear only at designated beach resorts.'
FROM countries c WHERE c.country_code = 'SN';

INSERT IGNORE INTO cultural_dos (guideline_id, item)
SELECT g.guideline_id, item FROM (
  SELECT (SELECT id FROM cultural_guidelines WHERE country_id = (SELECT id FROM countries WHERE country_code = 'SN')) AS gid,
         'Carry your Yellow Fever certificate - mandatory for all travellers' AS item
  UNION ALL SELECT (SELECT id FROM cultural_guidelines WHERE country_id = (SELECT id FROM countries WHERE country_code = 'SN')),
         'Learn a few words in Wolof or French - Jerejef (thank you) is warmly appreciated'
  UNION ALL SELECT (SELECT id FROM cultural_guidelines WHERE country_id = (SELECT id FROM countries WHERE country_code = 'SN')),
         'Accept hospitality warmly - Senegalese Teranga culture is built on generosity'
  UNION ALL SELECT (SELECT id FROM cultural_guidelines WHERE country_id = (SELECT id FROM countries WHERE country_code = 'SN')),
         'Dress modestly when visiting mosques and rural communities'
  UNION ALL SELECT (SELECT id FROM cultural_guidelines WHERE country_id = (SELECT id FROM countries WHERE country_code = 'SN')),
         'Bargain respectfully in markets - it is expected and culturally normal'
) AS g(guideline_id, item);

INSERT IGNORE INTO cultural_donts (guideline_id, item)
SELECT g.guideline_id, item FROM (
  SELECT (SELECT id FROM cultural_guidelines WHERE country_id = (SELECT id FROM countries WHERE country_code = 'SN')) AS gid,
         'Do not enter a mosque without being invited or welcomed in' AS item
  UNION ALL SELECT (SELECT id FROM cultural_guidelines WHERE country_id = (SELECT id FROM countries WHERE country_code = 'SN')),
         'Do not eat with your left hand - considered disrespectful'
  UNION ALL SELECT (SELECT id FROM cultural_guidelines WHERE country_id = (SELECT id FROM countries WHERE country_code = 'SN')),
         'Do not travel to the Casamance region without current security advice'
  UNION ALL SELECT (SELECT id FROM cultural_guidelines WHERE country_id = (SELECT id FROM countries WHERE country_code = 'SN')),
         'Do not photograph military, police, or government buildings'
  UNION ALL SELECT (SELECT id FROM cultural_guidelines WHERE country_id = (SELECT id FROM countries WHERE country_code = 'SN')),
         'Do not drink tap water - use bottled water'
) AS g(guideline_id, item);

INSERT IGNORE INTO cultural_legal_warnings (guideline_id, title, description)
SELECT g.guideline_id, warning_title, warning_desc FROM (
  SELECT (SELECT id FROM cultural_guidelines WHERE country_id = (SELECT id FROM countries WHERE country_code = 'SN')) AS gid,
         'Same-Sex Relations' AS warning_title,
         'Same-sex relationships are criminalised with up to 5 years imprisonment.' AS warning_desc
  UNION ALL SELECT (SELECT id FROM cultural_guidelines WHERE country_id = (SELECT id FROM countries WHERE country_code = 'SN')),
         'Casamance Landmines',
         'The Casamance region has unexploded landmines in some rural areas - stick to known paths.'
) AS g(guideline_id, warning_title, warning_desc);

-- -- HEALTH ADVISORIES -------------------------------------
INSERT IGNORE INTO health_advisories (country_id, medication_rules, cdc_notice_level)
SELECT c.id, 'Malaria prophylaxis is strongly recommended for all travellers. Bring adequate supplies of any prescription medication as availability may be limited.', 1
FROM countries c WHERE c.country_code = 'RW';

INSERT IGNORE INTO health_advisories (country_id, medication_rules, cdc_notice_level)
SELECT c.id, 'Malaria risk is high in coastal and low-altitude areas. Prescription antimalarials are recommended. Altitude sickness may affect travellers to highland areas above 2500m.', 1
FROM countries c WHERE c.country_code = 'KE';

INSERT IGNORE INTO health_advisories (country_id, medication_rules, cdc_notice_level)
SELECT c.id, 'Malaria risk exists in the Limpopo, Mpumalanga, and KwaZulu-Natal provinces near the borders. Prophylaxis is recommended if visiting Kruger National Park. No risk in Cape Town or Johannesburg.', 0
FROM countries c WHERE c.country_code = 'ZA';

INSERT IGNORE INTO health_advisories (country_id, medication_rules, cdc_notice_level)
SELECT c.id, 'No malaria risk. Tap water is generally safe in cities but travellers with sensitive stomachs should stick to bottled water. Food safety standards vary widely.', 0
FROM countries c WHERE c.country_code = 'MA';

INSERT IGNORE INTO health_advisories (country_id, medication_rules, cdc_notice_level)
SELECT c.id, 'Malaria is prevalent throughout Tanzania including Zanzibar. Prophylaxis is strongly recommended. Avoid swimming in Lake Victoria and other freshwater bodies due to schistosomiasis risk.', 1
FROM countries c WHERE c.country_code = 'TZ';

INSERT IGNORE INTO health_advisories (country_id, medication_rules, cdc_notice_level)
SELECT c.id, 'Yellow Fever vaccination is mandatory for all travellers. Malaria prophylaxis is essential. Monitor travel advisories for Ebola outbreaks in border regions with DRC.', 1
FROM countries c WHERE c.country_code = 'UG';

INSERT IGNORE INTO health_advisories (country_id, medication_rules, cdc_notice_level)
SELECT c.id, 'Yellow Fever vaccination certificate is required for entry. Malaria is prevalent throughout the country. Lassa Fever is endemic in some areas. Avoid drinking tap water.', 2
FROM countries c WHERE c.country_code = 'NG';

INSERT IGNORE INTO health_advisories (country_id, medication_rules, cdc_notice_level)
SELECT c.id, 'Yellow Fever vaccination is mandatory. Malaria is prevalent across the country - prophylaxis is essential. Avoid tap water; use bottled or treated water.', 1
FROM countries c WHERE c.country_code = 'GH';

INSERT IGNORE INTO health_advisories (country_id, medication_rules, cdc_notice_level)
SELECT c.id, 'Malaria exists at altitudes below 2000m. Addis Ababa at 2400m is malaria-free. Altitude sickness may affect travellers arriving in Addis Ababa - allow 2-3 days to acclimatise before trekking.', 1
FROM countries c WHERE c.country_code = 'ET';

INSERT IGNORE INTO health_advisories (country_id, medication_rules, cdc_notice_level)
SELECT c.id, 'Yellow Fever vaccination certificate is required for entry. Malaria prophylaxis is essential for all travellers. Dakar has lower risk than rural areas but prophylaxis is still recommended.', 1
FROM countries c WHERE c.country_code = 'SN';

-- Required vaccines
INSERT IGNORE INTO health_required_vaccines (advisory_id, vaccine)
SELECT a.id, 'Yellow Fever (if arriving from endemic country)'
FROM health_advisories a JOIN countries c ON a.country_id = c.id WHERE c.country_code = 'RW';

INSERT IGNORE INTO health_required_vaccines (advisory_id, vaccine)
SELECT a.id, 'Yellow Fever (if arriving from endemic country)'
FROM health_advisories a JOIN countries c ON a.country_id = c.id WHERE c.country_code = 'KE';

INSERT IGNORE INTO health_required_vaccines (advisory_id, vaccine)
SELECT a.id, 'Yellow Fever (if arriving from endemic country)'
FROM health_advisories a JOIN countries c ON a.country_id = c.id WHERE c.country_code = 'TZ';

INSERT IGNORE INTO health_required_vaccines (advisory_id, vaccine)
SELECT a.id, 'Yellow Fever required'
FROM health_advisories a JOIN countries c ON a.country_id = c.id WHERE c.country_code = 'UG';

INSERT IGNORE INTO health_required_vaccines (advisory_id, vaccine)
SELECT a.id, 'Yellow Fever required'
FROM health_advisories a JOIN countries c ON a.country_id = c.id WHERE c.country_code = 'NG';

INSERT IGNORE INTO health_required_vaccines (advisory_id, vaccine)
SELECT a.id, 'Yellow Fever required'
FROM health_advisories a JOIN countries c ON a.country_id = c.id WHERE c.country_code = 'GH';

INSERT IGNORE INTO health_required_vaccines (advisory_id, vaccine)
SELECT a.id, 'Yellow Fever (if arriving from endemic country)'
FROM health_advisories a JOIN countries c ON a.country_id = c.id WHERE c.country_code = 'ET';

INSERT IGNORE INTO health_required_vaccines (advisory_id, vaccine)
SELECT a.id, 'Yellow Fever required'
FROM health_advisories a JOIN countries c ON a.country_id = c.id WHERE c.country_code = 'SN';

-- Recommended vaccines and risks
INSERT IGNORE INTO health_recommended_vaccines (advisory_id, vaccine)
SELECT v.advisory_id, vaccine FROM (
  SELECT (SELECT a2.id FROM health_advisories a2 JOIN countries c2 ON a2.country_id = c2.id WHERE c2.country_code = 'RW') AS aid, 'Hepatitis A' AS vaccine
  UNION ALL SELECT (SELECT a2.id FROM health_advisories a2 JOIN countries c2 ON a2.country_id = c2.id WHERE c2.country_code = 'RW'), 'Typhoid'
  UNION ALL SELECT (SELECT a2.id FROM health_advisories a2 JOIN countries c2 ON a2.country_id = c2.id WHERE c2.country_code = 'RW'), 'Malaria prophylaxis'
  UNION ALL SELECT (SELECT a2.id FROM health_advisories a2 JOIN countries c2 ON a2.country_id = c2.id WHERE c2.country_code = 'RW'), 'Rabies (for long-term stays)'
  UNION ALL SELECT (SELECT a2.id FROM health_advisories a2 JOIN countries c2 ON a2.country_id = c2.id WHERE c2.country_code = 'RW'), 'Meningitis'
) AS v(advisory_id, vaccine);

INSERT IGNORE INTO health_risks (advisory_id, risk)
SELECT r.advisory_id, risk FROM (
  SELECT (SELECT a2.id FROM health_advisories a2 JOIN countries c2 ON a2.country_id = c2.id WHERE c2.country_code = 'RW') AS aid, 'Malaria' AS risk
  UNION ALL SELECT (SELECT a2.id FROM health_advisories a2 JOIN countries c2 ON a2.country_id = c2.id WHERE c2.country_code = 'RW'), 'Cholera'
  UNION ALL SELECT (SELECT a2.id FROM health_advisories a2 JOIN countries c2 ON a2.country_id = c2.id WHERE c2.country_code = 'RW'), 'Typhoid'
) AS r(advisory_id, risk);

INSERT IGNORE INTO health_recommended_vaccines (advisory_id, vaccine)
SELECT v.advisory_id, vaccine FROM (
  SELECT (SELECT a2.id FROM health_advisories a2 JOIN countries c2 ON a2.country_id = c2.id WHERE c2.country_code = 'KE') AS aid, 'Hepatitis A' AS vaccine
  UNION ALL SELECT (SELECT a2.id FROM health_advisories a2 JOIN countries c2 ON a2.country_id = c2.id WHERE c2.country_code = 'KE'), 'Typhoid'
  UNION ALL SELECT (SELECT a2.id FROM health_advisories a2 JOIN countries c2 ON a2.country_id = c2.id WHERE c2.country_code = 'KE'), 'Malaria prophylaxis'
  UNION ALL SELECT (SELECT a2.id FROM health_advisories a2 JOIN countries c2 ON a2.country_id = c2.id WHERE c2.country_code = 'KE'), 'Rabies'
  UNION ALL SELECT (SELECT a2.id FROM health_advisories a2 JOIN countries c2 ON a2.country_id = c2.id WHERE c2.country_code = 'KE'), 'Meningitis'
  UNION ALL SELECT (SELECT a2.id FROM health_advisories a2 JOIN countries c2 ON a2.country_id = c2.id WHERE c2.country_code = 'KE'), 'Cholera'
) AS v(advisory_id, vaccine);

INSERT IGNORE INTO health_risks (advisory_id, risk)
SELECT r.advisory_id, risk FROM (
  SELECT (SELECT a2.id FROM health_advisories a2 JOIN countries c2 ON a2.country_id = c2.id WHERE c2.country_code = 'KE') AS aid, 'Malaria' AS risk
  UNION ALL SELECT (SELECT a2.id FROM health_advisories a2 JOIN countries c2 ON a2.country_id = c2.id WHERE c2.country_code = 'KE'), 'Dengue'
  UNION ALL SELECT (SELECT a2.id FROM health_advisories a2 JOIN countries c2 ON a2.country_id = c2.id WHERE c2.country_code = 'KE'), 'Cholera'
) AS r(advisory_id, risk);

INSERT IGNORE INTO health_recommended_vaccines (advisory_id, vaccine)
SELECT v.advisory_id, vaccine FROM (
  SELECT (SELECT a2.id FROM health_advisories a2 JOIN countries c2 ON a2.country_id = c2.id WHERE c2.country_code = 'ZA') AS aid, 'Hepatitis A' AS vaccine
  UNION ALL SELECT (SELECT a2.id FROM health_advisories a2 JOIN countries c2 ON a2.country_id = c2.id WHERE c2.country_code = 'ZA'), 'Typhoid'
  UNION ALL SELECT (SELECT a2.id FROM health_advisories a2 JOIN countries c2 ON a2.country_id = c2.id WHERE c2.country_code = 'ZA'), 'Malaria prophylaxis (Limpopo & KwaZulu-Natal)'
  UNION ALL SELECT (SELECT a2.id FROM health_advisories a2 JOIN countries c2 ON a2.country_id = c2.id WHERE c2.country_code = 'ZA'), 'Rabies'
) AS v(advisory_id, vaccine);

INSERT IGNORE INTO health_risks (advisory_id, risk)
SELECT r.advisory_id, risk FROM (
  SELECT (SELECT a2.id FROM health_advisories a2 JOIN countries c2 ON a2.country_id = c2.id WHERE c2.country_code = 'ZA') AS aid, 'HIV' AS risk
  UNION ALL SELECT (SELECT a2.id FROM health_advisories a2 JOIN countries c2 ON a2.country_id = c2.id WHERE c2.country_code = 'ZA'), 'Malaria (north)'
  UNION ALL SELECT (SELECT a2.id FROM health_advisories a2 JOIN countries c2 ON a2.country_id = c2.id WHERE c2.country_code = 'ZA'), 'Tuberculosis'
) AS r(advisory_id, risk);

INSERT IGNORE INTO health_recommended_vaccines (advisory_id, vaccine)
SELECT v.advisory_id, vaccine FROM (
  SELECT (SELECT a2.id FROM health_advisories a2 JOIN countries c2 ON a2.country_id = c2.id WHERE c2.country_code = 'MA') AS aid, 'Hepatitis A' AS vaccine
  UNION ALL SELECT (SELECT a2.id FROM health_advisories a2 JOIN countries c2 ON a2.country_id = c2.id WHERE c2.country_code = 'MA'), 'Typhoid'
  UNION ALL SELECT (SELECT a2.id FROM health_advisories a2 JOIN countries c2 ON a2.country_id = c2.id WHERE c2.country_code = 'MA'), 'Rabies'
  UNION ALL SELECT (SELECT a2.id FROM health_advisories a2 JOIN countries c2 ON a2.country_id = c2.id WHERE c2.country_code = 'MA'), 'Hepatitis B'
) AS v(advisory_id, vaccine);

INSERT IGNORE INTO health_risks (advisory_id, risk)
SELECT r.advisory_id, risk FROM (
  SELECT (SELECT a2.id FROM health_advisories a2 JOIN countries c2 ON a2.country_id = c2.id WHERE c2.country_code = 'MA') AS aid, 'Hepatitis A' AS risk
  UNION ALL SELECT (SELECT a2.id FROM health_advisories a2 JOIN countries c2 ON a2.country_id = c2.id WHERE c2.country_code = 'MA'), 'Typhoid'
  UNION ALL SELECT (SELECT a2.id FROM health_advisories a2 JOIN countries c2 ON a2.country_id = c2.id WHERE c2.country_code = 'MA'), 'Rabies'
) AS r(advisory_id, risk);

INSERT IGNORE INTO health_recommended_vaccines (advisory_id, vaccine)
SELECT v.advisory_id, vaccine FROM (
  SELECT (SELECT a2.id FROM health_advisories a2 JOIN countries c2 ON a2.country_id = c2.id WHERE c2.country_code = 'TZ') AS aid, 'Hepatitis A' AS vaccine
  UNION ALL SELECT (SELECT a2.id FROM health_advisories a2 JOIN countries c2 ON a2.country_id = c2.id WHERE c2.country_code = 'TZ'), 'Typhoid'
  UNION ALL SELECT (SELECT a2.id FROM health_advisories a2 JOIN countries c2 ON a2.country_id = c2.id WHERE c2.country_code = 'TZ'), 'Malaria prophylaxis'
  UNION ALL SELECT (SELECT a2.id FROM health_advisories a2 JOIN countries c2 ON a2.country_id = c2.id WHERE c2.country_code = 'TZ'), 'Rabies'
  UNION ALL SELECT (SELECT a2.id FROM health_advisories a2 JOIN countries c2 ON a2.country_id = c2.id WHERE c2.country_code = 'TZ'), 'Meningitis'
  UNION ALL SELECT (SELECT a2.id FROM health_advisories a2 JOIN countries c2 ON a2.country_id = c2.id WHERE c2.country_code = 'TZ'), 'Cholera'
) AS v(advisory_id, vaccine);

INSERT IGNORE INTO health_risks (advisory_id, risk)
SELECT r.advisory_id, risk FROM (
  SELECT (SELECT a2.id FROM health_advisories a2 JOIN countries c2 ON a2.country_id = c2.id WHERE c2.country_code = 'TZ') AS aid, 'Malaria' AS risk
  UNION ALL SELECT (SELECT a2.id FROM health_advisories a2 JOIN countries c2 ON a2.country_id = c2.id WHERE c2.country_code = 'TZ'), 'Typhoid'
  UNION ALL SELECT (SELECT a2.id FROM health_advisories a2 JOIN countries c2 ON a2.country_id = c2.id WHERE c2.country_code = 'TZ'), 'Cholera'
) AS r(advisory_id, risk);

INSERT IGNORE INTO health_recommended_vaccines (advisory_id, vaccine)
SELECT v.advisory_id, vaccine FROM (
  SELECT (SELECT a2.id FROM health_advisories a2 JOIN countries c2 ON a2.country_id = c2.id WHERE c2.country_code = 'UG') AS aid, 'Hepatitis A' AS vaccine
  UNION ALL SELECT (SELECT a2.id FROM health_advisories a2 JOIN countries c2 ON a2.country_id = c2.id WHERE c2.country_code = 'UG'), 'Typhoid'
  UNION ALL SELECT (SELECT a2.id FROM health_advisories a2 JOIN countries c2 ON a2.country_id = c2.id WHERE c2.country_code = 'UG'), 'Malaria prophylaxis'
  UNION ALL SELECT (SELECT a2.id FROM health_advisories a2 JOIN countries c2 ON a2.country_id = c2.id WHERE c2.country_code = 'UG'), 'Rabies'
  UNION ALL SELECT (SELECT a2.id FROM health_advisories a2 JOIN countries c2 ON a2.country_id = c2.id WHERE c2.country_code = 'UG'), 'Meningitis'
  UNION ALL SELECT (SELECT a2.id FROM health_advisories a2 JOIN countries c2 ON a2.country_id = c2.id WHERE c2.country_code = 'UG'), 'Cholera'
) AS v(advisory_id, vaccine);

INSERT IGNORE INTO health_risks (advisory_id, risk)
SELECT r.advisory_id, risk FROM (
  SELECT (SELECT a2.id FROM health_advisories a2 JOIN countries c2 ON a2.country_id = c2.id WHERE c2.country_code = 'UG') AS aid, 'Malaria' AS risk
  UNION ALL SELECT (SELECT a2.id FROM health_advisories a2 JOIN countries c2 ON a2.country_id = c2.id WHERE c2.country_code = 'UG'), 'Cholera'
  UNION ALL SELECT (SELECT a2.id FROM health_advisories a2 JOIN countries c2 ON a2.country_id = c2.id WHERE c2.country_code = 'UG'), 'Ebola (monitoring)'
) AS r(advisory_id, risk);

INSERT IGNORE INTO health_recommended_vaccines (advisory_id, vaccine)
SELECT v.advisory_id, vaccine FROM (
  SELECT (SELECT a2.id FROM health_advisories a2 JOIN countries c2 ON a2.country_id = c2.id WHERE c2.country_code = 'NG') AS aid, 'Hepatitis A' AS vaccine
  UNION ALL SELECT (SELECT a2.id FROM health_advisories a2 JOIN countries c2 ON a2.country_id = c2.id WHERE c2.country_code = 'NG'), 'Typhoid'
  UNION ALL SELECT (SELECT a2.id FROM health_advisories a2 JOIN countries c2 ON a2.country_id = c2.id WHERE c2.country_code = 'NG'), 'Malaria prophylaxis'
  UNION ALL SELECT (SELECT a2.id FROM health_advisories a2 JOIN countries c2 ON a2.country_id = c2.id WHERE c2.country_code = 'NG'), 'Meningitis'
  UNION ALL SELECT (SELECT a2.id FROM health_advisories a2 JOIN countries c2 ON a2.country_id = c2.id WHERE c2.country_code = 'NG'), 'Polio booster'
  UNION ALL SELECT (SELECT a2.id FROM health_advisories a2 JOIN countries c2 ON a2.country_id = c2.id WHERE c2.country_code = 'NG'), 'Cholera'
) AS v(advisory_id, vaccine);

INSERT IGNORE INTO health_risks (advisory_id, risk)
SELECT r.advisory_id, risk FROM (
  SELECT (SELECT a2.id FROM health_advisories a2 JOIN countries c2 ON a2.country_id = c2.id WHERE c2.country_code = 'NG') AS aid, 'Malaria' AS risk
  UNION ALL SELECT (SELECT a2.id FROM health_advisories a2 JOIN countries c2 ON a2.country_id = c2.id WHERE c2.country_code = 'NG'), 'Lassa Fever'
  UNION ALL SELECT (SELECT a2.id FROM health_advisories a2 JOIN countries c2 ON a2.country_id = c2.id WHERE c2.country_code = 'NG'), 'Cholera'
) AS r(advisory_id, risk);

INSERT IGNORE INTO health_recommended_vaccines (advisory_id, vaccine)
SELECT v.advisory_id, vaccine FROM (
  SELECT (SELECT a2.id FROM health_advisories a2 JOIN countries c2 ON a2.country_id = c2.id WHERE c2.country_code = 'GH') AS aid, 'Hepatitis A' AS vaccine
  UNION ALL SELECT (SELECT a2.id FROM health_advisories a2 JOIN countries c2 ON a2.country_id = c2.id WHERE c2.country_code = 'GH'), 'Typhoid'
  UNION ALL SELECT (SELECT a2.id FROM health_advisories a2 JOIN countries c2 ON a2.country_id = c2.id WHERE c2.country_code = 'GH'), 'Malaria prophylaxis'
  UNION ALL SELECT (SELECT a2.id FROM health_advisories a2 JOIN countries c2 ON a2.country_id = c2.id WHERE c2.country_code = 'GH'), 'Meningitis'
  UNION ALL SELECT (SELECT a2.id FROM health_advisories a2 JOIN countries c2 ON a2.country_id = c2.id WHERE c2.country_code = 'GH'), 'Rabies'
  UNION ALL SELECT (SELECT a2.id FROM health_advisories a2 JOIN countries c2 ON a2.country_id = c2.id WHERE c2.country_code = 'GH'), 'Cholera'
) AS v(advisory_id, vaccine);

INSERT IGNORE INTO health_risks (advisory_id, risk)
SELECT r.advisory_id, risk FROM (
  SELECT (SELECT a2.id FROM health_advisories a2 JOIN countries c2 ON a2.country_id = c2.id WHERE c2.country_code = 'GH') AS aid, 'Malaria' AS risk
  UNION ALL SELECT (SELECT a2.id FROM health_advisories a2 JOIN countries c2 ON a2.country_id = c2.id WHERE c2.country_code = 'GH'), 'Typhoid'
  UNION ALL SELECT (SELECT a2.id FROM health_advisories a2 JOIN countries c2 ON a2.country_id = c2.id WHERE c2.country_code = 'GH'), 'Hepatitis A'
) AS r(advisory_id, risk);

INSERT IGNORE INTO health_recommended_vaccines (advisory_id, vaccine)
SELECT v.advisory_id, vaccine FROM (
  SELECT (SELECT a2.id FROM health_advisories a2 JOIN countries c2 ON a2.country_id = c2.id WHERE c2.country_code = 'ET') AS aid, 'Hepatitis A' AS vaccine
  UNION ALL SELECT (SELECT a2.id FROM health_advisories a2 JOIN countries c2 ON a2.country_id = c2.id WHERE c2.country_code = 'ET'), 'Typhoid'
  UNION ALL SELECT (SELECT a2.id FROM health_advisories a2 JOIN countries c2 ON a2.country_id = c2.id WHERE c2.country_code = 'ET'), 'Malaria prophylaxis'
  UNION ALL SELECT (SELECT a2.id FROM health_advisories a2 JOIN countries c2 ON a2.country_id = c2.id WHERE c2.country_code = 'ET'), 'Rabies'
  UNION ALL SELECT (SELECT a2.id FROM health_advisories a2 JOIN countries c2 ON a2.country_id = c2.id WHERE c2.country_code = 'ET'), 'Meningitis'
  UNION ALL SELECT (SELECT a2.id FROM health_advisories a2 JOIN countries c2 ON a2.country_id = c2.id WHERE c2.country_code = 'ET'), 'Cholera'
) AS v(advisory_id, vaccine);

INSERT IGNORE INTO health_risks (advisory_id, risk)
SELECT r.advisory_id, risk FROM (
  SELECT (SELECT a2.id FROM health_advisories a2 JOIN countries c2 ON a2.country_id = c2.id WHERE c2.country_code = 'ET') AS aid, 'Malaria (lowlands)' AS risk
  UNION ALL SELECT (SELECT a2.id FROM health_advisories a2 JOIN countries c2 ON a2.country_id = c2.id WHERE c2.country_code = 'ET'), 'Typhoid'
  UNION ALL SELECT (SELECT a2.id FROM health_advisories a2 JOIN countries c2 ON a2.country_id = c2.id WHERE c2.country_code = 'ET'), 'Cholera'
) AS r(advisory_id, risk);

INSERT IGNORE INTO health_recommended_vaccines (advisory_id, vaccine)
SELECT v.advisory_id, vaccine FROM (
  SELECT (SELECT a2.id FROM health_advisories a2 JOIN countries c2 ON a2.country_id = c2.id WHERE c2.country_code = 'SN') AS aid, 'Hepatitis A' AS vaccine
  UNION ALL SELECT (SELECT a2.id FROM health_advisories a2 JOIN countries c2 ON a2.country_id = c2.id WHERE c2.country_code = 'SN'), 'Typhoid'
  UNION ALL SELECT (SELECT a2.id FROM health_advisories a2 JOIN countries c2 ON a2.country_id = c2.id WHERE c2.country_code = 'SN'), 'Malaria prophylaxis'
  UNION ALL SELECT (SELECT a2.id FROM health_advisories a2 JOIN countries c2 ON a2.country_id = c2.id WHERE c2.country_code = 'SN'), 'Meningitis'
  UNION ALL SELECT (SELECT a2.id FROM health_advisories a2 JOIN countries c2 ON a2.country_id = c2.id WHERE c2.country_code = 'SN'), 'Rabies'
  UNION ALL SELECT (SELECT a2.id FROM health_advisories a2 JOIN countries c2 ON a2.country_id = c2.id WHERE c2.country_code = 'SN'), 'Cholera'
) AS v(advisory_id, vaccine);

INSERT IGNORE INTO health_risks (advisory_id, risk)
SELECT r.advisory_id, risk FROM (
  SELECT (SELECT a2.id FROM health_advisories a2 JOIN countries c2 ON a2.country_id = c2.id WHERE c2.country_code = 'SN') AS aid, 'Malaria' AS risk
  UNION ALL SELECT (SELECT a2.id FROM health_advisories a2 JOIN countries c2 ON a2.country_id = c2.id WHERE c2.country_code = 'SN'), 'Dengue'
  UNION ALL SELECT (SELECT a2.id FROM health_advisories a2 JOIN countries c2 ON a2.country_id = c2.id WHERE c2.country_code = 'SN'), 'Cholera'
) AS r(advisory_id, risk);

-- -- NEWS ---------------------------------------------------
INSERT IGNORE INTO news (title, content, country_code, category, published_at) VALUES
('Visa Changes for Kenya', 'Kenya has updated its e-visa process. New requirements include biometric data submission.', 'KE', 'visa', NOW()),
('Airport Updates in Tanzania', 'Kilimanjaro International Airport now offers 24/7 operations with new lounges.', 'TZ', 'airport', NOW()),
('Transportation Costs in Rwanda', 'Average taxi fare in Kigali has increased by 10% due to fuel prices.', 'RW', 'transportation', NOW()),
('General Travel Advisory', 'Check latest health guidelines before traveling to any African destination.', NULL, 'general', NOW());

-- -- ADS ----------------------------------------------------
INSERT IGNORE INTO advertisements (company_name, title, description, image_url, link_url, target_country) VALUES
('TravelAgency Inc.', 'Book Your African Safari', 'Exclusive deals on safaris in Kenya and Tanzania.', 'https://example.com/image1.jpg', 'https://travelagency.com', 'KE'),
('HotelChain Ltd.', 'Luxury Stays in Morocco', 'Experience the best hotels in Marrakech.', 'https://example.com/image2.jpg', 'https://hotelchain.com', 'MA'),
('Airline Co.', 'Flights to Ethiopia', 'Direct flights from major cities to Addis Ababa.', 'https://example.com/image3.jpg', 'https://airline.com', NULL);


