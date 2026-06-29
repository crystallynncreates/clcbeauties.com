-- Price corrections v2: exact CJ base prices + category markups
-- Generated from CJ export data (75 products with verified prices)
-- Run AFTER update_prices.sql in Supabase SQL Editor

UPDATE products
SET price = CASE id
  WHEN '9eec1892-8646-4b9d-83e4-d9314bb675e6' THEN 99.62  -- Short Bob Wig Jerry - 8inches plus180
  WHEN 'f671c1a9-0c47-4202-83cc-24cfdf52a06c' THEN 94.62  -- Short Bob Wig Jerry - 10inches plus150
  WHEN 'd456c727-825d-4e8e-91f0-a461b13a26b4' THEN 104.56  -- Short Bob Wig Jerry - 10inches plus180
  WHEN '3b01227d-b685-474e-80e5-5833238f83ba' THEN 99.58  -- Short Bob Wig Jerry - 12inches plus150
  WHEN '72dfb59e-ae3a-47a0-ac9b-167ef563ae9d' THEN 109.51  -- Short Bob Wig Jerry - 12inches plus180
  WHEN 'edc42046-466f-4e58-bc8e-8ef36857b750' THEN 109.51  -- Short Bob Wig Jerry - 14inches plus150
  WHEN 'b98c2537-4e6a-4171-a195-d688def1e51a' THEN 119.46  -- Short Bob Wig Jerry - 14inches plus180
  WHEN '402a4afb-8de0-48ce-85d6-2a99bc104fd0' THEN 114.49  -- Short Bob Wig Jerry - 16inches plus150
  WHEN '8acc0304-5e4f-4f89-8e46-7c0a87d10aae' THEN 134.95  -- Short Bob Wig Jerry - 16inches plus180
  WHEN '1cb0641a-b6bd-432b-9cea-1e3016f2efe4' THEN 59.68  -- Curly Loose Deep Wave Lace Front Wig - 13x4/14inches
  WHEN '1547f565-fb59-4337-9ab4-b63d156fb06f' THEN 60.48  -- Curly Loose Deep Wave Lace Front - 13x4/18inches
  WHEN 'eaa7bef2-3f6e-418c-a686-06b1c7945c5e' THEN 61.27  -- Curly Loose Deep Wave Lace Front - 13x4/22inches
  WHEN '7569e6c9-5255-4ec9-8e1b-b1a28584cc50' THEN 62.07  -- Curly Loose Deep Wave Lace Front - 13x4/24inches
  WHEN '531dd26d-5326-449c-b949-33736275a566' THEN 62.07  -- Curly Loose Deep Wave Lace Front - 13x4/26inches
  WHEN '7896f531-3437-4444-98b8-7d418399caa9' THEN 62.07  -- Curly Loose Deep Wave Lace Front - 13x4/28inches
  WHEN 'd92d8af2-b722-48de-b989-dacbdb20cdef' THEN 64.71  -- Curly Loose Deep Wave Lace Front - 13x4/30inches
  WHEN '6eb7658d-c691-4dac-8db2-5c4c3724439d' THEN 69.68  -- Curly Loose Deep Wave Lace Front - 13x4/34inches
  WHEN '0662d6b7-2742-444a-9cd0-7abea8e22c02' THEN 69.02  -- Curly Loose Deep Wave Lace Front - 13x4/36inches
  WHEN '7199278f-c7f5-4dd9-84ef-c4ae7e8417c0' THEN 63.22  -- Full Frontal Lace Human Hair Wig - 150Density/8inch
  WHEN '6e018cc8-d728-4cb0-811b-f4aa970fad45' THEN 68.19  -- Full Frontal Lace Human Hair Wig - 150Density/10inch
  WHEN 'b7ae8326-d72f-49c6-b1b8-e49c82cfc91f' THEN 71.51  -- Full Frontal Lace Human Hair Wig - 150Density/12inch
  WHEN 'd7d96c7f-23de-4ba2-b1c8-10b129d1a520' THEN 78.14  -- Full Frontal Lace Human Hair Wig - 150Density/14inch
  WHEN '5da97c54-2ada-44bd-81e0-266d70589811' THEN 88.92  -- Full Frontal Lace Human Hair Wig - 150Density/16inch
  WHEN '1d8b35ab-e340-449e-b6e9-b1856202f590' THEN 69.85  -- Full Frontal Lace Human Hair Wig - 180Density/8inch
  WHEN '4a83fb45-d8eb-442e-a94b-d2ea4091f062' THEN 74.83  -- Full Frontal Lace Human Hair Wig - 180Density/10inch
  WHEN 'bb83d603-d761-4ea1-971d-2cb8899c73e7' THEN 79.80  -- Full Frontal Lace Human Hair Wig - 180Density/12inch
  WHEN '63ab4906-5722-4578-8e40-976376a144fc' THEN 86.43  -- Full Frontal Lace Human Hair Wig - 180Density/14inch
  WHEN '51551982-a0d2-404b-8056-f1df3e04a5bc' THEN 98.87  -- Full Frontal Lace Human Hair Wig - 180Density/16inch
  WHEN 'eeb8d2b2-6982-44bf-b449-f5975efe2da7' THEN 51.18  -- Velcro Ponytail - natural color/40cm
  WHEN '0ff4f7cc-e8d8-4e4b-a298-798d977fe971' THEN 52.08  -- Velcro Ponytail - natural color/45cm
  WHEN '2ea6d0b6-a72b-4812-9ee0-7348bc1e6132' THEN 54.32  -- Velcro Ponytail - natural color/50cm
  WHEN '43ba0b5f-9228-42c1-a961-aaddc61a88de' THEN 56.12  -- Velcro Ponytail - natural color/55cm
  WHEN 'ac1314db-3198-45d0-8bec-fec71d30a5e8' THEN 58.81  -- Velcro Ponytail - natural color/60cm
  WHEN 'c82eb0d8-79dc-44ff-a9d3-335dbfecb160' THEN 60.59  -- Velcro Ponytail - natural color/65cm
  WHEN '2da7b650-b3de-44dc-bd74-c79376543da0' THEN 62.40  -- Velcro Ponytail - natural color/70cm
  WHEN '4544b312-ff7a-4a22-ad4c-a97934515bf5' THEN 64.19  -- Velcro Ponytail - natural color/75cm
  WHEN 'f4bd098f-a5d5-4f63-8c65-017789860619' THEN 51.18  -- Velcro Ponytail - Brown/40cm
  WHEN '4065d069-1241-4bd7-bbe6-40c8c61c6b37' THEN 52.08  -- Velcro Ponytail - Brown/45cm
  WHEN '26fbe604-15b5-4255-a39a-3453fe412bfc' THEN 54.32  -- Velcro Ponytail - Brown/50cm
  WHEN '42f6563f-bbc8-44a3-8069-72bf4b1278ef' THEN 56.12  -- Velcro Ponytail - Brown/55cm
  WHEN 'dc090ebd-1442-44c3-b5e1-c5569b5ec432' THEN 58.81  -- Velcro Ponytail - Brown/60cm
  WHEN '74ae52ae-f1db-4c1f-a663-28ee56a797e3' THEN 60.59  -- Velcro Ponytail - Brown/65cm
  WHEN 'adae29a1-a532-4c41-8adc-19c21d82dc8e' THEN 62.40  -- Velcro Ponytail - Brown/70cm
  WHEN '2c390f49-ef35-48ac-bc3a-88473b9ea0a5' THEN 64.19  -- Velcro Ponytail - Brown/75cm
  WHEN '74332c39-4955-4cc0-b2d0-73b920495a7f' THEN 51.18  -- Velcro Ponytail Long Hair Seamless Extension - Light Brown/40cm
  WHEN '92366e4c-ee5e-43eb-8b88-a4e41d8fce04' THEN 52.08  -- Velcro Ponytail Long Hair Seamless Extension - Light Brown/45cm
  WHEN '26526dc5-d5a6-439a-b6f6-c1a1fface1a4' THEN 54.32  -- Velcro Ponytail Long Hair Seamless Extension - Light Brown/50cm
  WHEN 'd75caf6e-5cd3-40cd-96ed-d77dc0524cc0' THEN 56.12  -- Velcro Ponytail Long Hair Seamless Extension - Light Brown/55cm
  WHEN '6ac631ff-2a1d-4f21-a0f3-ae8eb67dee00' THEN 58.81  -- Velcro Ponytail Long Hair Seamless Extension - Light Brown/60cm
  WHEN 'be5951f3-8770-429f-9245-77880ee36355' THEN 60.59  -- Velcro Ponytail Long Hair Seamless Extension - Light Brown/65cm
  WHEN '72ec8478-7c18-4db3-bc71-42afde9f3042' THEN 62.40  -- Velcro Ponytail Long Hair Seamless Extension - Light Brown/70cm
  WHEN '37d26635-96c1-4871-9fb0-7e89680ad3f4' THEN 64.19  -- Velcro Ponytail Long Hair Seamless Extension - Light Brown/75cm
  WHEN 'e14f22b0-9a27-4e9e-86ea-1b04bffec8d1' THEN 14.42  -- Nail Accessories Pure Handmade Manicure - Extra Small XS/Purple Iris Tectorum Butterfly
  WHEN '54adcb32-bf54-49b5-a5c3-2f9484ced615' THEN 14.42  -- Nail Accessories Pure Handmade Manicure - Small Size S/Purple Iris Tectorum Butterfly
  WHEN '6a62d1ee-dec9-4402-8448-4dffc38d5546' THEN 14.42  -- Nail Accessories Pure Handmade Manicure - Medium M/Purple Iris Tectorum Butterfly
  WHEN '59979976-dcd4-4dc6-af24-84e6a5857178' THEN 14.42  -- Nail Accessories Pure Handmade Manicure - Large L/Purple Iris Tectorum Butterfly
  WHEN 'c69f72fb-0564-405b-bce5-281e6a892dd7' THEN 4.20  -- Fashion Retro Rose Kerchief - White/90cmx90cm
  WHEN '9999b45a-0386-4eb2-bea1-bb8014bf3c09' THEN 4.20  -- Fashion Retro Rose Kerchief - Black/90cmx90cm
  WHEN 'a22b5b6a-9c4b-45a6-bdf2-ce084d240816' THEN 43.08  -- Spring Braid Crochet 22 Inches - colorZ10
  WHEN '69ac9683-d440-4e4f-90e4-814949fb8c54' THEN 43.08  -- Spring Braid Crochet 22 Inches - color Z9
  WHEN '67bd0322-6190-4495-a6e2-d5bf5c4ff0ba' THEN 42.85  -- Spring Braid Crochet 22 Inches - Z1
  WHEN 'c76d082f-65d6-4106-ba6f-a5f3ddb8b967' THEN 42.47  -- Spring Braid Crochet 22 Inches - color 1B
  WHEN 'a25b2bd3-faa8-4ada-80e3-25424a4ce64d' THEN 43.08  -- Spring Braid Crochet 22 Inches - color Z8
  WHEN '0a8e9c65-8250-441e-a577-717ff006a67d' THEN 91.66  -- Short Bob Wig Jerry - 8inches plus150
  WHEN 'e355ce27-dd27-4d3c-9f3d-e9298a83e1ab' THEN 104.68  -- Water Wave Human Hair 13x4 Lace Front Wig - 10 inch
  WHEN 'f5e12abb-6b5d-43b6-9a57-c1c7637de0dc' THEN 111.32  -- Water Wave Human Hair 13x4 Lace Front Wig - 12 inch
  WHEN 'f24c7e4f-079f-426b-bbba-551dcf1ad5ee' THEN 114.63  -- Water Wave Human Hair 13x4 Lace Front Wig - 14 inch
  WHEN 'e2765f2a-74f9-4cbc-8df6-acf419a77e5c' THEN 119.60  -- Water Wave Human Hair 13x4 Lace Front Wig - 16 inch
  WHEN 'c0670f1d-2c49-4be8-8802-6b0fca00f48e' THEN 138.88  -- Water Wave Human Hair 13x4 Lace Front Wig - 18 inch
  WHEN 'e5f8f3a9-7f79-4c8c-8654-4c0e795d3f24' THEN 146.34  -- Water Wave Human Hair 13x4 Lace Front Wig - 20 inch
  WHEN 'a006a9b6-657e-4a6a-abe8-7bebc7467f68' THEN 161.27  -- Water Wave Human Hair 13x4 Lace Front Wig - 22 inch
  WHEN 'fb89d6c9-c8db-4435-bf45-9de134da51d0' THEN 176.18  -- Water Wave Human Hair 13x4 Lace Front Wig - 24 inch
  WHEN 'f9bb0780-86a3-4c33-b736-ac4bc364447a' THEN 194.85  -- Water Wave Human Hair 13x4 Lace Front Wig - 26 inch
  WHEN 'e6fe62e5-225d-43c1-b8e0-e298c21d7086' THEN 217.24  -- Water Wave Human Hair 13x4 Lace Front Wig - 28 inch
  WHEN 'd27713e9-6407-4ada-80d1-aabdeb2ce9ec' THEN 235.90  -- Water Wave Human Hair 13x4 Lace Front Wig - 30 inch
  ELSE price
