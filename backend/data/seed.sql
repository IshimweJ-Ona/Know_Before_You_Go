-- NOTE: Run this seed after selecting your target database.

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
SELECT c.id, 'eVisa or Visa on Arrival', 30, 'eVisa / Visa on Arrival',
       'Most nationalities require a visa. eVisa or Visa on Arrival available. eVisa portal: https://irembo.gov.rw/rolportal/en/web/minema/e-visa. Passport must be valid 6+ months beyond entry. Maximum stay: 30 days (extendable to 90 days). EAC citizens enter visa-free. Entry rules: return/onward ticket required; Yellow Fever certificate required if arriving from an endemic country. Fees: USD 50 single-entry / USD 70 multiple-entry. eVisa processing ~72 hours.'
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
SELECT c.id, '112', '912', '111', '112', '+250 788 311 155'
FROM countries c WHERE c.country_code = 'RW';

INSERT IGNORE INTO emergency_contacts (country_id, police_number, ambulance_number, fire_number, general_emergency, tourist_police)
SELECT c.id, '999', '999', '999', '999', '0800 723 715'
FROM countries c WHERE c.country_code = 'KE';

INSERT IGNORE INTO emergency_contacts (country_id, police_number, ambulance_number, fire_number, general_emergency, tourist_police)
SELECT c.id, '112', '112', '114', '112', '0800 110 003'
FROM countries c WHERE c.country_code = 'TZ';

INSERT IGNORE INTO emergency_contacts (country_id, police_number, ambulance_number, fire_number, general_emergency, tourist_police)
SELECT c.id, '999', '999', '999', '999', '0800 199 699'
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
SELECT c.id, '991', '907', '939', '991', '011 551 0666'
FROM countries c WHERE c.country_code = 'ET';

INSERT IGNORE INTO emergency_contacts (country_id, police_number, ambulance_number, fire_number, general_emergency, tourist_police)
SELECT c.id, '17', '15', '18', '112', '33 869 25 00'
FROM countries c WHERE c.country_code = 'SN';

-- -- ADMIN INVITES ---------------------------------------
INSERT IGNORE INTO admin_invites (email, is_active, created_by)
VALUES
  ('admin@kbyg.com', 1, 'seed'),
  ('kybg_tester', 1, 'seed');

-- -- ADMIN USER ------------------------------------------
INSERT IGNORE INTO users (email, full_name, role, password_hash, is_active, source)
VALUES
  ('kybg_tester', 'KBYG Tester', 'admin', '$2b$10$yqDyizbcMS5nOWef1FLUuOGLCJSqYxjIn7LhCE/lSRO/IL6OJwDvu', 1, 'seed');

-- -- CULTURAL GUIDELINES -----------------------------------
INSERT IGNORE INTO cultural_guidelines (country_id, dress_code)
SELECT c.id, 'Smart casual is acceptable in Kigali. Modest dress (covered shoulders and knees) required in rural areas, churches, and government offices. Beachwear only at lakeside resorts.'
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
         'Carry your national ID or passport at all times - police checks are common' AS item
  UNION ALL SELECT (SELECT id FROM cultural_guidelines WHERE country_id = (SELECT id FROM countries WHERE country_code = 'RW')),
         'Participate respectfully in Umuganda on the last Saturday of each month (roads close 8am-11am)'
  UNION ALL SELECT (SELECT id FROM cultural_guidelines WHERE country_id = (SELECT id FROM countries WHERE country_code = 'RW')),
         'Dress modestly outside Kigali and when visiting churches or rural communities'
  UNION ALL SELECT (SELECT id FROM cultural_guidelines WHERE country_id = (SELECT id FROM countries WHERE country_code = 'RW')),
         'Greet elders with both hands when shaking - a sign of respect'
  UNION ALL SELECT (SELECT id FROM cultural_guidelines WHERE country_id = (SELECT id FROM countries WHERE country_code = 'RW')),
         'Ask permission before photographing people, especially in rural areas'
  UNION ALL SELECT (SELECT id FROM cultural_guidelines WHERE country_id = (SELECT id FROM countries WHERE country_code = 'RW')),
         'Use designated bins - Rwanda takes littering seriously'
  UNION ALL SELECT (SELECT id FROM cultural_guidelines WHERE country_id = (SELECT id FROM countries WHERE country_code = 'RW')),
         'Carry small cash (Rwandan Franc) - not all vendors accept cards'
) AS g(guideline_id, item);

INSERT IGNORE INTO cultural_donts (guideline_id, item)
SELECT g.guideline_id, item FROM (
  SELECT (SELECT id FROM cultural_guidelines WHERE country_id = (SELECT id FROM countries WHERE country_code = 'RW')) AS gid,
         'Do not bring plastic bags - they are banned at entry points' AS item
  UNION ALL SELECT (SELECT id FROM cultural_guidelines WHERE country_id = (SELECT id FROM countries WHERE country_code = 'RW')),
         'Do not photograph military installations, government buildings, or border posts'
  UNION ALL SELECT (SELECT id FROM cultural_guidelines WHERE country_id = (SELECT id FROM countries WHERE country_code = 'RW')),
         'Do not litter - fines are strictly enforced'
  UNION ALL SELECT (SELECT id FROM cultural_guidelines WHERE country_id = (SELECT id FROM countries WHERE country_code = 'RW')),
         'Do not discuss the 1994 genocide insensitively'
  UNION ALL SELECT (SELECT id FROM cultural_guidelines WHERE country_id = (SELECT id FROM countries WHERE country_code = 'RW')),
         'Do not buy or sell wildlife products'
  UNION ALL SELECT (SELECT id FROM cultural_guidelines WHERE country_id = (SELECT id FROM countries WHERE country_code = 'RW')),
         'Do not use your left hand alone to give or receive items'
  UNION ALL SELECT (SELECT id FROM cultural_guidelines WHERE country_id = (SELECT id FROM countries WHERE country_code = 'RW')),
         'Do not assume all roads are open during Umuganda morning hours'
) AS g(guideline_id, item);

INSERT IGNORE INTO cultural_legal_warnings (guideline_id, title, description)
SELECT g.guideline_id, warning_title, warning_desc FROM (
  SELECT (SELECT id FROM cultural_guidelines WHERE country_id = (SELECT id FROM countries WHERE country_code = 'RW')) AS gid,
         'Plastic Bag Ban' AS warning_title,
         'Importing, selling, or using plastic bags is illegal. Customs will confiscate them on arrival.' AS warning_desc
  UNION ALL SELECT (SELECT id FROM cultural_guidelines WHERE country_id = (SELECT id FROM countries WHERE country_code = 'RW')),
         'LGBTQ+ Discretion',
         'Same-sex relationships are not explicitly criminalised, but travellers should exercise discretion.'
  UNION ALL SELECT (SELECT id FROM cultural_guidelines WHERE country_id = (SELECT id FROM countries WHERE country_code = 'RW')),
         'Drug Offences',
         'Drug offences carry heavy penalties including lengthy imprisonment.'
  UNION ALL SELECT (SELECT id FROM cultural_guidelines WHERE country_id = (SELECT id FROM countries WHERE country_code = 'RW')),
         'Government Criticism',
         'Publicly criticising the government or President can result in arrest.'
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
SELECT c.id, 'Carry a copy of all prescriptions. Antimalarials and most travel medications are available in Kigali pharmacies. Malaria prophylaxis is recommended. Drink bottled or boiled water; tap water is treated but bottled water is safer for visitors.', 1
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
  UNION ALL SELECT (SELECT a2.id FROM health_advisories a2 JOIN countries c2 ON a2.country_id = c2.id WHERE c2.country_code = 'RW'), 'Hepatitis B'
  UNION ALL SELECT (SELECT a2.id FROM health_advisories a2 JOIN countries c2 ON a2.country_id = c2.id WHERE c2.country_code = 'RW'), 'Typhoid'
  UNION ALL SELECT (SELECT a2.id FROM health_advisories a2 JOIN countries c2 ON a2.country_id = c2.id WHERE c2.country_code = 'RW'), 'Malaria prophylaxis'
  UNION ALL SELECT (SELECT a2.id FROM health_advisories a2 JOIN countries c2 ON a2.country_id = c2.id WHERE c2.country_code = 'RW'), 'Rabies (for extended rural stays)'
  UNION ALL SELECT (SELECT a2.id FROM health_advisories a2 JOIN countries c2 ON a2.country_id = c2.id WHERE c2.country_code = 'RW'), 'Meningitis'
  UNION ALL SELECT (SELECT a2.id FROM health_advisories a2 JOIN countries c2 ON a2.country_id = c2.id WHERE c2.country_code = 'RW'), 'Routine vaccinations (MMR, Tetanus, Polio)'
) AS v(advisory_id, vaccine);

INSERT IGNORE INTO health_risks (advisory_id, risk)
SELECT r.advisory_id, risk FROM (
  SELECT (SELECT a2.id FROM health_advisories a2 JOIN countries c2 ON a2.country_id = c2.id WHERE c2.country_code = 'RW') AS aid, 'Malaria' AS risk
  UNION ALL SELECT (SELECT a2.id FROM health_advisories a2 JOIN countries c2 ON a2.country_id = c2.id WHERE c2.country_code = 'RW'), 'Cholera'
  UNION ALL SELECT (SELECT a2.id FROM health_advisories a2 JOIN countries c2 ON a2.country_id = c2.id WHERE c2.country_code = 'RW'), 'Typhoid'
  UNION ALL SELECT (SELECT a2.id FROM health_advisories a2 JOIN countries c2 ON a2.country_id = c2.id WHERE c2.country_code = 'RW'), 'Bilharzia (schistosomiasis) in Lake Kivu'
) AS r(advisory_id, risk);

INSERT IGNORE INTO health_active_outbreaks (advisory_id, outbreak)
SELECT (SELECT a2.id FROM health_advisories a2 JOIN countries c2 ON a2.country_id = c2.id WHERE c2.country_code = 'RW') AS aid,
       'Monitor CDC/WHO for Ebola updates near the DRC border'
FROM dual;

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

-- ---------------------------------------------------------------------------
-- DOC OVERRIDES (March 2026) - Visa, Emergency, Dress Code
-- ---------------------------------------------------------------------------

-- Visa details
UPDATE visa_requirements v JOIN countries c ON v.country_id = c.id
SET v.visa_status = 'eTA Required',
    v.visa_free_days = 90,
    v.visa_title = 'Electronic Travel Authorisation (eTA)',
    v.visa_info = 'eTA required for most nationalities (replaced visa system in 2024). Apply at https://etakenya.go.ke. Passport valid 6+ months. Maximum stay 90 days. EAC citizens and some Commonwealth nationals are visa-free. Entry rules: eTA before travel, return/onward ticket, Yellow Fever certificate if arriving from endemic country. Cost USD 30. Processing ~72 hours.'
WHERE c.country_code = 'KE';

UPDATE visa_requirements v JOIN countries c ON v.country_id = c.id
SET v.visa_status = 'eVisa Required',
    v.visa_free_days = 90,
    v.visa_title = 'eVisa (Online)',
    v.visa_info = 'eVisa required for most nationalities. Apply at https://eservices.immigration.go.tz. Passport valid 6+ months. Maximum stay 90 days. EAC citizens have visa-free access. Entry rules: eVisa before travel, return ticket, Yellow Fever certificate if arriving from endemic country. Cost USD 50 single entry. Processing 3-5 business days.'
WHERE c.country_code = 'TZ';

