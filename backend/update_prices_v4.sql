-- Price corrections v4: exact CJ prices for 112 products across batches 2 and 3
-- Covers: Creative And Versatile Wine Red, Human Hair Wig (yellow/pink/blue),
--         Red Brown 33color, Human Hair Bundles Black, 13x4 Lace Front Orange,
--         Women's Short Curly Hair Wig, Deep Wave Human Hair, Female Curly Synthetic,
--         Synthetic Wavy Curly, Natural Fluffy Big Wave Long Curly, Fashion Highlight,
--         Transparent Lace Forehead Wig, Small Volume Wound Tube Afro, Factory Wig Silk,
--         Former Lace Wig Long Black Curly, Short Wig Full Hair Set,
--         300 Density Loose Wave HD Lace, Women's Short Curly African, 6x4 Density Virgin
-- Run in Supabase SQL Editor (after v1, v2, and v3)

UPDATE products
SET price = CASE id

  -- Creative And Versatile Wine Red Long Lace Front/Lace Wig (Black & Wine Red @ CJ $9.78 + $40)
  WHEN '2d8ef08d-4f5d-4296-8691-c0d3c864f9a4' THEN 49.78  -- Black/14 Inches
  WHEN 'd0109a25-871f-4440-bd9b-7f62013ea377' THEN 49.78  -- Black/16 Inches
  WHEN '84ab9da4-96b9-43ed-a025-7bf7be48b659' THEN 49.78  -- Black/18 Inches
  WHEN '70bfe7a6-5637-4a3a-836b-494291c7e061' THEN 49.78  -- Black/20 Inches
  WHEN '22585ed0-9202-4ad6-9fa6-4666c65d3d18' THEN 49.78  -- Black/22 Inches
  WHEN 'c9e8a0ca-c647-4a30-9bea-8f4e851af7e9' THEN 49.78  -- Black/24 Inches
  WHEN '8775b515-14b0-4de6-aa9b-f994e0021987' THEN 49.78  -- Black/26 Inches
  WHEN 'e5785c79-8c6d-4662-ae13-21c0d65a1460' THEN 49.78  -- Black/28 Inches
  WHEN '770090f6-183e-4dc8-950b-964935b4eb46' THEN 49.78  -- Black/30 Inches
  WHEN 'c6f67d25-f742-42e7-ad0a-f3a6b6ec4216' THEN 49.78  -- Black/32 Inches
  WHEN 'c53d8c7e-6a53-46f9-b2fb-cf4ef1fcc357' THEN 49.78  -- Wine Red/14 Inches
  WHEN '34929c01-0cca-4ec4-a939-64504320c0c4' THEN 49.78  -- Wine Red/16 Inches
  WHEN '330fe3ff-ad58-47d6-96f4-991fadf29ffb' THEN 49.78  -- Wine Red/18 Inches
  WHEN '0094fcc8-3610-4c64-8b7f-c5eca1310e72' THEN 49.78  -- Wine Red/20 Inches
  WHEN '38760584-3797-4e25-8999-793b14ebc632' THEN 49.78  -- Wine Red/22 Inches
  WHEN '6ba0e9fb-a308-4396-8f85-b6103e02f05c' THEN 49.78  -- Wine Red/24 Inches
  WHEN 'ca3dd1fc-560a-4c4d-8115-a334be5bcf65' THEN 49.78  -- Wine Red/26 Inches
  WHEN '0fd47fc1-35a3-4f24-9ae9-a5d9a497501c' THEN 49.78  -- Wine Red/28 Inches
  WHEN '7d08a811-03d8-4685-9dfa-edea1f248e64' THEN 49.78  -- Wine Red/30 Inches
  WHEN 'f5cfb5a9-093e-45af-a80d-73d710b41c5e' THEN 49.78  -- Wine Red/32 Inches
  -- DY3342 Orange @ CJ $5.31 + $40
  WHEN 'fad5768a-3a90-4825-8f1f-201155344800' THEN 45.31  -- DY3342 Orange/18 Inches
  WHEN '72a610e8-409c-4a52-8cbd-e92cf818d19f' THEN 45.31  -- DY3342 Orange/24 Inches
  WHEN 'e422b7d0-a72c-4133-bc9e-10378964a77c' THEN 45.31  -- DY3342 Orange/26 Inches
  WHEN 'd223d7ca-4ca6-4ddc-aa55-bd033dfc4a9f' THEN 45.31  -- DY3342 Orange/30 Inches
  WHEN '5010d35d-af6e-4107-8579-2e4fb800e7b6' THEN 45.31  -- DY3342 Orange/32 Inches
  -- Piano @ CJ $5.64 + $40
  WHEN '2cf0134c-d427-41e5-86a1-19ed6c4a5d6a' THEN 45.64  -- Piano/32 Inches

  -- Human Hair Wig (Yellow/Pink/Blue) @ CJ $126.49 + $40
  WHEN '05843ef6-a063-4d6f-9318-fe9c36a00fc8' THEN 166.49  -- PinkST/18INCH
  WHEN 'ca418795-405a-4db9-aa53-1b410d35fca0' THEN 166.49  -- BlueBW/18INCH
  WHEN '186e3933-44cb-40bf-8de4-88dee4bad126' THEN 166.49  -- BlueST/18INCH
  WHEN '691655a3-1ffb-4511-9dfa-56f56d0365dc' THEN 166.49  -- PinklightpinkBW/18INCH
  WHEN '0844fd17-db4a-444a-b57f-439f97a6c9ae' THEN 166.49  -- YellowST/18INCH
  WHEN '56ba25bd-82ac-42b7-97ea-fd2d5d8952d7' THEN 166.49  -- YellowBW/18INCH
  WHEN '04d14eb8-c716-47c7-b0f8-853e82e627b6' THEN 166.49  -- PinkBW/18INCH

  -- Red Brown 33color Human Hair Wig (wigs +$40)
  WHEN 'dd4f49f4-3d34-43e2-8374-84b3b75090b4' THEN 85.77   -- 33color/16inch (CJ $45.77)
  WHEN 'eecd1f2d-df45-4cd4-b975-061f2d3bf080' THEN 93.90   -- 33color/18inch (CJ $53.90)
  WHEN 'a0c74c1a-2464-496b-baab-d7672d5d955a' THEN 102.68  -- 33color/20inch (CJ $62.68)
  WHEN '195e706c-f20f-499d-9e59-9cc7fba34633' THEN 116.12  -- 33color/22inch (CJ $76.12)
  WHEN 'e6f52e88-efab-439d-8d73-8bfc216be41f' THEN 141.12  -- 33color/24inch (CJ $101.12)
  WHEN 'cba52acc-8db0-4ae4-bcfa-33fea1a0f6cb' THEN 157.54  -- 33color/26inch (CJ $117.54)
  WHEN '9811b397-c278-48bf-b526-4050fa0a3fb1' THEN 183.66  -- 33color/28inch (CJ $143.66)
  WHEN 'e54c64c3-47f8-4be2-b506-9b90c32a163d' THEN 202.32  -- 33color/30inch (CJ $162.32)

  -- Human Hair Bundles - Black (bundles +$25)
  WHEN 'b62be173-ca14-46fa-bc5c-2225aec6fac8' THEN 29.53   -- Black/8inch (CJ $4.53)
  WHEN 'a23dd39d-9c35-491f-9911-4cea82ac664b' THEN 31.45   -- Black/10inch (CJ $6.45)
  WHEN 'd75db013-a61e-4eab-a6e4-d18ee5073545' THEN 33.60   -- Black/12inch (CJ $8.60)
  WHEN '6d8ae8a6-ad9a-4f9d-ad9a-54df371e825f' THEN 35.93   -- Black/14inch (CJ $10.93)
  WHEN 'a87c4485-4255-485a-94a6-88420c859ab7' THEN 38.08   -- Black/16inch (CJ $13.08)
  WHEN '8c2e0fd9-25e6-4beb-82ff-33a2692787eb' THEN 40.23   -- Black/18inch (CJ $15.23)
  WHEN 'b87e922d-3372-47e1-8a58-9b6708db0901' THEN 42.03   -- Black/20inch (CJ $17.03)
  WHEN 'bfa5ce5a-daf2-4dad-8b47-b762982841f8' THEN 45.73   -- Black/22inch (CJ $20.73)
  WHEN 'dee93c6f-db0f-4c54-a430-85974632a920' THEN 47.76   -- Black/24inch (CJ $22.76)
  WHEN '02b4f6ac-ca24-4c83-b22b-aa9c6c294530' THEN 76.79   -- Black/18 20 22inch (CJ $51.79)

  -- 13x4 Lace Front Wig Human Hair - Orange (wigs +$40)
  WHEN '1d7eb195-046c-4132-9bfc-8708dda42160' THEN 134.59  -- Orange/16inch (CJ $94.59)
  WHEN '9fb2183f-3a5a-4562-9d82-1051adcb5ad6' THEN 153.14  -- Orange/18inch (CJ $113.14)
  WHEN 'b0b9a1f1-7892-449d-a571-4c02b5cc60c1' THEN 171.70  -- Orange/20inch (CJ $131.70)
  WHEN '3a122586-8933-41a4-90ee-cc654d33facc' THEN 191.17  -- Orange/22inch (CJ $151.17)
  WHEN 'cace8a34-1985-4638-8081-cf3913a502d4' THEN 45.34   -- Orange 2/26inch (CJ $5.34)

  -- Women's Short Curly Hair Wig (wig +$40, CJ $5.04)
  WHEN '92fca25c-ee54-4e09-b904-86936b5ac8cb' THEN 45.04  -- Black

  -- Deep Wave Human Hair (bundles +$25)
  WHEN '306c7772-5bd6-48fd-869a-95033a81bdd1' THEN 53.85   -- deep150/8inch (CJ $28.85)
  WHEN '98aeab38-5e2b-4ee4-8bb6-3088b6e1de3f' THEN 56.33   -- deep150/10nch (CJ $31.33)
  WHEN '52690c8f-ad5b-4f80-8d4b-ec6da5ed78d2' THEN 60.45   -- deep150/12inch (CJ $35.45)
  WHEN '88eb9da4-3609-453a-b826-b3bfc1eb9d5b' THEN 62.92   -- deep150/14inch (CJ $37.92)
  WHEN '51353b37-7666-4ac4-a29a-613bb2d94fd6' THEN 68.69   -- deep150/16inch (CJ $43.69)
  WHEN '98c2ff78-0512-4c4d-9885-9a9d22160f86' THEN 75.29   -- deep150/18inch (CJ $50.29)
  WHEN '1c43f858-37f0-473c-a2cd-9b7e31c9dbf3' THEN 88.48   -- deep150/20inch (CJ $63.48)
  WHEN '5c7470fd-9de7-46c2-bd4b-47a2b8316b8e' THEN 56.33   -- deep200/8inch (CJ $31.33)
  WHEN 'd7bd163d-845b-412d-a7ad-ea3f0215754a' THEN 64.57   -- deep200/12inch (CJ $39.57)
  WHEN 'd0ebabd6-1a28-4e20-b7ea-a5e70cb7384c' THEN 62.09   -- 8inch T-Part 150 (CJ $37.09)

  -- Female Curly Hair Synthetic Wig (wig +$40, CJ $7.96)
  WHEN 'a8f1e6d2-1cce-4872-8e28-a17fc7510e79' THEN 47.96  -- 1B

  -- Synthetic Wavy Curly Hair Wig (wig +$40, CJ $7.96)
  WHEN '4d26ee15-0379-4b1d-87ed-c6aabec4b287' THEN 47.96  -- No4

  -- Natural Fluffy Big Wave Long Curly Wig (wig +$40, all CJ $5.80)
  WHEN '8b6c524f-9cf4-4f31-8c26-f85023a153aa' THEN 45.80  -- Orange/10 Inches
  WHEN '4608c6ee-6e54-4d13-ad0f-1851b14b92cb' THEN 45.80  -- Orange/12 Inches
  WHEN '185fabb5-5d78-4a79-996a-c322f3f3ecbf' THEN 45.80  -- Orange/14 Inches
  WHEN 'bfcccb67-6d75-43e9-a3fb-97cca4173a9b' THEN 45.80  -- Orange/16 Inches
  WHEN '1cff9c4c-8b1e-46e7-a111-b399797a8a45' THEN 45.80  -- Orange/18 Inches
  WHEN 'f2eaa769-91cf-4b77-8934-c0c7f3d4f4fd' THEN 45.80  -- Orange/22 Inches
  WHEN 'ada04150-1200-429d-83f7-304cd469af98' THEN 45.80  -- Orange/24 Inches
  WHEN 'cd5bfc15-62ea-424a-99e1-503a81ad3975' THEN 45.80  -- Orange/26 Inches
  WHEN 'b0c856e7-8c95-43fb-b12f-ef4484464731' THEN 45.80  -- Orange/28 Inches
  WHEN 'a6a15eff-2428-4aec-8ebf-7f62e4220c81' THEN 45.80  -- Black/10 Inches

  -- Fashion Highlight Cool Pull Wig (wig +$40, CJ $6.12)
  WHEN '2b8b0d1e-e0a6-4986-98fc-a1345caf9e73' THEN 46.12  -- Black Pink

  -- Women's Solid Color Transparent Lace Forehead Wig (wig +$40)
  WHEN '0b855ba8-b58e-4a32-bd40-9f37810ab0b8' THEN 87.78   -- Black/8Inches (CJ $47.78)
  WHEN '7d740575-7095-4ea9-a6ae-86f2fb875e11' THEN 90.85   -- Black/10Inches (CJ $50.85)
  WHEN 'd397f867-1df4-43d3-a170-390203bcb67d' THEN 97.47   -- Black/12Inches (CJ $57.47)
  WHEN '0cc883d0-c748-479f-a151-0037121a6081' THEN 109.89  -- Black/14Inches (CJ $69.89)
  WHEN 'bf710083-7dfd-4a45-878c-f0f213752e1a' THEN 117.95  -- Black/16Inches (CJ $77.95)

  -- Small Volume Wound Tube Afro Long Curly Wig (wig +$40, all CJ $9.78)
  WHEN 'f5520cee-b3ee-4781-afb9-c455469349e5' THEN 49.78  -- Light Brown/4 Inches
  WHEN '94404a5c-046d-4984-b52a-279669a1de23' THEN 49.78  -- Light Brown/6 Inches
  WHEN '3291a11d-6b05-4cbb-8072-bce5c42341df' THEN 49.78  -- Light Brown/22 Inches
  WHEN 'f0e5c732-3718-47d5-a406-30cff8c6d1ba' THEN 49.78  -- Light Brown/24 Inches

  -- Factory Wig Real Human Hair Silk (wig +$40)
  WHEN '3c2d86db-963b-49a0-a009-8eada6ca8270' THEN 64.05   -- 1B/8inch (CJ $24.05)
  WHEN '84f615f7-0654-4f63-b941-384b7b19ee61' THEN 76.48   -- 1B/10inch (CJ $36.48)
  WHEN '84d9e1a5-bfe1-41b1-a9a1-7df3669c831b' THEN 83.12   -- 1B/12inch (CJ $43.12)
  WHEN '04fd7599-0188-41f2-9036-accf891f969a' THEN 89.75   -- 1B/14inch (CJ $49.75)
  WHEN 'c5b79490-df1f-4b2c-af51-1376c7346f0b' THEN 98.04   -- 1B/16inch (CJ $58.04)

  -- Former Lace Wig Woman With Long Black Curly Hair (wig +$40)
  WHEN '3ea326dc-24f4-4448-a828-3053b68c280d' THEN 57.33  -- 20 in (CJ $17.33)
  WHEN '174ffebc-058e-49b6-b0d9-b97b37e38f18' THEN 57.33  -- 22 in
  WHEN 'be90cf07-d3d9-4fb1-8637-29d038a24846' THEN 57.33  -- 24 in
  WHEN '49f13a6a-3721-4208-8e53-72d140d1362c' THEN 57.33  -- 26 in
  WHEN 'f732952d-e4d2-49fd-a3ee-886d1f9ac75a' THEN 60.52  -- 28in (CJ $20.52)
  WHEN 'af1a6d5e-9b90-410e-aebd-39a311b49345' THEN 60.52  -- 30in

  -- Short Wig Full Hair Set (wig +$40)
  WHEN '46f48dbd-0755-40eb-a0c1-9218c8121fe0' THEN 68.19  -- 8inch (CJ $28.19)
  WHEN 'ddfaceb2-8feb-4f0a-924a-2362b34d88d6' THEN 72.34  -- 10inch (CJ $32.34)
  WHEN '2c4f65b7-cfdb-4ec6-aba3-860924814e32' THEN 75.66  -- 12inch (CJ $35.66)
  WHEN '70920461-5b05-4326-a4d3-6e30e22596bf' THEN 82.29  -- 14inch (CJ $42.29)

  -- 300 Density Loose Wave HD Lace Wig (wig +$40)
  WHEN '4a94d7a6-a07c-4b47-9259-c8ef4d0b6f55' THEN 54.82  -- 13x4 20inches (CJ $14.82)
  WHEN '42211b23-3f0b-49bc-ad9f-a1ddb8b83013' THEN 56.14  -- 13x4 24inches (CJ $16.14)
  WHEN '05487ee6-4f6d-4d14-a265-a2be34663b26' THEN 56.67  -- 13x4 26inches (CJ $16.67)
  WHEN '888936d0-f7f3-4eb2-a8eb-014fc5c13d2c' THEN 62.24  -- 13x6 30inches (CJ $22.24)
  WHEN '72109610-8cae-4a2f-83c4-11038c11e0cc' THEN 94.15  -- 13x6 40inches (CJ $54.15)

  -- Women's Short Curly African Small Curly Hair (accessories +$3, CJ $4.70)
  WHEN 'f86ff569-4dd2-4ba2-acf9-17bf594a9065' THEN 7.70  -- Black

  -- 6x4 Density Virgin Human Hair Wigs (wig +$40)
  WHEN '77c2972f-2e08-4eef-abbc-517fe012529b' THEN 124.71  -- Body wave/6x4 26Inch (CJ $84.71)
  WHEN 'e23aa57f-675e-4fdd-b6fb-4f7272efb556' THEN 142.61  -- Body wave/6x4 28Inch (CJ $102.61)

  ELSE price