END
WHERE id IN (
  '9eec1892-8646-4b9d-83e4-d9314bb675e6',
  'f671c1a9-0c47-4202-83cc-24cfdf52a06c',
  'd456c727-825d-4e8e-91f0-a461b13a26b4',
  '3b01227d-b685-474e-80e5-5833238f83ba',
  '72dfb59e-ae3a-47a0-ac9b-167ef563ae9d',
  'edc42046-466f-4e58-bc8e-8ef36857b750',
  'b98c2537-4e6a-4171-a195-d688def1e51a',
  '402a4afb-8de0-48ce-85d6-2a99bc104fd0',
  '8acc0304-5e4f-4f89-8e46-7c0a87d10aae',
  '1cb0641a-b6bd-432b-9cea-1e3016f2efe4',
  '1547f565-fb59-4337-9ab4-b63d156fb06f',
  'eaa7bef2-3f6e-418c-a686-06b1c7945c5e',
  '7569e6c9-5255-4ec9-8e1b-b1a28584cc50',
  '531dd26d-5326-449c-b949-33736275a566',
  '7896f531-3437-4444-98b8-7d418399caa9',
  'd92d8af2-b722-48de-b989-dacbdb20cdef',
  '6eb7658d-c691-4dac-8db2-5c4c3724439d',
  '0662d6b7-2742-444a-9cd0-7abea8e22c02',
  '7199278f-c7f5-4dd9-84ef-c4ae7e8417c0',
  '6e018cc8-d728-4cb0-811b-f4aa970fad45',
  'b7ae8326-d72f-49c6-b1b8-e49c82cfc91f',
  'd7d96c7f-23de-4ba2-b1c8-10b129d1a520',
  '5da97c54-2ada-44bd-81e0-266d70589811',
  '1d8b35ab-e340-449e-b6e9-b1856202f590',
  '4a83fb45-d8eb-442e-a94b-d2ea4091f062',
  'bb83d603-d761-4ea1-971d-2cb8899c73e7',
  '63ab4906-5722-4578-8e40-976376a144fc',
  '51551982-a0d2-404b-8056-f1df3e04a5bc',
  'eeb8d2b2-6982-44bf-b449-f5975efe2da7',
  '0ff4f7cc-e8d8-4e4b-a298-798d977fe971',
  '2ea6d0b6-a72b-4812-9ee0-7348bc1e6132',
  '43ba0b5f-9228-42c1-a961-aaddc61a88de',
  'ac1314db-3198-45d0-8bec-fec71d30a5e8',
  'c82eb0d8-79dc-44ff-a9d3-335dbfecb160',
  '2da7b650-b3de-44dc-bd74-c79376543da0',
  '4544b312-ff7a-4a22-ad4c-a97934515bf5',
  'f4bd098f-a5d5-4f63-8c65-017789860619',
  '4065d069-1241-4bd7-bbe6-40c8c61c6b37',
  '26fbe604-15b5-4255-a39a-3453fe412bfc',
  '42f6563f-bbc8-44a3-8069-72bf4b1278ef',
  'dc090ebd-1442-44c3-b5e1-c5569b5ec432',
  '74ae52ae-f1db-4c1f-a663-28ee56a797e3',
  'adae29a1-a532-4c41-8adc-19c21d82dc8e',
  '2c390f49-ef35-48ac-bc3a-88473b9ea0a5',
  '74332c39-4955-4cc0-b2d0-73b920495a7f',
  '92366e4c-ee5e-43eb-8b88-a4e41d8fce04',
  '26526dc5-d5a6-439a-b6f6-c1a1fface1a4',
  'd75caf6e-5cd3-40cd-96ed-d77dc0524cc0',
  '6ac631ff-2a1d-4f21-a0f3-ae8eb67dee00',
  'be5951f3-8770-429f-9245-77880ee36355',
  '72ec8478-7c18-4db3-bc71-42afde9f3042',
  '37d26635-96c1-4871-9fb0-7e89680ad3f4',
  'e14f22b0-9a27-4e9e-86ea-1b04bffec8d1',
  '54adcb32-bf54-49b5-a5c3-2f9484ced615',
  '6a62d1ee-dec9-4402-8448-4dffc38d5546',
  '59979976-dcd4-4dc6-af24-84e6a5857178',
  'c69f72fb-0564-405b-bce5-281e6a892dd7',
  '9999b45a-0386-4eb2-bea1-bb8014bf3c09',
  'a22b5b6a-9c4b-45a6-bdf2-ce084d240816',
  '69ac9683-d440-4e4f-90e4-814949fb8c54',
  '67bd0322-6190-4495-a6e2-d5bf5c4ff0ba',
  'c76d082f-65d6-4106-ba6f-a5f3ddb8b967',
  'a25b2bd3-faa8-4ada-80e3-25424a4ce64d',
  '0a8e9c65-8250-441e-a577-717ff006a67d',
  'e355ce27-dd27-4d3c-9f3d-e9298a83e1ab',
  'f5e12abb-6b5d-43b6-9a57-c1c7637de0dc',
  'f24c7e4f-079f-426b-bbba-551dcf1ad5ee',
  'e2765f2a-74f9-4cbc-8df6-acf419a77e5c',
  'c0670f1d-2c49-4be8-8802-6b0fca00f48e',
  'e5f8f3a9-7f79-4c8c-8654-4c0e795d3f24',
  'a006a9b6-657e-4a6a-abe8-7bebc7467f68',
  'fb89d6c9-c8db-4435-bf45-9de134da51d0',
  'f9bb0780-86a3-4c33-b736-ac4bc364447a',
  'e6fe62e5-225d-43c1-b8e0-e298c21d7086',
  'd27713e9-6407-4ada-80d1-aabdeb2ce9ec'
);