UPDATE visa_requirements v JOIN countries c ON v.country_id = c.id
SET v.visa_status = 'eVisa Required',
    v.visa_free_days = 90,
    v.visa_title = 'eVisa / East Africa Tourist Visa',
    v.visa_info = 'eVisa required for most nationalities. Apply at https://visas.immigration.go.ug. Passport valid 6+ months. Maximum stay 90 days. Entry rules: eVisa before travel, Yellow Fever certificate mandatory for all travellers. East Africa Tourist Visa (Kenya/Uganda/Rwanda) USD 100. Single entry USD 50. Processing 3-5 business days.'
WHERE c.country_code = 'UG';

UPDATE visa_requirements v JOIN countries c ON v.country_id = c.id
SET v.visa_status = 'Visa Required',
    v.visa_free_days = 90,
    v.visa_title = 'eVisa / Visa on Arrival',
    v.visa_info = 'Visa required for most nationalities. eVisa or visa on arrival for eligible countries. Portal: https://immigration.gov.ng/visa-on-arrival/. Passport valid 6+ months. Maximum stay 90 days (varies). ECOWAS citizens visa-free for 90 days. Entry rules: return/onward travel, sufficient funds, Yellow Fever certificate mandatory. Processing 5-10 business days.'
WHERE c.country_code = 'NG';

UPDATE visa_requirements v JOIN countries c ON v.country_id = c.id
SET v.visa_status = 'Visa Required',
    v.visa_free_days = 60,
    v.visa_title = 'eVisa / Visa on Arrival',
    v.visa_info = 'Visa required for most non-ECOWAS nationals. eVisa portal: https://evisa.gov.gh. Passport valid 6+ months. Maximum stay 60 days (extendable). ECOWAS citizens visa-free for 90 days. Entry rules: return/onward ticket, Yellow Fever certificate mandatory. Cost USD 30-50. Processing 2-5 business days.'
WHERE c.country_code = 'GH';

UPDATE visa_requirements v JOIN countries c ON v.country_id = c.id
SET v.visa_status = 'Visa Free',
    v.visa_free_days = 90,
    v.visa_title = 'Visa-free Entry',
    v.visa_info = 'Most nationalities receive 90-day visa-free entry. Passport must be valid 30+ days beyond departure and have 2 blank pages. Proof of onward/return travel and sufficient funds may be required. Minors must carry full birth certificate and parental consent if travelling with one parent or alone. Official source: https://www.dha.gov.za'
WHERE c.country_code = 'ZA';

UPDATE visa_requirements v JOIN countries c ON v.country_id = c.id
SET v.visa_status = 'Visa Free',
    v.visa_free_days = 90,
    v.visa_title = 'Visa-free Entry',
    v.visa_info = 'Most nationalities receive 90-day visa-free entry. Passport valid 6+ months. Entry rules: return/onward ticket, sufficient funds, accommodation proof may be requested. Official source: https://www.diplomatie.ma'
WHERE c.country_code = 'MA';

UPDATE visa_requirements v JOIN countries c ON v.country_id = c.id
SET v.visa_status = 'eVisa Required',
    v.visa_free_days = 90,
    v.visa_title = 'eVisa (Online)',
    v.visa_info = 'eVisa required for most nationalities. Apply at https://www.evisa.gov.et. Passport valid 6+ months. Maximum stay 30 days (single entry) or 90 days (multiple entry). Yellow Fever certificate required if arriving from endemic country. Return ticket required. Cost USD 52 single entry. Processing 3 business days.'
WHERE c.country_code = 'ET';

UPDATE visa_requirements v JOIN countries c ON v.country_id = c.id
SET v.visa_status = 'Visa Free',
    v.visa_free_days = 90,
    v.visa_title = 'Visa-free Entry',
    v.visa_info = 'Most nationalities receive 90-day visa-free entry. Passport valid 6+ months. Entry rules: return/onward ticket, sufficient funds, Yellow Fever certificate required. Official source: https://www.diplomatie.sn'
WHERE c.country_code = 'SN';

-- Emergency contacts
UPDATE emergency_contacts e JOIN countries c ON e.country_id = c.id
SET e.police_number = '999 or 112',
    e.ambulance_number = '999 or 112',
    e.fire_number = '999 or 112',
    e.general_emergency = '112',
    e.tourist_police = '+254 20 604 767'
WHERE c.country_code = 'KE';

UPDATE emergency_contacts e JOIN countries c ON e.country_id = c.id
SET e.police_number = '112 or 999',
    e.ambulance_number = '112',
    e.fire_number = '114',
    e.general_emergency = '112',
    e.tourist_police = '+255 22 211 5047'
WHERE c.country_code = 'TZ';

UPDATE emergency_contacts e JOIN countries c ON e.country_id = c.id
SET e.police_number = '999 or 112',
    e.ambulance_number = '999 or 112',
    e.fire_number = '999 or 112',
    e.general_emergency = '112',
    e.tourist_police = '+256 414 233 222'
WHERE c.country_code = 'UG';

UPDATE emergency_contacts e JOIN countries c ON e.country_id = c.id
SET e.police_number = '199 or 112',
    e.ambulance_number = '199 or 112',
    e.fire_number = '199 or 112',
    e.general_emergency = '112',
    e.tourist_police = '+234 803 309 2194'
WHERE c.country_code = 'NG';

UPDATE emergency_contacts e JOIN countries c ON e.country_id = c.id
SET e.police_number = '191 or 112',
    e.ambulance_number = '193 or 112',
    e.fire_number = '192 or 112',
    e.general_emergency = '112',
    e.tourist_police = '+233 30 222 3355'
WHERE c.country_code = 'GH';

UPDATE emergency_contacts e JOIN countries c ON e.country_id = c.id
SET e.police_number = '10111 or 112',
    e.ambulance_number = '10177 or 112',
    e.fire_number = '10177 or 112',
    e.general_emergency = '112',
    e.tourist_police = '0860 010 111'
WHERE c.country_code = 'ZA';

UPDATE emergency_contacts e JOIN countries c ON e.country_id = c.id
SET e.police_number = '19 or 112',
    e.ambulance_number = '15 or 112',
    e.fire_number = '15 or 112',
    e.general_emergency = '112',
    e.tourist_police = '+212 5224-84601'
WHERE c.country_code = 'MA';

UPDATE emergency_contacts e JOIN countries c ON e.country_id = c.id
SET e.police_number = '991 or 112',
    e.ambulance_number = '907 or 112',
    e.fire_number = '939 or 112',
    e.general_emergency = '991',
    e.tourist_police = '+251 11 551 7788'
WHERE c.country_code = 'ET';

UPDATE emergency_contacts e JOIN countries c ON e.country_id = c.id
SET e.police_number = '17 or 112',
    e.ambulance_number = '15 or 112',
    e.fire_number = '18 or 112',
    e.general_emergency = '112',
    e.tourist_police = '+221 33 869 2232'
WHERE c.country_code = 'SN';

-- Dress codes
UPDATE cultural_guidelines g JOIN countries c ON g.country_id = c.id
SET g.dress_code = 'Casual in Nairobi and major cities. Modest dress required in coastal Muslim areas and when visiting mosques. Safari-appropriate neutral colours recommended in national parks.'
WHERE c.country_code = 'KE';

UPDATE cultural_guidelines g JOIN countries c ON g.country_id = c.id
SET g.dress_code = 'Conservative dress across Tanzania. In Zanzibar, women should cover shoulders and knees; men avoid sleeveless tops outside beach areas. Swimwear only at beach resorts and hotel pools.'
WHERE c.country_code = 'TZ';

UPDATE cultural_guidelines g JOIN countries c ON g.country_id = c.id
SET g.dress_code = 'Modest dress required across Uganda. Cover shoulders and knees in rural areas, churches, and mosques. Swimwear only at hotel pools and lakeside resorts.'
WHERE c.country_code = 'UG';

UPDATE cultural_guidelines g JOIN countries c ON g.country_id = c.id
SET g.dress_code = 'Business casual to smart in Lagos and Abuja. Conservative dress in northern states; women cover hair, arms, and legs. Traditional dress is welcomed at cultural events.'
WHERE c.country_code = 'NG';

UPDATE cultural_guidelines g JOIN countries c ON g.country_id = c.id
SET g.dress_code = 'Casual but respectful in Accra and coastal areas. Conservative dress in Muslim northern regions. Traditional kente cloth is welcomed at cultural events. Beach attire only at beach resorts.'
WHERE c.country_code = 'GH';

UPDATE cultural_guidelines g JOIN countries c ON g.country_id = c.id
SET g.dress_code = 'Relaxed and cosmopolitan. Business casual in city centres. Beach attire at coastal areas. Smart casual for restaurants. Conservative dress when visiting traditional communities.'
WHERE c.country_code = 'ZA';

UPDATE cultural_guidelines g JOIN countries c ON g.country_id = c.id
SET g.dress_code = 'Women should cover shoulders and knees in medinas and rural areas; head covering recommended in mosques. Men should avoid shorts in religious areas. Beachwear only at resort beaches.'
WHERE c.country_code = 'MA';

UPDATE cultural_guidelines g JOIN countries c ON g.country_id = c.id
SET g.dress_code = 'Conservative dress throughout Ethiopia. Women cover hair, shoulders, and knees at religious sites. Men wear long trousers in churches and mosques.'
WHERE c.country_code = 'ET';

UPDATE cultural_guidelines g JOIN countries c ON g.country_id = c.id
SET g.dress_code = 'Modest dress throughout Senegal. Women cover shoulders and knees outside beach areas. Men avoid sleeveless tops. Swimwear only at designated beach resorts.'
WHERE c.country_code = 'SN';

-- Advisory levels (from March 2026 doc)
UPDATE countries SET advisory_level = 2 WHERE country_code = 'KE';
UPDATE countries SET advisory_level = 2 WHERE country_code = 'TZ';
UPDATE countries SET advisory_level = 2 WHERE country_code = 'UG';
UPDATE countries SET advisory_level = 3 WHERE country_code = 'NG';
UPDATE countries SET advisory_level = 2 WHERE country_code = 'GH';
UPDATE countries SET advisory_level = 2 WHERE country_code = 'ZA';
UPDATE countries SET advisory_level = 2 WHERE country_code = 'MA';
UPDATE countries SET advisory_level = 3 WHERE country_code = 'ET';
UPDATE countries SET advisory_level = 2 WHERE country_code = 'SN';

-- Cultural dos/donts/legal warnings (March 2026 doc)
DELETE cd FROM cultural_dos cd
JOIN cultural_guidelines g ON cd.guideline_id = g.id
JOIN countries c ON g.country_id = c.id
WHERE c.country_code IN ('KE','TZ','UG','NG','GH','ZA','MA','ET','SN');

DELETE cd FROM cultural_donts cd
JOIN cultural_guidelines g ON cd.guideline_id = g.id
JOIN countries c ON g.country_id = c.id
WHERE c.country_code IN ('KE','TZ','UG','NG','GH','ZA','MA','ET','SN');

DELETE clw FROM cultural_legal_warnings clw
JOIN cultural_guidelines g ON clw.guideline_id = g.id
JOIN countries c ON g.country_id = c.id
WHERE c.country_code IN ('KE','TZ','UG','NG','GH','ZA','MA','ET','SN');