END
WHERE id IN (
  '2d8ef08d-4f5d-4296-8691-c0d3c864f9a4','d0109a25-871f-4440-bd9b-7f62013ea377',
  '84ab9da4-96b9-43ed-a025-7bf7be48b659','70bfe7a6-5637-4a3a-836b-494291c7e061',
  '22585ed0-9202-4ad6-9fa6-4666c65d3d18','c9e8a0ca-c647-4a30-9bea-8f4e851af7e9',
  '8775b515-14b0-4de6-aa9b-f994e0021987','e5785c79-8c6d-4662-ae13-21c0d65a1460',
  '770090f6-183e-4dc8-950b-964935b4eb46','c6f67d25-f742-42e7-ad0a-f3a6b6ec4216',
  'c53d8c7e-6a53-46f9-b2fb-cf4ef1fcc357','34929c01-0cca-4ec4-a939-64504320c0c4',
  '330fe3ff-ad58-47d6-96f4-991fadf29ffb','0094fcc8-3610-4c64-8b7f-c5eca1310e72',
  '38760584-3797-4e25-8999-793b14ebc632','6ba0e9fb-a308-4396-8f85-b6103e02f05c',
  'ca3dd1fc-560a-4c4d-8115-a334be5bcf65','0fd47fc1-35a3-4f24-9ae9-a5d9a497501c',
  '7d08a811-03d8-4685-9dfa-edea1f248e64','f5cfb5a9-093e-45af-a80d-73d710b41c5e',
  'fad5768a-3a90-4825-8f1f-201155344800','72a610e8-409c-4a52-8cbd-e92cf818d19f',
  'e422b7d0-a72c-4133-bc9e-10378964a77c','d223d7ca-4ca6-4ddc-aa55-bd033dfc4a9f',
  '5010d35d-af6e-4107-8579-2e4fb800e7b6','2cf0134c-d427-41e5-86a1-19ed6c4a5d6a',
  '05843ef6-a063-4d6f-9318-fe9c36a00fc8','ca418795-405a-4db9-aa53-1b410d35fca0',
  '186e3933-44cb-40bf-8de4-88dee4bad126','691655a3-1ffb-4511-9dfa-56f56d0365dc',
  '0844fd17-db4a-444a-b57f-439f97a6c9ae','56ba25bd-82ac-42b7-97ea-fd2d5d8952d7',
  '04d14eb8-c716-47c7-b0f8-853e82e627b6',
  'dd4f49f4-3d34-43e2-8374-84b3b75090b4','eecd1f2d-df45-4cd4-b975-061f2d3bf080',
  'a0c74c1a-2464-496b-baab-d7672d5d955a','195e706c-f20f-499d-9e59-9cc7fba34633',
  'e6f52e88-efab-439d-8d73-8bfc216be41f','cba52acc-8db0-4ae4-bcfa-33fea1a0f6cb',
  '9811b397-c278-48bf-b526-4050fa0a3fb1','e54c64c3-47f8-4be2-b506-9b90c32a163d',
  'b62be173-ca14-46fa-bc5c-2225aec6fac8','a23dd39d-9c35-491f-9911-4cea82ac664b',
  'd75db013-a61e-4eab-a6e4-d18ee5073545','6d8ae8a6-ad9a-4f9d-ad9a-54df371e825f',
  'a87c4485-4255-485a-94a6-88420c859ab7','8c2e0fd9-25e6-4beb-82ff-33a2692787eb',
  'b87e922d-3372-47e1-8a58-9b6708db0901','bfa5ce5a-daf2-4dad-8b47-b762982841f8',
  'dee93c6f-db0f-4c54-a430-85974632a920','02b4f6ac-ca24-4c83-b22b-aa9c6c294530',
  '1d7eb195-046c-4132-9bfc-8708dda42160','9fb2183f-3a5a-4562-9d82-1051adcb5ad6',
  'b0b9a1f1-7892-449d-a571-4c02b5cc60c1','3a122586-8933-41a4-90ee-cc654d33facc',
  'cace8a34-1985-4638-8081-cf3913a502d4',
  '92fca25c-ee54-4e09-b904-86936b5ac8cb',
  '306c7772-5bd6-48fd-869a-95033a81bdd1','98aeab38-5e2b-4ee4-8bb6-3088b6e1de3f',
  '52690c8f-ad5b-4f80-8d4b-ec6da5ed78d2','88eb9da4-3609-453a-b826-b3bfc1eb9d5b',
  '51353b37-7666-4ac4-a29a-613bb2d94fd6','98c2ff78-0512-4c4d-9885-9a9d22160f86',
  '1c43f858-37f0-473c-a2cd-9b7e31c9dbf3','5c7470fd-9de7-46c2-bd4b-47a2b8316b8e',
  'd7bd163d-845b-412d-a7ad-ea3f0215754a','d0ebabd6-1a28-4e20-b7ea-a5e70cb7384c',
  'a8f1e6d2-1cce-4872-8e28-a17fc7510e79',
  '4d26ee15-0379-4b1d-87ed-c6aabec4b287',
  '8b6c524f-9cf4-4f31-8c26-f85023a153aa','4608c6ee-6e54-4d13-ad0f-1851b14b92cb',
  '185fabb5-5d78-4a79-996a-c322f3f3ecbf','bfcccb67-6d75-43e9-a3fb-97cca4173a9b',
  '1cff9c4c-8b1e-46e7-a111-b399797a8a45','f2eaa769-91cf-4b77-8934-c0c7f3d4f4fd',
  'ada04150-1200-429d-83f7-304cd469af98','cd5bfc15-62ea-424a-99e1-503a81ad3975',
  'b0c856e7-8c95-43fb-b12f-ef4484464731','a6a15eff-2428-4aec-8ebf-7f62e4220c81',
  '2b8b0d1e-e0a6-4986-98fc-a1345caf9e73',
  '0b855ba8-b58e-4a32-bd40-9f37810ab0b8','7d740575-7095-4ea9-a6ae-86f2fb875e11',
  'd397f867-1df4-43d3-a170-390203bcb67d','0cc883d0-c748-479f-a151-0037121a6081',
  'bf710083-7dfd-4a45-878c-f0f213752e1a',
  'f5520cee-b3ee-4781-afb9-c455469349e5','94404a5c-046d-4984-b52a-279669a1de23',
  '3291a11d-6b05-4cbb-8072-bce5c42341df','f0e5c732-3718-47d5-a406-30cff8c6d1ba',
  '3c2d86db-963b-49a0-a009-8eada6ca8270','84f615f7-0654-4f63-b941-384b7b19ee61',
  '84d9e1a5-bfe1-41b1-a9a1-7df3669c831b','04fd7599-0188-41f2-9036-accf891f969a',
  'c5b79490-df1f-4b2c-af51-1376c7346f0b',
  '3ea326dc-24f4-4448-a828-3053b68c280d','174ffebc-058e-49b6-b0d9-b97b37e38f18',
  'be90cf07-d3d9-4fb1-8637-29d038a24846','49f13a6a-3721-4208-8e53-72d140d1362c',
  'f732952d-e4d2-49fd-a3ee-886d1f9ac75a','af1a6d5e-9b90-410e-aebd-39a311b49345',
  '46f48dbd-0755-40eb-a0c1-9218c8121fe0','ddfaceb2-8feb-4f0a-924a-2362b34d88d6',
  '2c4f65b7-cfdb-4ec6-aba3-860924814e32','70920461-5b05-4326-a4d3-6e30e22596bf',
  '4a94d7a6-a07c-4b47-9259-c8ef4d0b6f55','42211b23-3f0b-49bc-ad9f-a1ddb8b83013',
  '05487ee6-4f6d-4d14-a265-a2be34663b26','888936d0-f7f3-4eb2-a8eb-014fc5c13d2c',
  '72109610-8cae-4a2f-83c4-11038c11e0cc',
  'f86ff569-4dd2-4ba2-acf9-17bf594a9065',
  '77c2972f-2e08-4eef-abbc-517fe012529b','e23aa57f-675e-4fdd-b6fb-4f7272efb556'
);