-- Verify: check updated products
SELECT id, name, price, category FROM products
WHERE id IN (
  '9eec1892-8646-4b9d-83e4-d9314bb675e6',
  'f671c1a9-0c47-4202-83cc-24cfdf52a06c',
  'd456c727-825d-4e8e-91f0-a461b13a26b4',
  '3b01227d-b685-474e-80e5-5833238f83ba',
  '72dfb59e-ae3a-47a0-ac9b-167ef563ae9d',
  'edc42046-466f-4e58-bc8e-8ef36857b750',
  'b98c2537-4e6a-4171-a195-d688def1e51a',
  '402a4afb-8de0-48ce-85d6-2a99bc104fd0',
  '8acc0304-5e4f-4f89-8e46-7c0a87d10aae',
  '1cb0641a-b6bd-432b-9cea-1e3016f2efe4',
  '1547f565-fb59-4337-9ab4-b63d156fb06f',
  'eaa7bef2-3f6e-418c-a686-06b1c7945c5e',
  '7569e6c9-5255-4ec9-8e1b-b1a28584cc50',
  '531dd26d-5326-449c-b949-33736275a566',
  '7896f531-3437-4444-98b8-7d418399caa9',
  'd92d8af2-b722-48de-b989-dacbdb20cdef',
  '6eb7658d-c691-4dac-8db2-5c4c3724439d',
  '0662d6b7-2742-444a-9cd0-7abea8e22c02',
  '7199278f-c7f5-4dd9-84ef-c4ae7e8417c0',
  '6e018cc8-d728-4cb0-811b-f4aa970fad45',
  'b7ae8326-d72f-49c6-b1b8-e49c82cfc91f',
  'd7d96c7f-23de-4ba2-b1c8-10b129d1a520',
  '5da97c54-2ada-44bd-81e0-266d70589811',
  '1d8b35ab-e340-449e-b6e9-b1856202f590',
  '4a83fb45-d8eb-442e-a94b-d2ea4091f062',
  'bb83d603-d761-4ea1-971d-2cb8899c73e7',
  '63ab4906-5722-4578-8e40-976376a144fc',
  '51551982-a0d2-404b-8056-f1df3e04a5bc',
  'eeb8d2b2-6982-44bf-b449-f5975efe2da7',
  '0ff4f7cc-e8d8-4e4b-a298-798d977fe971',
  '2ea6d0b6-a72b-4812-9ee0-7348bc1e6132',
  '43ba0b5f-9228-42c1-a961-aaddc61a88de',
  'ac1314db-3198-45d0-8bec-fec71d30a5e8',
  'c82eb0d8-79dc-44ff-a9d3-335dbfecb160',
  '2da7b650-b3de-44dc-bd74-c79376543da0',
  '4544b312-ff7a-4a22-ad4c-a97934515bf5',
  'f4bd098f-a5d5-4f63-8c65-017789860619',
  '4065d069-1241-4bd7-bbe6-40c8c61c6b37',
  '26fbe604-15b5-4255-a39a-3453fe412bfc',
  '42f6563f-bbc8-44a3-8069-72bf4b1278ef',
  'dc090ebd-1442-44c3-b5e1-c5569b5ec432',
  '74ae52ae-f1db-4c1f-a663-28ee56a797e3',
  'adae29a1-a532-4c41-8adc-19c21d82dc8e',
  '2c390f49-ef35-48ac-bc3a-88473b9ea0a5',
  '74332c39-4955-4cc0-b2d0-73b920495a7f',
  '92366e4c-ee5e-43eb-8b88-a4e41d8fce04',
  '26526dc5-d5a6-439a-b6f6-c1a1fface1a4',
  'd75caf6e-5cd3-40cd-96ed-d77dc0524cc0',
  '6ac631ff-2a1d-4f21-a0f3-ae8eb67dee00',
  'be5951f3-8770-429f-9245-77880ee36355',
  '72ec8478-7c18-4db3-bc71-42afde9f3042',
  '37d26635-96c1-4871-9fb0-7e89680ad3f4',
  'e14f22b0-9a27-4e9e-86ea-1b04bffec8d1',
  '54adcb32-bf54-49b5-a5c3-2f9484ced615',
  '6a62d1ee-dec9-4402-8448-4dffc38d5546',
  '59979976-dcd4-4dc6-af24-84e6a5857178',
  'c69f72fb-0564-405b-bce5-281e6a892dd7',
  '9999b45a-0386-4eb2-bea1-bb8014bf3c09',
  'a22b5b6a-9c4b-45a6-bdf2-ce084d240816',
  '69ac9683-d440-4e4f-90e4-814949fb8c54',
  '67bd0322-6190-4495-a6e2-d5bf5c4ff0ba',
  'c76d082f-65d6-4106-ba6f-a5f3ddb8b967',
  'a25b2bd3-faa8-4ada-80e3-25424a4ce64d',
  '0a8e9c65-8250-441e-a577-717ff006a67d',
  'e355ce27-dd27-4d3c-9f3d-e9298a83e1ab',
  'f5e12abb-6b5d-43b6-9a57-c1c7637de0dc',
  'f24c7e4f-079f-426b-bbba-551dcf1ad5ee',
  'e2765f2a-74f9-4cbc-8df6-acf419a77e5c',
  'c0670f1d-2c49-4be8-8802-6b0fca00f48e',
  'e5f8f3a9-7f79-4c8c-8654-4c0e795d3f24',
  'a006a9b6-657e-4a6a-abe8-7bebc7467f68',
  'fb89d6c9-c8db-4435-bf45-9de134da51d0',
  'f9bb0780-86a3-4c33-b736-ac4bc364447a',
  'e6fe62e5-225d-43c1-b8e0-e298c21d7086',
  'd27713e9-6407-4ada-80d1-aabdeb2ce9ec'
)
ORDER BY category, name;