-- Kenya
INSERT IGNORE INTO cultural_dos (guideline_id, item)
SELECT g.id, 'Obtain your eTA at https://etakenya.go.ke before flying - airlines will deny boarding without it'
FROM cultural_guidelines g JOIN countries c ON g.country_id = c.id WHERE c.country_code = 'KE'
UNION ALL SELECT g.id, 'Carry a printed or digital copy of your eTA confirmation at all times' FROM cultural_guidelines g JOIN countries c ON g.country_id = c.id WHERE c.country_code = 'KE'
UNION ALL SELECT g.id, 'Use registered taxis or Uber/Bolt in Nairobi - do not hail unmarked vehicles' FROM cultural_guidelines g JOIN countries c ON g.country_id = c.id WHERE c.country_code = 'KE'
UNION ALL SELECT g.id, 'Bargain respectfully at markets - haggling is expected and part of the culture' FROM cultural_guidelines g JOIN countries c ON g.country_id = c.id WHERE c.country_code = 'KE'
UNION ALL SELECT g.id, 'Respect wildlife at all times in national parks - keep inside vehicles and maintain safe distances' FROM cultural_guidelines g JOIN countries c ON g.country_id = c.id WHERE c.country_code = 'KE'
UNION ALL SELECT g.id, 'Dress modestly when visiting mosques, especially along the coast (Mombasa, Lamu)' FROM cultural_guidelines g JOIN countries c ON g.country_id = c.id WHERE c.country_code = 'KE'
UNION ALL SELECT g.id, 'Greet people in Swahili - Jambo (hello) and Asante (thank you) are warmly received' FROM cultural_guidelines g JOIN countries c ON g.country_id = c.id WHERE c.country_code = 'KE';

INSERT IGNORE INTO cultural_donts (guideline_id, item)
SELECT g.id, 'Do not travel to border areas with Somalia, South Sudan, or Ethiopia without specific security advice'
FROM cultural_guidelines g JOIN countries c ON g.country_id = c.id WHERE c.country_code = 'KE'
UNION ALL SELECT g.id, 'Do not photograph police officers, military personnel, or government buildings without permission' FROM cultural_guidelines g JOIN countries c ON g.country_id = c.id WHERE c.country_code = 'KE'
UNION ALL SELECT g.id, 'Do not use plastic bags - banned nationwide since 2017, fines up to KES 4 million' FROM cultural_guidelines g JOIN countries c ON g.country_id = c.id WHERE c.country_code = 'KE'
UNION ALL SELECT g.id, 'Do not feed or approach wildlife in national parks' FROM cultural_guidelines g JOIN countries c ON g.country_id = c.id WHERE c.country_code = 'KE'
UNION ALL SELECT g.id, 'Do not accept rides from strangers or unlicensed vehicles, especially at night' FROM cultural_guidelines g JOIN countries c ON g.country_id = c.id WHERE c.country_code = 'KE'
UNION ALL SELECT g.id, 'Do not carry or use recreational drugs - severe penalties apply' FROM cultural_guidelines g JOIN countries c ON g.country_id = c.id WHERE c.country_code = 'KE'
UNION ALL SELECT g.id, 'Do not drink tap water outside of major hotels - use bottled water' FROM cultural_guidelines g JOIN countries c ON g.country_id = c.id WHERE c.country_code = 'KE';

INSERT IGNORE INTO cultural_legal_warnings (guideline_id, title, description)
SELECT g.id, 'Plastic Bag Ban', 'Importing or using plastic bags is illegal and can result in heavy fines.'
FROM cultural_guidelines g JOIN countries c ON g.country_id = c.id WHERE c.country_code = 'KE'
UNION ALL SELECT g.id, 'Same-Sex Relations', 'Same-sex relationships are criminalised - travellers should exercise extreme caution.' FROM cultural_guidelines g JOIN countries c ON g.country_id = c.id WHERE c.country_code = 'KE'
UNION ALL SELECT g.id, 'Wildlife Trafficking', 'Wildlife trafficking carries a minimum 5-year prison sentence.' FROM cultural_guidelines g JOIN countries c ON g.country_id = c.id WHERE c.country_code = 'KE'
UNION ALL SELECT g.id, 'Corruption', 'Do not offer bribes to police officers - it is illegal and increasingly prosecuted.' FROM cultural_guidelines g JOIN countries c ON g.country_id = c.id WHERE c.country_code = 'KE';

-- Tanzania
INSERT IGNORE INTO cultural_dos (guideline_id, item)
SELECT g.id, 'Apply for your eVisa well in advance at https://eservices.immigration.go.tz'
FROM cultural_guidelines g JOIN countries c ON g.country_id = c.id WHERE c.country_code = 'TZ'
UNION ALL SELECT g.id, 'Dress very modestly in Zanzibar and all Muslim communities - strongly expected' FROM cultural_guidelines g JOIN countries c ON g.country_id = c.id WHERE c.country_code = 'TZ'
UNION ALL SELECT g.id, 'Remove shoes before entering mosques and some traditional homes' FROM cultural_guidelines g JOIN countries c ON g.country_id = c.id WHERE c.country_code = 'TZ'
UNION ALL SELECT g.id, 'Greet locals with Habari - Tanzanians appreciate Swahili greetings' FROM cultural_guidelines g JOIN countries c ON g.country_id = c.id WHERE c.country_code = 'TZ'
UNION ALL SELECT g.id, 'Book safaris and Kilimanjaro climbs through licensed operators only' FROM cultural_guidelines g JOIN countries c ON g.country_id = c.id WHERE c.country_code = 'TZ'
UNION ALL SELECT g.id, 'Carry cash (Tanzanian Shilling or USD) in rural areas - card acceptance is limited' FROM cultural_guidelines g JOIN countries c ON g.country_id = c.id WHERE c.country_code = 'TZ'
UNION ALL SELECT g.id, 'Respect local customs around photography - always ask first' FROM cultural_guidelines g JOIN countries c ON g.country_id = c.id WHERE c.country_code = 'TZ';

INSERT IGNORE INTO cultural_donts (guideline_id, item)
SELECT g.id, 'Do not display affection publicly, especially in Zanzibar'
FROM cultural_guidelines g JOIN countries c ON g.country_id = c.id WHERE c.country_code = 'TZ'
UNION ALL SELECT g.id, 'Do not photograph without permission - especially in Muslim communities' FROM cultural_guidelines g JOIN countries c ON g.country_id = c.id WHERE c.country_code = 'TZ'
UNION ALL SELECT g.id, 'Do not bring or use plastic bags - banned nationwide' FROM cultural_guidelines g JOIN countries c ON g.country_id = c.id WHERE c.country_code = 'TZ'
UNION ALL SELECT g.id, 'Do not attempt to climb Kilimanjaro without a licensed guide - it is illegal and dangerous' FROM cultural_guidelines g JOIN countries c ON g.country_id = c.id WHERE c.country_code = 'TZ'
UNION ALL SELECT g.id, 'Do not travel to the Mozambique border area without current security advice' FROM cultural_guidelines g JOIN countries c ON g.country_id = c.id WHERE c.country_code = 'TZ'
UNION ALL SELECT g.id, 'Do not buy, sell, or transport ivory or wildlife products - severe prison sentences apply' FROM cultural_guidelines g JOIN countries c ON g.country_id = c.id WHERE c.country_code = 'TZ'
UNION ALL SELECT g.id, 'Do not drink tap water - bottled water is essential throughout Tanzania' FROM cultural_guidelines g JOIN countries c ON g.country_id = c.id WHERE c.country_code = 'TZ';

INSERT IGNORE INTO cultural_legal_warnings (guideline_id, title, description)
SELECT g.id, 'Same-Sex Relations', 'Same-sex relationships are criminalised with penalties up to 30 years imprisonment.'
FROM cultural_guidelines g JOIN countries c ON g.country_id = c.id WHERE c.country_code = 'TZ'
UNION ALL SELECT g.id, 'Wildlife Trafficking', 'Mandatory minimum 20-year sentence for ivory or rhino horn possession.' FROM cultural_guidelines g JOIN countries c ON g.country_id = c.id WHERE c.country_code = 'TZ'
UNION ALL SELECT g.id, 'Drug Offences', 'Drug offences carry life imprisonment or death penalty in serious cases.' FROM cultural_guidelines g JOIN countries c ON g.country_id = c.id WHERE c.country_code = 'TZ'
UNION ALL SELECT g.id, 'Zanzibar Laws', 'Zanzibar has its own more conservative laws and cultural expectations than mainland Tanzania.' FROM cultural_guidelines g JOIN countries c ON g.country_id = c.id WHERE c.country_code = 'TZ';

-- Uganda
INSERT IGNORE INTO cultural_dos (guideline_id, item)
SELECT g.id, 'Get your Yellow Fever vaccination and carry the physical certificate - it is checked at entry'
FROM cultural_guidelines g JOIN countries c ON g.country_id = c.id WHERE c.country_code = 'UG'
UNION ALL SELECT g.id, 'Apply for the East Africa Tourist Visa if visiting Kenya and Rwanda in the same trip' FROM cultural_guidelines g JOIN countries c ON g.country_id = c.id WHERE c.country_code = 'UG'
UNION ALL SELECT g.id, 'Dress modestly, especially in rural areas and when visiting religious sites' FROM cultural_guidelines g JOIN countries c ON g.country_id = c.id WHERE c.country_code = 'UG'
UNION ALL SELECT g.id, 'Ask permission before photographing people, especially in traditional communities and near Bwindi forest' FROM cultural_guidelines g JOIN countries c ON g.country_id = c.id WHERE c.country_code = 'UG'
UNION ALL SELECT g.id, 'Book gorilla trekking permits well in advance through the Uganda Wildlife Authority' FROM cultural_guidelines g JOIN countries c ON g.country_id = c.id WHERE c.country_code = 'UG'
UNION ALL SELECT g.id, 'Use registered boda-bodas and always wear the provided helmet' FROM cultural_guidelines g JOIN countries c ON g.country_id = c.id WHERE c.country_code = 'UG'
UNION ALL SELECT g.id, 'Exchange money at banks or authorised forex bureaux - street exchange is risky' FROM cultural_guidelines g JOIN countries c ON g.country_id = c.id WHERE c.country_code = 'UG';

INSERT IGNORE INTO cultural_donts (guideline_id, item)
SELECT g.id, 'Do not enter Uganda without a Yellow Fever certificate - entry will be refused'
FROM cultural_guidelines g JOIN countries c ON g.country_id = c.id WHERE c.country_code = 'UG'
UNION ALL SELECT g.id, 'Do not photograph the President''s residence, military, or government buildings' FROM cultural_guidelines g JOIN countries c ON g.country_id = c.id WHERE c.country_code = 'UG'
UNION ALL SELECT g.id, 'Do not travel to the Democratic Republic of Congo border without current security advice' FROM cultural_guidelines g JOIN countries c ON g.country_id = c.id WHERE c.country_code = 'UG'
UNION ALL SELECT g.id, 'Do not engage in any same-sex conduct - it is criminalised with severe penalties' FROM cultural_guidelines g JOIN countries c ON g.country_id = c.id WHERE c.country_code = 'UG'
UNION ALL SELECT g.id, 'Do not purchase or possess wildlife products including gorilla souvenirs' FROM cultural_guidelines g JOIN countries c ON g.country_id = c.id WHERE c.country_code = 'UG'
UNION ALL SELECT g.id, 'Do not use plastic bags - banned' FROM cultural_guidelines g JOIN countries c ON g.country_id = c.id WHERE c.country_code = 'UG'
UNION ALL SELECT g.id, 'Do not drink tap water - use bottled water throughout Uganda' FROM cultural_guidelines g JOIN countries c ON g.country_id = c.id WHERE c.country_code = 'UG';

INSERT IGNORE INTO cultural_legal_warnings (guideline_id, title, description)
SELECT g.id, 'Anti-Homosexuality Act (2023)', 'Severe penalties including the death penalty in some cases - travellers face serious risk.'
FROM cultural_guidelines g JOIN countries c ON g.country_id = c.id WHERE c.country_code = 'UG'
UNION ALL SELECT g.id, 'Yellow Fever Certificate', 'Yellow Fever certificate is a legal entry requirement - not optional.' FROM cultural_guidelines g JOIN countries c ON g.country_id = c.id WHERE c.country_code = 'UG'
UNION ALL SELECT g.id, 'Drug Trafficking', 'Drug trafficking carries the death penalty.' FROM cultural_guidelines g JOIN countries c ON g.country_id = c.id WHERE c.country_code = 'UG'
UNION ALL SELECT g.id, 'Bribery', 'Bribery of officials is illegal - do not offer money to police or border officers.' FROM cultural_guidelines g JOIN countries c ON g.country_id = c.id WHERE c.country_code = 'UG';

-- Nigeria
INSERT IGNORE INTO cultural_dos (guideline_id, item)
SELECT g.id, 'Register your arrival with your country''s embassy or high commission'
FROM cultural_guidelines g JOIN countries c ON g.country_id = c.id WHERE c.country_code = 'NG'
UNION ALL SELECT g.id, 'Use only reputable hotels with security - avoid budget accommodation in unfamiliar areas' FROM cultural_guidelines g JOIN countries c ON g.country_id = c.id WHERE c.country_code = 'NG'
UNION ALL SELECT g.id, 'Hire a trusted local guide or driver - locals know which areas are safe' FROM cultural_guidelines g JOIN countries c ON g.country_id = c.id WHERE c.country_code = 'NG'
UNION ALL SELECT g.id, 'Carry Yellow Fever certificate at all times - checked at airports and sometimes inland' FROM cultural_guidelines g JOIN countries c ON g.country_id = c.id WHERE c.country_code = 'NG'
UNION ALL SELECT g.id, 'Use ATMs inside banks or hotels - street ATMs have higher skimming risk' FROM cultural_guidelines g JOIN countries c ON g.country_id = c.id WHERE c.country_code = 'NG'
UNION ALL SELECT g.id, 'Respect Islamic customs and prayer times in northern Nigeria' FROM cultural_guidelines g JOIN countries c ON g.country_id = c.id WHERE c.country_code = 'NG'
UNION ALL SELECT g.id, 'Keep valuables secured and avoid displaying expensive items in public' FROM cultural_guidelines g JOIN countries c ON g.country_id = c.id WHERE c.country_code = 'NG';

INSERT IGNORE INTO cultural_donts (guideline_id, item)
SELECT g.id, 'Do not travel to northeast Nigeria (Borno, Yobe, Adamawa) - active Boko Haram/ISWAP operations'
FROM cultural_guidelines g JOIN countries c ON g.country_id = c.id WHERE c.country_code = 'NG'
UNION ALL SELECT g.id, 'Do not travel to the Niger Delta without specific security clearance' FROM cultural_guidelines g JOIN countries c ON g.country_id = c.id WHERE c.country_code = 'NG'
UNION ALL SELECT g.id, 'Do not accept drinks or food from strangers - drug-facilitated robbery reported' FROM cultural_guidelines g JOIN countries c ON g.country_id = c.id WHERE c.country_code = 'NG'
UNION ALL SELECT g.id, 'Do not photograph airports, military installations, or government buildings' FROM cultural_guidelines g JOIN countries c ON g.country_id = c.id WHERE c.country_code = 'NG'
UNION ALL SELECT g.id, 'Do not use unregistered yellow buses or motorcycle taxis in Lagos' FROM cultural_guidelines g JOIN countries c ON g.country_id = c.id WHERE c.country_code = 'NG'
UNION ALL SELECT g.id, 'Do not engage in cryptocurrency or advance-fee fraud schemes' FROM cultural_guidelines g JOIN countries c ON g.country_id = c.id WHERE c.country_code = 'NG'
UNION ALL SELECT g.id, 'Do not travel at night by road between cities - armed robbery risk on intercity highways' FROM cultural_guidelines g JOIN countries c ON g.country_id = c.id WHERE c.country_code = 'NG';

INSERT IGNORE INTO cultural_legal_warnings (guideline_id, title, description)
SELECT g.id, 'Same-Sex Relations', 'Same-sex relationships are criminalised - up to 14 years imprisonment in southern states; death by stoning in some northern states under Sharia law.'
FROM cultural_guidelines g JOIN countries c ON g.country_id = c.id WHERE c.country_code = 'NG'
UNION ALL SELECT g.id, 'Drug Trafficking', 'Drug trafficking carries the death penalty.' FROM cultural_guidelines g JOIN countries c ON g.country_id = c.id WHERE c.country_code = 'NG'
UNION ALL SELECT g.id, 'Cybercrime Laws', 'Cybercrime laws are broadly worded - be careful about social media posts critical of the government.' FROM cultural_guidelines g JOIN countries c ON g.country_id = c.id WHERE c.country_code = 'NG'
UNION ALL SELECT g.id, 'Currency Regulations', 'Declare large amounts of foreign currency at entry.' FROM cultural_guidelines g JOIN countries c ON g.country_id = c.id WHERE c.country_code = 'NG';

-- Ghana
INSERT IGNORE INTO cultural_dos (guideline_id, item)
SELECT g.id, 'Enjoy Ghana with normal precautions - one of West Africa''s most stable and tourist-friendly countries'
FROM cultural_guidelines g JOIN countries c ON g.country_id = c.id WHERE c.country_code = 'GH'
UNION ALL SELECT g.id, 'Use the official eVisa portal before travelling - visa on arrival is possible but eVisa is smoother' FROM cultural_guidelines g JOIN countries c ON g.country_id = c.id WHERE c.country_code = 'GH'
UNION ALL SELECT g.id, 'Carry your Yellow Fever certificate - checked at entry' FROM cultural_guidelines g JOIN countries c ON g.country_id = c.id WHERE c.country_code = 'GH'
UNION ALL SELECT g.id, 'Greet people warmly - Ghanaians appreciate polite interaction' FROM cultural_guidelines g JOIN countries c ON g.country_id = c.id WHERE c.country_code = 'GH'
UNION ALL SELECT g.id, 'Use the right hand or both hands when giving, receiving, or greeting' FROM cultural_guidelines g JOIN countries c ON g.country_id = c.id WHERE c.country_code = 'GH'
UNION ALL SELECT g.id, 'Bargain respectfully at local markets - culturally expected' FROM cultural_guidelines g JOIN countries c ON g.country_id = c.id WHERE c.country_code = 'GH'
UNION ALL SELECT g.id, 'Visit Cape Coast Castle with respect - deeply significant memorial site' FROM cultural_guidelines g JOIN countries c ON g.country_id = c.id WHERE c.country_code = 'GH';

INSERT IGNORE INTO cultural_donts (guideline_id, item)
SELECT g.id, 'Do not use your left hand alone to eat, give, or receive - it is culturally disrespectful'
FROM cultural_guidelines g JOIN countries c ON g.country_id = c.id WHERE c.country_code = 'GH'
UNION ALL SELECT g.id, 'Do not photograph military installations, police stations, or government buildings without permission' FROM cultural_guidelines g JOIN countries c ON g.country_id = c.id WHERE c.country_code = 'GH'
UNION ALL SELECT g.id, 'Do not travel to northern border regions with Burkina Faso without current security advice' FROM cultural_guidelines g JOIN countries c ON g.country_id = c.id WHERE c.country_code = 'GH'
UNION ALL SELECT g.id, 'Do not buy or sell wildlife products' FROM cultural_guidelines g JOIN countries c ON g.country_id = c.id WHERE c.country_code = 'GH'
UNION ALL SELECT g.id, 'Do not carry or use drugs - penalties are severe' FROM cultural_guidelines g JOIN countries c ON g.country_id = c.id WHERE c.country_code = 'GH'
UNION ALL SELECT g.id, 'Do not drink tap water - use bottled water' FROM cultural_guidelines g JOIN countries c ON g.country_id = c.id WHERE c.country_code = 'GH'
UNION ALL SELECT g.id, 'Do not leave valuables unattended on beaches in Accra' FROM cultural_guidelines g JOIN countries c ON g.country_id = c.id WHERE c.country_code = 'GH';

INSERT IGNORE INTO cultural_legal_warnings (guideline_id, title, description)
SELECT g.id, 'Same-Sex Relations', 'Same-sex relationships are illegal. The Human Sexual Rights and Family Values Act (2024) increased penalties.'
FROM cultural_guidelines g JOIN countries c ON g.country_id = c.id WHERE c.country_code = 'GH'
UNION ALL SELECT g.id, 'Drug Offences', 'Drug offences carry minimum 5-year imprisonment.' FROM cultural_guidelines g JOIN countries c ON g.country_id = c.id WHERE c.country_code = 'GH'
UNION ALL SELECT g.id, 'Cybercrime Laws', 'Laws prohibit spreading false news - be careful with social media content.' FROM cultural_guidelines g JOIN countries c ON g.country_id = c.id WHERE c.country_code = 'GH'
UNION ALL SELECT g.id, 'Cultural Artefacts', 'Export of undeclared antiques or cultural artefacts is prohibited.' FROM cultural_guidelines g JOIN countries c ON g.country_id = c.id WHERE c.country_code = 'GH';

-- South Africa
INSERT IGNORE INTO cultural_dos (guideline_id, item)
SELECT g.id, 'Be security-conscious - high crime rates in urban areas'
FROM cultural_guidelines g JOIN countries c ON g.country_id = c.id WHERE c.country_code = 'ZA'
UNION ALL SELECT g.id, 'Use e-hailing apps (Uber, Bolt) rather than hailing taxis on the street' FROM cultural_guidelines g JOIN countries c ON g.country_id = c.id WHERE c.country_code = 'ZA'
UNION ALL SELECT g.id, 'Keep car doors locked and windows up when driving in cities, especially at traffic lights' FROM cultural_guidelines g JOIN countries c ON g.country_id = c.id WHERE c.country_code = 'ZA'
UNION ALL SELECT g.id, 'Store valuables in hotel safes - do not leave anything visible in parked cars' FROM cultural_guidelines g JOIN countries c ON g.country_id = c.id WHERE c.country_code = 'ZA'
UNION ALL SELECT g.id, 'Carry copies of your passport and visa - leave originals in the hotel safe' FROM cultural_guidelines g JOIN countries c ON g.country_id = c.id WHERE c.country_code = 'ZA'
UNION ALL SELECT g.id, 'Visit national parks for world-class wildlife experiences' FROM cultural_guidelines g JOIN countries c ON g.country_id = c.id WHERE c.country_code = 'ZA'
UNION ALL SELECT g.id, 'Tip service staff 10-15 percent - expected in restaurants' FROM cultural_guidelines g JOIN countries c ON g.country_id = c.id WHERE c.country_code = 'ZA';

INSERT IGNORE INTO cultural_donts (guideline_id, item)
SELECT g.id, 'Do not walk alone at night in Johannesburg CBD, Cape Town CBD, or Durban beachfront'
FROM cultural_guidelines g JOIN countries c ON g.country_id = c.id WHERE c.country_code = 'ZA'
UNION ALL SELECT g.id, 'Do not display expensive jewellery, cameras, or phones in public' FROM cultural_guidelines g JOIN countries c ON g.country_id = c.id WHERE c.country_code = 'ZA'
UNION ALL SELECT g.id, 'Do not stop for strangers gesturing about car trouble on highways - common robbery technique' FROM cultural_guidelines g JOIN countries c ON g.country_id = c.id WHERE c.country_code = 'ZA'
UNION ALL SELECT g.id, 'Do not exchange money on the street' FROM cultural_guidelines g JOIN countries c ON g.country_id = c.id WHERE c.country_code = 'ZA'
UNION ALL SELECT g.id, 'Do not drink and drive - zero tolerance enforced' FROM cultural_guidelines g JOIN countries c ON g.country_id = c.id WHERE c.country_code = 'ZA'
UNION ALL SELECT g.id, 'Do not approach wildlife in game reserves on foot without a licensed ranger' FROM cultural_guidelines g JOIN countries c ON g.country_id = c.id WHERE c.country_code = 'ZA'
UNION ALL SELECT g.id, 'Do not travel to Cape Flats, Alexandra, Hillbrow, or Umlazi without a local guide' FROM cultural_guidelines g JOIN countries c ON g.country_id = c.id WHERE c.country_code = 'ZA';

INSERT IGNORE INTO cultural_legal_warnings (guideline_id, title, description)
SELECT g.id, 'LGBTQ+ Rights', 'Same-sex relationships are legal and constitutional rights are protected.'
FROM cultural_guidelines g JOIN countries c ON g.country_id = c.id WHERE c.country_code = 'ZA'
UNION ALL SELECT g.id, 'Cannabis', 'Decriminalised for personal use in private - public use and sale remain illegal.' FROM cultural_guidelines g JOIN countries c ON g.country_id = c.id WHERE c.country_code = 'ZA'
UNION ALL SELECT g.id, 'Road Safety', 'One of the world''s highest road fatality rates - drive defensively.' FROM cultural_guidelines g JOIN countries c ON g.country_id = c.id WHERE c.country_code = 'ZA'
UNION ALL SELECT g.id, 'Minors Travel Rule', 'Children under 18 must carry a full birth certificate; parental consent required if travelling with one parent or alone.' FROM cultural_guidelines g JOIN countries c ON g.country_id = c.id WHERE c.country_code = 'ZA';

-- Morocco
INSERT IGNORE INTO cultural_dos (guideline_id, item)
SELECT g.id, 'Dress modestly - Morocco is a Muslim-majority country and conservative dress is respected in medinas'
FROM cultural_guidelines g JOIN countries c ON g.country_id = c.id WHERE c.country_code = 'MA'
UNION ALL SELECT g.id, 'Accept mint tea when offered - refusing hospitality is considered impolite' FROM cultural_guidelines g JOIN countries c ON g.country_id = c.id WHERE c.country_code = 'MA'
UNION ALL SELECT g.id, 'Bargain in souks - expected and part of the shopping experience' FROM cultural_guidelines g JOIN countries c ON g.country_id = c.id WHERE c.country_code = 'MA'
UNION ALL SELECT g.id, 'Learn a few basic French or Darija phrases - locals appreciate the effort' FROM cultural_guidelines g JOIN countries c ON g.country_id = c.id WHERE c.country_code = 'MA'
UNION ALL SELECT g.id, 'Respect prayer times - businesses may close briefly during the 5 daily prayers' FROM cultural_guidelines g JOIN countries c ON g.country_id = c.id WHERE c.country_code = 'MA'
UNION ALL SELECT g.id, 'Use licensed guides in medinas - unofficial guides often lead to commission shops' FROM cultural_guidelines g JOIN countries c ON g.country_id = c.id WHERE c.country_code = 'MA'
UNION ALL SELECT g.id, 'Visit the hammam (traditional bathhouse) for a cultural experience' FROM cultural_guidelines g JOIN countries c ON g.country_id = c.id WHERE c.country_code = 'MA';

INSERT IGNORE INTO cultural_donts (guideline_id, item)
SELECT g.id, 'Do not display public affection between couples - illegal in public and will cause offence'
FROM cultural_guidelines g JOIN countries c ON g.country_id = c.id WHERE c.country_code = 'MA'
UNION ALL SELECT g.id, 'Do not eat, drink, or smoke in public during Ramadan daylight hours - illegal and disrespectful' FROM cultural_guidelines g JOIN countries c ON g.country_id = c.id WHERE c.country_code = 'MA'
UNION ALL SELECT g.id, 'Do not photograph people without permission, especially women in medinas' FROM cultural_guidelines g JOIN countries c ON g.country_id = c.id WHERE c.country_code = 'MA'
UNION ALL SELECT g.id, 'Do not accept invitations to private homes from strangers in tourist areas - common scam' FROM cultural_guidelines g JOIN countries c ON g.country_id = c.id WHERE c.country_code = 'MA'
UNION ALL SELECT g.id, 'Do not buy or sell kif (cannabis) - illegal for tourists' FROM cultural_guidelines g JOIN countries c ON g.country_id = c.id WHERE c.country_code = 'MA'
UNION ALL SELECT g.id, 'Do not wear revealing clothing in medinas, mosques, or rural areas' FROM cultural_guidelines g JOIN countries c ON g.country_id = c.id WHERE c.country_code = 'MA'
UNION ALL SELECT g.id, 'Do not enter mosques unless specifically open to non-Muslims' FROM cultural_guidelines g JOIN countries c ON g.country_id = c.id WHERE c.country_code = 'MA';

INSERT IGNORE INTO cultural_legal_warnings (guideline_id, title, description)
SELECT g.id, 'Public Affection', 'Public displays of affection between unmarried couples are illegal.'
FROM cultural_guidelines g JOIN countries c ON g.country_id = c.id WHERE c.country_code = 'MA'
UNION ALL SELECT g.id, 'Ramadan Rules', 'Eating or drinking in public during Ramadan daylight hours is illegal.' FROM cultural_guidelines g JOIN countries c ON g.country_id = c.id WHERE c.country_code = 'MA'
UNION ALL SELECT g.id, 'Same-Sex Relations', 'Same-sex relationships are criminalised - penalties up to 3 years imprisonment.' FROM cultural_guidelines g JOIN countries c ON g.country_id = c.id WHERE c.country_code = 'MA'
UNION ALL SELECT g.id, 'Royal Criticism', 'Criticising the King or royal family is a serious criminal offence.' FROM cultural_guidelines g JOIN countries c ON g.country_id = c.id WHERE c.country_code = 'MA';

-- Ethiopia
INSERT IGNORE INTO cultural_dos (guideline_id, item)
SELECT g.id, 'Apply for your eVisa well in advance - allow at least 1 week'
FROM cultural_guidelines g JOIN countries c ON g.country_id = c.id WHERE c.country_code = 'ET'
UNION ALL SELECT g.id, 'Carry your Yellow Fever certificate if arriving from an endemic country' FROM cultural_guidelines g JOIN countries c ON g.country_id = c.id WHERE c.country_code = 'ET'
UNION ALL SELECT g.id, 'Dress conservatively when visiting Orthodox churches and monasteries' FROM cultural_guidelines g JOIN countries c ON g.country_id = c.id WHERE c.country_code = 'ET'
UNION ALL SELECT g.id, 'Remove shoes when entering churches and mosques - mandatory' FROM cultural_guidelines g JOIN countries c ON g.country_id = c.id WHERE c.country_code = 'ET'
UNION ALL SELECT g.id, 'Respect religious fasting periods - many restaurants modify menus' FROM cultural_guidelines g JOIN countries c ON g.country_id = c.id WHERE c.country_code = 'ET'
UNION ALL SELECT g.id, 'Register with your embassy upon arrival if staying more than 1 week' FROM cultural_guidelines g JOIN countries c ON g.country_id = c.id WHERE c.country_code = 'ET'
UNION ALL SELECT g.id, 'Use authorised forex offices or banks - unofficial exchanges are illegal' FROM cultural_guidelines g JOIN countries c ON g.country_id = c.id WHERE c.country_code = 'ET';

INSERT IGNORE INTO cultural_donts (guideline_id, item)
SELECT g.id, 'Do not travel to Tigray, Afar, Amhara, or Somali regions without current security clearance'
FROM cultural_guidelines g JOIN countries c ON g.country_id = c.id WHERE c.country_code = 'ET'
UNION ALL SELECT g.id, 'Do not photograph military installations, government buildings, airports, or defence infrastructure' FROM cultural_guidelines g JOIN countries c ON g.country_id = c.id WHERE c.country_code = 'ET'
UNION ALL SELECT g.id, 'Do not photograph people without permission, especially in traditional communities' FROM cultural_guidelines g JOIN countries c ON g.country_id = c.id WHERE c.country_code = 'ET'
UNION ALL SELECT g.id, 'Do not travel by road at night outside Addis Ababa' FROM cultural_guidelines g JOIN countries c ON g.country_id = c.id WHERE c.country_code = 'ET'
UNION ALL SELECT g.id, 'Do not engage in political discussions or demonstrations' FROM cultural_guidelines g JOIN countries c ON g.country_id = c.id WHERE c.country_code = 'ET'
UNION ALL SELECT g.id, 'Do not drink tap water anywhere in Ethiopia - use bottled water' FROM cultural_guidelines g JOIN countries c ON g.country_id = c.id WHERE c.country_code = 'ET'
UNION ALL SELECT g.id, 'Do not carry or use drugs - severe penalties apply' FROM cultural_guidelines g JOIN countries c ON g.country_id = c.id WHERE c.country_code = 'ET';

INSERT IGNORE INTO cultural_legal_warnings (guideline_id, title, description)
SELECT g.id, 'Conflict Zones', 'Travel to conflict zones is extremely dangerous - do not travel to Tigray and parts of Amhara and Afar.'
FROM cultural_guidelines g JOIN countries c ON g.country_id = c.id WHERE c.country_code = 'ET'
UNION ALL SELECT g.id, 'Same-Sex Relations', 'Same-sex relationships are criminalised - up to 15 years imprisonment.' FROM cultural_guidelines g JOIN countries c ON g.country_id = c.id WHERE c.country_code = 'ET'
UNION ALL SELECT g.id, 'Anti-Terrorism Law', 'Broadly worded law - journalists and researchers should seek legal advice.' FROM cultural_guidelines g JOIN countries c ON g.country_id = c.id WHERE c.country_code = 'ET'
UNION ALL SELECT g.id, 'Currency Regulations', 'Do not exchange money on the black market - illegal and risky.' FROM cultural_guidelines g JOIN countries c ON g.country_id = c.id WHERE c.country_code = 'ET';

-- Senegal
INSERT IGNORE INTO cultural_dos (guideline_id, item)
SELECT g.id, 'Carry your Yellow Fever certificate - mandatory for all travellers entering Senegal'
FROM cultural_guidelines g JOIN countries c ON g.country_id = c.id WHERE c.country_code = 'SN'
UNION ALL SELECT g.id, 'Learn a few words in Wolof or French - Jerejef (thank you) is appreciated' FROM cultural_guidelines g JOIN countries c ON g.country_id = c.id WHERE c.country_code = 'SN'
UNION ALL SELECT g.id, 'Accept hospitality warmly - Senegalese Teranga culture is built on generosity' FROM cultural_guidelines g JOIN countries c ON g.country_id = c.id WHERE c.country_code = 'SN'
UNION ALL SELECT g.id, 'Dress modestly when visiting mosques and rural communities' FROM cultural_guidelines g JOIN countries c ON g.country_id = c.id WHERE c.country_code = 'SN'
UNION ALL SELECT g.id, 'Use authorised money changers or banks - street exchange is risky' FROM cultural_guidelines g JOIN countries c ON g.country_id = c.id WHERE c.country_code = 'SN'
UNION ALL SELECT g.id, 'Visit Goree Island with respect - a significant UNESCO World Heritage site' FROM cultural_guidelines g JOIN countries c ON g.country_id = c.id WHERE c.country_code = 'SN'
UNION ALL SELECT g.id, 'Bargain respectfully in markets - culturally normal' FROM cultural_guidelines g JOIN countries c ON g.country_id = c.id WHERE c.country_code = 'SN';

INSERT IGNORE INTO cultural_donts (guideline_id, item)
SELECT g.id, 'Do not enter a mosque without being invited or welcomed in'
FROM cultural_guidelines g JOIN countries c ON g.country_id = c.id WHERE c.country_code = 'SN'
UNION ALL SELECT g.id, 'Do not eat with your left hand - considered disrespectful' FROM cultural_guidelines g JOIN countries c ON g.country_id = c.id WHERE c.country_code = 'SN'
UNION ALL SELECT g.id, 'Do not travel to the Casamance region without current security advice' FROM cultural_guidelines g JOIN countries c ON g.country_id = c.id WHERE c.country_code = 'SN'
UNION ALL SELECT g.id, 'Do not photograph military, police, or government buildings without permission' FROM cultural_guidelines g JOIN countries c ON g.country_id = c.id WHERE c.country_code = 'SN'
UNION ALL SELECT g.id, 'Do not drink tap water - use bottled water' FROM cultural_guidelines g JOIN countries c ON g.country_id = c.id WHERE c.country_code = 'SN'
UNION ALL SELECT g.id, 'Do not carry or use drugs - severe penalties apply' FROM cultural_guidelines g JOIN countries c ON g.country_id = c.id WHERE c.country_code = 'SN'
UNION ALL SELECT g.id, 'Do not display excessive wealth or flash expensive items in public in Dakar' FROM cultural_guidelines g JOIN countries c ON g.country_id = c.id WHERE c.country_code = 'SN';

INSERT IGNORE INTO cultural_legal_warnings (guideline_id, title, description)
SELECT g.id, 'Same-Sex Relations', 'Same-sex relationships are criminalised - up to 5 years imprisonment.'
FROM cultural_guidelines g JOIN countries c ON g.country_id = c.id WHERE c.country_code = 'SN'
UNION ALL SELECT g.id, 'Drug Offences', 'Drug offences carry minimum 2-year imprisonment.' FROM cultural_guidelines g JOIN countries c ON g.country_id = c.id WHERE c.country_code = 'SN'
UNION ALL SELECT g.id, 'Presidential Palace', 'Photographing the Presidential Palace or military is illegal.' FROM cultural_guidelines g JOIN countries c ON g.country_id = c.id WHERE c.country_code = 'SN'
UNION ALL SELECT g.id, 'Casamance Landmines', 'The Casamance region has unexploded landmines in some rural areas - stick to known paths.' FROM cultural_guidelines g JOIN countries c ON g.country_id = c.id WHERE c.country_code = 'SN';

-- Health advisories (March 2026 doc)
DELETE hr FROM health_required_vaccines hr
JOIN health_advisories a ON hr.advisory_id = a.id
JOIN countries c ON a.country_id = c.id
WHERE c.country_code IN ('RW','KE','TZ','UG','NG','GH','ZA','MA','ET','SN');

DELETE hr FROM health_recommended_vaccines hr
JOIN health_advisories a ON hr.advisory_id = a.id
JOIN countries c ON a.country_id = c.id
WHERE c.country_code IN ('RW','KE','TZ','UG','NG','GH','ZA','MA','ET','SN');

DELETE hr FROM health_risks hr
JOIN health_advisories a ON hr.advisory_id = a.id
JOIN countries c ON a.country_id = c.id
WHERE c.country_code IN ('RW','KE','TZ','UG','NG','GH','ZA','MA','ET','SN');

DELETE hr FROM health_active_outbreaks hr
JOIN health_advisories a ON hr.advisory_id = a.id
JOIN countries c ON a.country_id = c.id
WHERE c.country_code IN ('RW','KE','TZ','UG','NG','GH','ZA','MA','ET','SN');

UPDATE health_advisories a JOIN countries c ON a.country_id = c.id
SET a.medication_rules = 'Carry a copy of all prescriptions. Antimalarials and most travel medications available in Kigali pharmacies. Water safety: drink bottled or boiled water; tap water in Kigali is treated but bottled water is safer.'
WHERE c.country_code = 'RW';

UPDATE health_advisories a JOIN countries c ON a.country_id = c.id
SET a.medication_rules = 'Carry prescriptions for all medications. Antimalarials available in major pharmacies. Bring sufficient supply of specialist medications. Water safety: do not drink tap water; use sealed bottled water.'
WHERE c.country_code = 'KE';

UPDATE health_advisories a JOIN countries c ON a.country_id = c.id
SET a.medication_rules = 'Bring full supply of prescription medications; specialist drugs may not be available outside Dar es Salaam. Carry prescriptions in original packaging. Water safety: tap water is unsafe; use sealed bottled water.'
WHERE c.country_code = 'TZ';

UPDATE health_advisories a JOIN countries c ON a.country_id = c.id
SET a.medication_rules = 'Bring all medications from home; specialist drugs unavailable outside Kampala. Antimalarials available in Kampala pharmacies. Water safety: do not drink tap water; use sealed bottled water.'
WHERE c.country_code = 'UG';

UPDATE health_advisories a JOIN countries c ON a.country_id = c.id
SET a.medication_rules = 'Carry prescriptions for all medications. Counterfeit medications are a known problem - use reputable pharmacies in major hospitals. Water safety: tap water is unsafe; use sealed bottled water.'
WHERE c.country_code = 'NG';

UPDATE health_advisories a JOIN countries c ON a.country_id = c.id
SET a.medication_rules = 'Bring full supply of medications. Antimalarials available in Accra pharmacies. Counterfeit drugs present in street markets - use hospital pharmacies. Water safety: tap and sachet water are unsafe; drink sealed bottled water.'
WHERE c.country_code = 'GH';

UPDATE health_advisories a JOIN countries c ON a.country_id = c.id
SET a.medication_rules = 'Full range of medications available; major pharmacy chains in all cities. Prescriptions required for controlled substances. Water safety: tap water safe in major cities; in rural areas use bottled water.'
WHERE c.country_code = 'ZA';

UPDATE health_advisories a JOIN countries c ON a.country_id = c.id
SET a.medication_rules = 'Good range of medications available in pharmacies (green cross). Prescriptions required for antibiotics and controlled medications. Water safety: bottled water recommended; essential in rural/desert areas.'
WHERE c.country_code = 'MA';

UPDATE health_advisories a JOIN countries c ON a.country_id = c.id
SET a.medication_rules = 'Bring full supply of medications from home. Limited pharmaceutical availability outside Addis Ababa. Antimalarials available in the capital. Water safety: tap water unsafe; use sealed bottled water.'
WHERE c.country_code = 'ET';

UPDATE health_advisories a JOIN countries c ON a.country_id = c.id
SET a.medication_rules = 'Antimalarials and basic medications available in Dakar pharmacies. Bring specialist medications from home. Water safety: tap water unsafe; use sealed bottled water and avoid ice and raw salads.'
WHERE c.country_code = 'SN';

-- Required vaccines
INSERT IGNORE INTO health_required_vaccines (advisory_id, vaccine)
SELECT a.id, 'Yellow Fever (if arriving from endemic country)'
FROM health_advisories a JOIN countries c ON a.country_id = c.id WHERE c.country_code = 'RW';

INSERT IGNORE INTO health_required_vaccines (advisory_id, vaccine)
SELECT a.id, 'Yellow Fever (if arriving from endemic country)'
FROM health_advisories a JOIN countries c ON a.country_id = c.id WHERE c.country_code = 'KE';

INSERT IGNORE INTO health_required_vaccines (advisory_id, vaccine)
SELECT a.id, 'Yellow Fever (required from endemic countries)'
FROM health_advisories a JOIN countries c ON a.country_id = c.id WHERE c.country_code = 'TZ';

INSERT IGNORE INTO health_required_vaccines (advisory_id, vaccine)
SELECT a.id, 'Yellow Fever - mandatory for all travellers'
FROM health_advisories a JOIN countries c ON a.country_id = c.id WHERE c.country_code = 'UG';

INSERT IGNORE INTO health_required_vaccines (advisory_id, vaccine)
SELECT a.id, 'Yellow Fever - mandatory for all travellers'
FROM health_advisories a JOIN countries c ON a.country_id = c.id WHERE c.country_code = 'NG';

INSERT IGNORE INTO health_required_vaccines (advisory_id, vaccine)
SELECT a.id, 'Yellow Fever - mandatory for all travellers'
FROM health_advisories a JOIN countries c ON a.country_id = c.id WHERE c.country_code = 'GH';

INSERT IGNORE INTO health_required_vaccines (advisory_id, vaccine)
SELECT a.id, 'Yellow Fever (only if arriving from endemic country)'
FROM health_advisories a JOIN countries c ON a.country_id = c.id WHERE c.country_code = 'ZA';

-- Morocco: none required

INSERT IGNORE INTO health_required_vaccines (advisory_id, vaccine)
SELECT a.id, 'Yellow Fever (required if arriving from endemic country)'
FROM health_advisories a JOIN countries c ON a.country_id = c.id WHERE c.country_code = 'ET';

INSERT IGNORE INTO health_required_vaccines (advisory_id, vaccine)
SELECT a.id, 'Yellow Fever - mandatory for all travellers'
FROM health_advisories a JOIN countries c ON a.country_id = c.id WHERE c.country_code = 'SN';

-- Recommended vaccines
INSERT IGNORE INTO health_recommended_vaccines (advisory_id, vaccine)
SELECT a.id, 'Hepatitis A' FROM health_advisories a JOIN countries c ON a.country_id = c.id WHERE c.country_code = 'RW'
UNION ALL SELECT a.id, 'Hepatitis B' FROM health_advisories a JOIN countries c ON a.country_id = c.id WHERE c.country_code = 'RW'
UNION ALL SELECT a.id, 'Typhoid' FROM health_advisories a JOIN countries c ON a.country_id = c.id WHERE c.country_code = 'RW'
UNION ALL SELECT a.id, 'Rabies (for extended rural stays)' FROM health_advisories a JOIN countries c ON a.country_id = c.id WHERE c.country_code = 'RW'
UNION ALL SELECT a.id, 'Meningitis' FROM health_advisories a JOIN countries c ON a.country_id = c.id WHERE c.country_code = 'RW'
UNION ALL SELECT a.id, 'Routine vaccinations (MMR, Tetanus, Polio)' FROM health_advisories a JOIN countries c ON a.country_id = c.id WHERE c.country_code = 'RW';

INSERT IGNORE INTO health_recommended_vaccines (advisory_id, vaccine)
SELECT a.id, 'Hepatitis A' FROM health_advisories a JOIN countries c ON a.country_id = c.id WHERE c.country_code = 'KE'
UNION ALL SELECT a.id, 'Hepatitis B' FROM health_advisories a JOIN countries c ON a.country_id = c.id WHERE c.country_code = 'KE'
UNION ALL SELECT a.id, 'Typhoid' FROM health_advisories a JOIN countries c ON a.country_id = c.id WHERE c.country_code = 'KE'
UNION ALL SELECT a.id, 'Cholera' FROM health_advisories a JOIN countries c ON a.country_id = c.id WHERE c.country_code = 'KE'
UNION ALL SELECT a.id, 'Rabies (for rural or wildlife areas)' FROM health_advisories a JOIN countries c ON a.country_id = c.id WHERE c.country_code = 'KE'
UNION ALL SELECT a.id, 'Meningitis' FROM health_advisories a JOIN countries c ON a.country_id = c.id WHERE c.country_code = 'KE'
UNION ALL SELECT a.id, 'Routine vaccinations (MMR, Tetanus, Polio)' FROM health_advisories a JOIN countries c ON a.country_id = c.id WHERE c.country_code = 'KE';

INSERT IGNORE INTO health_recommended_vaccines (advisory_id, vaccine)
SELECT a.id, 'Hepatitis A' FROM health_advisories a JOIN countries c ON a.country_id = c.id WHERE c.country_code = 'TZ'
UNION ALL SELECT a.id, 'Hepatitis B' FROM health_advisories a JOIN countries c ON a.country_id = c.id WHERE c.country_code = 'TZ'
UNION ALL SELECT a.id, 'Typhoid' FROM health_advisories a JOIN countries c ON a.country_id = c.id WHERE c.country_code = 'TZ'
UNION ALL SELECT a.id, 'Rabies' FROM health_advisories a JOIN countries c ON a.country_id = c.id WHERE c.country_code = 'TZ'
UNION ALL SELECT a.id, 'Cholera' FROM health_advisories a JOIN countries c ON a.country_id = c.id WHERE c.country_code = 'TZ'
UNION ALL SELECT a.id, 'Meningitis' FROM health_advisories a JOIN countries c ON a.country_id = c.id WHERE c.country_code = 'TZ'
UNION ALL SELECT a.id, 'Routine vaccinations (MMR, Tetanus, Polio)' FROM health_advisories a JOIN countries c ON a.country_id = c.id WHERE c.country_code = 'TZ';

INSERT IGNORE INTO health_recommended_vaccines (advisory_id, vaccine)
SELECT a.id, 'Hepatitis A' FROM health_advisories a JOIN countries c ON a.country_id = c.id WHERE c.country_code = 'UG'
UNION ALL SELECT a.id, 'Hepatitis B' FROM health_advisories a JOIN countries c ON a.country_id = c.id WHERE c.country_code = 'UG'
UNION ALL SELECT a.id, 'Typhoid' FROM health_advisories a JOIN countries c ON a.country_id = c.id WHERE c.country_code = 'UG'
UNION ALL SELECT a.id, 'Rabies (especially for wildlife areas)' FROM health_advisories a JOIN countries c ON a.country_id = c.id WHERE c.country_code = 'UG'
UNION ALL SELECT a.id, 'Meningitis' FROM health_advisories a JOIN countries c ON a.country_id = c.id WHERE c.country_code = 'UG'
UNION ALL SELECT a.id, 'Cholera' FROM health_advisories a JOIN countries c ON a.country_id = c.id WHERE c.country_code = 'UG'
UNION ALL SELECT a.id, 'Routine vaccinations (MMR, Tetanus, Polio)' FROM health_advisories a JOIN countries c ON a.country_id = c.id WHERE c.country_code = 'UG';

INSERT IGNORE INTO health_recommended_vaccines (advisory_id, vaccine)
SELECT a.id, 'Hepatitis A' FROM health_advisories a JOIN countries c ON a.country_id = c.id WHERE c.country_code = 'NG'
UNION ALL SELECT a.id, 'Hepatitis B' FROM health_advisories a JOIN countries c ON a.country_id = c.id WHERE c.country_code = 'NG'
UNION ALL SELECT a.id, 'Typhoid' FROM health_advisories a JOIN countries c ON a.country_id = c.id WHERE c.country_code = 'NG'
UNION ALL SELECT a.id, 'Meningitis (especially for northern regions)' FROM health_advisories a JOIN countries c ON a.country_id = c.id WHERE c.country_code = 'NG'
UNION ALL SELECT a.id, 'Rabies' FROM health_advisories a JOIN countries c ON a.country_id = c.id WHERE c.country_code = 'NG'
UNION ALL SELECT a.id, 'Cholera' FROM health_advisories a JOIN countries c ON a.country_id = c.id WHERE c.country_code = 'NG'
UNION ALL SELECT a.id, 'Routine vaccinations (MMR, Tetanus, Polio)' FROM health_advisories a JOIN countries c ON a.country_id = c.id WHERE c.country_code = 'NG';

INSERT IGNORE INTO health_recommended_vaccines (advisory_id, vaccine)
SELECT a.id, 'Hepatitis A' FROM health_advisories a JOIN countries c ON a.country_id = c.id WHERE c.country_code = 'GH'
UNION ALL SELECT a.id, 'Hepatitis B' FROM health_advisories a JOIN countries c ON a.country_id = c.id WHERE c.country_code = 'GH'
UNION ALL SELECT a.id, 'Typhoid' FROM health_advisories a JOIN countries c ON a.country_id = c.id WHERE c.country_code = 'GH'
UNION ALL SELECT a.id, 'Meningitis' FROM health_advisories a JOIN countries c ON a.country_id = c.id WHERE c.country_code = 'GH'
UNION ALL SELECT a.id, 'Rabies' FROM health_advisories a JOIN countries c ON a.country_id = c.id WHERE c.country_code = 'GH'
UNION ALL SELECT a.id, 'Cholera' FROM health_advisories a JOIN countries c ON a.country_id = c.id WHERE c.country_code = 'GH'
UNION ALL SELECT a.id, 'Routine vaccinations (MMR, Tetanus, Polio)' FROM health_advisories a JOIN countries c ON a.country_id = c.id WHERE c.country_code = 'GH';

INSERT IGNORE INTO health_recommended_vaccines (advisory_id, vaccine)
SELECT a.id, 'Hepatitis A' FROM health_advisories a JOIN countries c ON a.country_id = c.id WHERE c.country_code = 'ZA'
UNION ALL SELECT a.id, 'Hepatitis B' FROM health_advisories a JOIN countries c ON a.country_id = c.id WHERE c.country_code = 'ZA'
UNION ALL SELECT a.id, 'Typhoid' FROM health_advisories a JOIN countries c ON a.country_id = c.id WHERE c.country_code = 'ZA'
UNION ALL SELECT a.id, 'Rabies (for rural or wildlife areas)' FROM health_advisories a JOIN countries c ON a.country_id = c.id WHERE c.country_code = 'ZA'
UNION ALL SELECT a.id, 'Routine vaccinations (MMR, Tetanus, Polio)' FROM health_advisories a JOIN countries c ON a.country_id = c.id WHERE c.country_code = 'ZA';

INSERT IGNORE INTO health_recommended_vaccines (advisory_id, vaccine)
SELECT a.id, 'Hepatitis A' FROM health_advisories a JOIN countries c ON a.country_id = c.id WHERE c.country_code = 'MA'
UNION ALL SELECT a.id, 'Hepatitis B' FROM health_advisories a JOIN countries c ON a.country_id = c.id WHERE c.country_code = 'MA'
UNION ALL SELECT a.id, 'Typhoid' FROM health_advisories a JOIN countries c ON a.country_id = c.id WHERE c.country_code = 'MA'
UNION ALL SELECT a.id, 'Rabies (for rural areas)' FROM health_advisories a JOIN countries c ON a.country_id = c.id WHERE c.country_code = 'MA'
UNION ALL SELECT a.id, 'Routine vaccinations (MMR, Tetanus, Polio)' FROM health_advisories a JOIN countries c ON a.country_id = c.id WHERE c.country_code = 'MA';

INSERT IGNORE INTO health_recommended_vaccines (advisory_id, vaccine)
SELECT a.id, 'Hepatitis A' FROM health_advisories a JOIN countries c ON a.country_id = c.id WHERE c.country_code = 'ET'
UNION ALL SELECT a.id, 'Hepatitis B' FROM health_advisories a JOIN countries c ON a.country_id = c.id WHERE c.country_code = 'ET'
UNION ALL SELECT a.id, 'Typhoid' FROM health_advisories a JOIN countries c ON a.country_id = c.id WHERE c.country_code = 'ET'
UNION ALL SELECT a.id, 'Meningitis' FROM health_advisories a JOIN countries c ON a.country_id = c.id WHERE c.country_code = 'ET'
UNION ALL SELECT a.id, 'Rabies' FROM health_advisories a JOIN countries c ON a.country_id = c.id WHERE c.country_code = 'ET'
UNION ALL SELECT a.id, 'Cholera' FROM health_advisories a JOIN countries c ON a.country_id = c.id WHERE c.country_code = 'ET'
UNION ALL SELECT a.id, 'Routine vaccinations (MMR, Tetanus, Polio)' FROM health_advisories a JOIN countries c ON a.country_id = c.id WHERE c.country_code = 'ET';

INSERT IGNORE INTO health_recommended_vaccines (advisory_id, vaccine)
SELECT a.id, 'Hepatitis A' FROM health_advisories a JOIN countries c ON a.country_id = c.id WHERE c.country_code = 'SN'
UNION ALL SELECT a.id, 'Hepatitis B' FROM health_advisories a JOIN countries c ON a.country_id = c.id WHERE c.country_code = 'SN'
UNION ALL SELECT a.id, 'Typhoid' FROM health_advisories a JOIN countries c ON a.country_id = c.id WHERE c.country_code = 'SN'
UNION ALL SELECT a.id, 'Meningitis' FROM health_advisories a JOIN countries c ON a.country_id = c.id WHERE c.country_code = 'SN'
UNION ALL SELECT a.id, 'Rabies' FROM health_advisories a JOIN countries c ON a.country_id = c.id WHERE c.country_code = 'SN'
UNION ALL SELECT a.id, 'Cholera' FROM health_advisories a JOIN countries c ON a.country_id = c.id WHERE c.country_code = 'SN'
UNION ALL SELECT a.id, 'Routine vaccinations (MMR, Tetanus, Polio)' FROM health_advisories a JOIN countries c ON a.country_id = c.id WHERE c.country_code = 'SN';

-- Health risks
INSERT IGNORE INTO health_risks (advisory_id, risk)
SELECT a.id, 'Malaria' FROM health_advisories a JOIN countries c ON a.country_id = c.id WHERE c.country_code = 'RW'
UNION ALL SELECT a.id, 'Cholera' FROM health_advisories a JOIN countries c ON a.country_id = c.id WHERE c.country_code = 'RW'
UNION ALL SELECT a.id, 'Typhoid' FROM health_advisories a JOIN countries c ON a.country_id = c.id WHERE c.country_code = 'RW'
UNION ALL SELECT a.id, 'Bilharzia (schistosomiasis) in Lake Kivu' FROM health_advisories a JOIN countries c ON a.country_id = c.id WHERE c.country_code = 'RW';

INSERT IGNORE INTO health_risks (advisory_id, risk)
SELECT a.id, 'Malaria (coast and lake regions)' FROM health_advisories a JOIN countries c ON a.country_id = c.id WHERE c.country_code = 'KE'
UNION ALL SELECT a.id, 'Dengue Fever (coastal areas)' FROM health_advisories a JOIN countries c ON a.country_id = c.id WHERE c.country_code = 'KE'
UNION ALL SELECT a.id, 'Cholera (periodic outbreaks)' FROM health_advisories a JOIN countries c ON a.country_id = c.id WHERE c.country_code = 'KE'
UNION ALL SELECT a.id, 'Rift Valley Fever (rare)' FROM health_advisories a JOIN countries c ON a.country_id = c.id WHERE c.country_code = 'KE'
UNION ALL SELECT a.id, 'Plague (rare, North Eastern Province)' FROM health_advisories a JOIN countries c ON a.country_id = c.id WHERE c.country_code = 'KE';

INSERT IGNORE INTO health_risks (advisory_id, risk)
SELECT a.id, 'Malaria (high risk year-round)' FROM health_advisories a JOIN countries c ON a.country_id = c.id WHERE c.country_code = 'TZ'
UNION ALL SELECT a.id, 'Cholera (periodic outbreaks)' FROM health_advisories a JOIN countries c ON a.country_id = c.id WHERE c.country_code = 'TZ'
UNION ALL SELECT a.id, 'Dengue Fever' FROM health_advisories a JOIN countries c ON a.country_id = c.id WHERE c.country_code = 'TZ'
UNION ALL SELECT a.id, 'Bilharzia (in lake and river areas)' FROM health_advisories a JOIN countries c ON a.country_id = c.id WHERE c.country_code = 'TZ'
UNION ALL SELECT a.id, 'Plague (rare, northern highlands)' FROM health_advisories a JOIN countries c ON a.country_id = c.id WHERE c.country_code = 'TZ';

INSERT IGNORE INTO health_risks (advisory_id, risk)
SELECT a.id, 'Malaria (high risk year-round)' FROM health_advisories a JOIN countries c ON a.country_id = c.id WHERE c.country_code = 'UG'
UNION ALL SELECT a.id, 'Ebola (monitoring - DRC border proximity)' FROM health_advisories a JOIN countries c ON a.country_id = c.id WHERE c.country_code = 'UG'
UNION ALL SELECT a.id, 'Cholera' FROM health_advisories a JOIN countries c ON a.country_id = c.id WHERE c.country_code = 'UG'
UNION ALL SELECT a.id, 'Plague (rare)' FROM health_advisories a JOIN countries c ON a.country_id = c.id WHERE c.country_code = 'UG'
UNION ALL SELECT a.id, 'Marburg Virus (rare, historical outbreaks)' FROM health_advisories a JOIN countries c ON a.country_id = c.id WHERE c.country_code = 'UG';

INSERT IGNORE INTO health_risks (advisory_id, risk)
SELECT a.id, 'Malaria (high risk year-round nationwide)' FROM health_advisories a JOIN countries c ON a.country_id = c.id WHERE c.country_code = 'NG'
UNION ALL SELECT a.id, 'Lassa Fever (endemic)' FROM health_advisories a JOIN countries c ON a.country_id = c.id WHERE c.country_code = 'NG'
UNION ALL SELECT a.id, 'Cholera (periodic outbreaks)' FROM health_advisories a JOIN countries c ON a.country_id = c.id WHERE c.country_code = 'NG'
UNION ALL SELECT a.id, 'Monkeypox (endemic)' FROM health_advisories a JOIN countries c ON a.country_id = c.id WHERE c.country_code = 'NG'
UNION ALL SELECT a.id, 'Meningitis (northern belt, dry season)' FROM health_advisories a JOIN countries c ON a.country_id = c.id WHERE c.country_code = 'NG'
UNION ALL SELECT a.id, 'Dengue Fever' FROM health_advisories a JOIN countries c ON a.country_id = c.id WHERE c.country_code = 'NG';

INSERT IGNORE INTO health_risks (advisory_id, risk)
SELECT a.id, 'Malaria (high risk year-round)' FROM health_advisories a JOIN countries c ON a.country_id = c.id WHERE c.country_code = 'GH'
UNION ALL SELECT a.id, 'Typhoid' FROM health_advisories a JOIN countries c ON a.country_id = c.id WHERE c.country_code = 'GH'
UNION ALL SELECT a.id, 'Hepatitis A' FROM health_advisories a JOIN countries c ON a.country_id = c.id WHERE c.country_code = 'GH'
UNION ALL SELECT a.id, 'Cholera (periodic outbreaks)' FROM health_advisories a JOIN countries c ON a.country_id = c.id WHERE c.country_code = 'GH'
UNION ALL SELECT a.id, 'Dengue Fever (emerging risk)' FROM health_advisories a JOIN countries c ON a.country_id = c.id WHERE c.country_code = 'GH';

INSERT IGNORE INTO health_risks (advisory_id, risk)
SELECT a.id, 'HIV/AIDS (very high prevalence)' FROM health_advisories a JOIN countries c ON a.country_id = c.id WHERE c.country_code = 'ZA'
UNION ALL SELECT a.id, 'Malaria (risk in Limpopo, Mpumalanga, northern KwaZulu-Natal)' FROM health_advisories a JOIN countries c ON a.country_id = c.id WHERE c.country_code = 'ZA'
UNION ALL SELECT a.id, 'Tuberculosis (high prevalence)' FROM health_advisories a JOIN countries c ON a.country_id = c.id WHERE c.country_code = 'ZA'
UNION ALL SELECT a.id, 'Bilharzia (freshwater lakes and rivers)' FROM health_advisories a JOIN countries c ON a.country_id = c.id WHERE c.country_code = 'ZA';

INSERT IGNORE INTO health_risks (advisory_id, risk)
SELECT a.id, 'Typhoid (food and water-borne)' FROM health_advisories a JOIN countries c ON a.country_id = c.id WHERE c.country_code = 'MA'
UNION ALL SELECT a.id, 'Hepatitis A' FROM health_advisories a JOIN countries c ON a.country_id = c.id WHERE c.country_code = 'MA'
UNION ALL SELECT a.id, 'Rabies (from stray dogs and cats)' FROM health_advisories a JOIN countries c ON a.country_id = c.id WHERE c.country_code = 'MA'
UNION ALL SELECT a.id, 'Leishmaniasis (sandfly-borne, rural areas)' FROM health_advisories a JOIN countries c ON a.country_id = c.id WHERE c.country_code = 'MA'
UNION ALL SELECT a.id, 'Scorpion and snake bites (desert and rural areas)' FROM health_advisories a JOIN countries c ON a.country_id = c.id WHERE c.country_code = 'MA';

INSERT IGNORE INTO health_risks (advisory_id, risk)
SELECT a.id, 'Malaria (high risk in lowlands)' FROM health_advisories a JOIN countries c ON a.country_id = c.id WHERE c.country_code = 'ET'
UNION ALL SELECT a.id, 'Typhoid' FROM health_advisories a JOIN countries c ON a.country_id = c.id WHERE c.country_code = 'ET'
UNION ALL SELECT a.id, 'Cholera (periodic outbreaks)' FROM health_advisories a JOIN countries c ON a.country_id = c.id WHERE c.country_code = 'ET'
UNION ALL SELECT a.id, 'Hepatitis A' FROM health_advisories a JOIN countries c ON a.country_id = c.id WHERE c.country_code = 'ET'
UNION ALL SELECT a.id, 'Leishmaniasis (rural areas)' FROM health_advisories a JOIN countries c ON a.country_id = c.id WHERE c.country_code = 'ET'
UNION ALL SELECT a.id, 'Rabies (from dogs)' FROM health_advisories a JOIN countries c ON a.country_id = c.id WHERE c.country_code = 'ET';

INSERT IGNORE INTO health_risks (advisory_id, risk)
SELECT a.id, 'Malaria (high risk year-round)' FROM health_advisories a JOIN countries c ON a.country_id = c.id WHERE c.country_code = 'SN'
UNION ALL SELECT a.id, 'Dengue Fever (increasing reports)' FROM health_advisories a JOIN countries c ON a.country_id = c.id WHERE c.country_code = 'SN'
UNION ALL SELECT a.id, 'Cholera (periodic outbreaks)' FROM health_advisories a JOIN countries c ON a.country_id = c.id WHERE c.country_code = 'SN'
UNION ALL SELECT a.id, 'Typhoid' FROM health_advisories a JOIN countries c ON a.country_id = c.id WHERE c.country_code = 'SN'
UNION ALL SELECT a.id, 'Bilharzia (freshwater exposure)' FROM health_advisories a JOIN countries c ON a.country_id = c.id WHERE c.country_code = 'SN';

-- Active outbreaks / monitoring notes
INSERT IGNORE INTO health_active_outbreaks (advisory_id, outbreak)
SELECT a.id, 'Monitor CDC and WHO for Ebola updates - DRC border area'
FROM health_advisories a JOIN countries c ON a.country_id = c.id WHERE c.country_code = 'RW';

INSERT IGNORE INTO health_active_outbreaks (advisory_id, outbreak)
SELECT a.id, 'Monitor CDC for Dengue and Cholera seasonal notices'
FROM health_advisories a JOIN countries c ON a.country_id = c.id WHERE c.country_code = 'KE';

INSERT IGNORE INTO health_active_outbreaks (advisory_id, outbreak)
SELECT a.id, 'Monitor WHO/CDC for seasonal Cholera alerts during rainy seasons (Mar-May, Oct-Dec)'
FROM health_advisories a JOIN countries c ON a.country_id = c.id WHERE c.country_code = 'TZ';

INSERT IGNORE INTO health_active_outbreaks (advisory_id, outbreak)
SELECT a.id, 'Monitor WHO/CDC for Ebola alerts - DRC border area carries ongoing risk'
FROM health_advisories a JOIN countries c ON a.country_id = c.id WHERE c.country_code = 'UG';

INSERT IGNORE INTO health_active_outbreaks (advisory_id, outbreak)
SELECT a.id, 'Monitor CDC/WHO for Lassa Fever and Cholera outbreak alerts - seasonal peaks Feb-May'
FROM health_advisories a JOIN countries c ON a.country_id = c.id WHERE c.country_code = 'NG';

INSERT IGNORE INTO health_active_outbreaks (advisory_id, outbreak)
SELECT a.id, 'Monitor CDC/WHO for Meningitis belt alerts (dry season Nov-May) in northern regions'
FROM health_advisories a JOIN countries c ON a.country_id = c.id WHERE c.country_code = 'GH';

INSERT IGNORE INTO health_active_outbreaks (advisory_id, outbreak)
SELECT a.id, 'Malaria risk is seasonal - highest Oct-May in northern provinces'
FROM health_advisories a JOIN countries c ON a.country_id = c.id WHERE c.country_code = 'ZA';

INSERT IGNORE INTO health_active_outbreaks (advisory_id, outbreak)
SELECT a.id, 'No major ongoing outbreaks - monitor CDC for seasonal notices'
FROM health_advisories a JOIN countries c ON a.country_id = c.id WHERE c.country_code = 'MA';

INSERT IGNORE INTO health_active_outbreaks (advisory_id, outbreak)
SELECT a.id, 'Monitor CDC/WHO for Cholera alerts; conflict regions have elevated disease risk'
FROM health_advisories a JOIN countries c ON a.country_id = c.id WHERE c.country_code = 'ET';

INSERT IGNORE INTO health_active_outbreaks (advisory_id, outbreak)
SELECT a.id, 'Monitor CDC/WHO for Dengue and Cholera alerts - peak risk Jul-Nov'
FROM health_advisories a JOIN countries c ON a.country_id = c.id WHERE c.country_code = 'SN';

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


