-- Price corrections v3: exact CJ prices for Nano Flat Tip, Short Curly Wig,
-- Long Straight Lace Front Wig, and Lace Wig BOBO/TTD variants (46 products)
-- Run in Supabase SQL Editor (after v1 and v2)

UPDATE products
SET price = CASE id
  WHEN '0db11d96-3f3e-4e40-83e3-0c3b688c7346' THEN 55.52  -- Nano Flat Tip Hair Extension - 10 inch
  WHEN 'b26d3bc4-1e23-4087-a893-734129a9cb27' THEN 58.56  -- Nano Flat Tip Hair Extension - 12 inch
  WHEN 'f102a78c-ae9d-41a9-b624-65fc35dc80b5' THEN 61.62  -- Nano Flat Tip Hair Extension - 14 inch
  WHEN 'b8d2fbb1-5fee-459a-b668-c8194bf7c306' THEN 64.67  -- Nano Flat Tip Hair Extension - 16 inch
  WHEN 'bfdab05b-a774-45e1-88c8-6e1b66aa6898' THEN 67.72  -- Nano Flat Tip Hair Extension - 18 inch
  WHEN '3dac3012-783a-49ed-a96f-f598a25f42e2' THEN 73.82  -- Nano Flat Tip Hair Extension - 20 inch
  WHEN '92cca813-7ece-41f2-bec5-2955bd851143' THEN 78.40  -- Nano Flat Tip Hair Extension - 22 inch
  WHEN '8a222794-6f6d-4ff4-8edc-eb52d1d65f27' THEN 86.02  -- Nano Flat Hair Extension - 24 inch
  WHEN '1fc10b3f-db3a-4703-a149-9911152dfaf2' THEN 90.61  -- Nano Flat Tip Hair Extension - 26 inch
  WHEN '17f1a2d0-7827-4ae5-b405-dafb43d981fa' THEN 96.70  -- Nano Flat Hair Extension - 28 inch
  WHEN '7ea566f6-d6b6-4bee-a410-df8ace0792ac' THEN 99.76  -- Nano Flat Tip Hair Extension - 30 inch
  WHEN 'd870de82-e679-45a3-b61c-79ebcb611c43' THEN 73.00  -- Short Curly Wig - 10 inch
  WHEN '56ad789a-8dae-4f1d-a2c2-81340ba358d7' THEN 79.64  -- Short Curly Wig - 12 inch
  WHEN '71f9d798-80ad-4dff-8a4d-4c1f2cc02aac' THEN 87.93  -- Short Curly Wig - 14 inch
  WHEN '714f10b5-ac99-4e10-8960-12a8749b0943' THEN 96.22  -- Short Curly Wig - 16 inch
  WHEN 'fc8fcead-33d7-4b7a-b58f-96f5948b3c1e' THEN 45.80  -- Long Straight Lace Front Wig - Wine Red/14inch
  WHEN '12e6eed6-cb28-4e2e-a41f-4e42eae9860e' THEN 45.80  -- Long Straight Lace Front Wig - Wine Red/16inch
  WHEN 'd83c527e-3a7b-4d9e-be14-0d3965321572' THEN 45.80  -- Long Straight Lace Front Wig - Wine Red/18inch
  WHEN '5324b63d-5f98-4dd0-b5c2-33dacf1959e7' THEN 45.80  -- Long Straight Lace Front Wig - Wine Red/22inch
  WHEN '81ac03e7-8ad1-4be6-9bdb-c234393f713e' THEN 45.80  -- Long Straight Lace Front Wig - Wine Red/24inch
  WHEN '02e46c99-41a8-4913-9aec-3948419efede' THEN 45.80  -- Long Straight Lace Front Wig - Wine Red/26inch
  WHEN '864c1a6e-ce84-4e0f-973a-4de73cfbd950' THEN 45.80  -- Long Straight Lace Front Wig - Wine Red/28inch
  WHEN 'a2b7d48d-448f-4ccb-9b8d-fe828a1909d2' THEN 44.70  -- Long Straight Lace Front Wig - Wine Red/36inch
  WHEN '0d833317-dc28-45f7-84fb-ed4adb261466' THEN 180.86  -- Lace Wig - 11 inch BOBO natural color/S
  WHEN '9083c9c9-418e-4a38-ad04-50b4d4bc2418' THEN 180.86  -- Lace Wig - 11 inch BOBO natural color/M
  WHEN '568acde2-b44e-47ec-927f-c646287570bc' THEN 180.86  -- Lace Wig - 11 inch BOBO natural color/L
  WHEN '3571436a-5012-4e3b-b732-6ef1daecc9e4' THEN 242.43  -- Lace Wig - 13 inch BOBO natural color/S
  WHEN '705491b5-0bd9-4023-aad8-c81963e68348' THEN 242.43  -- Lace Wig - 13 inch BOBO natural color/M
  WHEN '833a4707-e8c0-4366-bc7f-1a9c56984b90' THEN 242.43  -- Lace Wig - 13 inch BOBO natural color/L
  WHEN 'eb240ffe-c480-4139-ae07-8d8e9953173c' THEN 303.99  -- Lace Wig - 15 inch BOBO natural color/S
  WHEN 'bb7de54f-6f8e-4eb7-932e-905c269b6f15' THEN 303.99  -- Lace Wig - 15 inch BOBO natural color/M
  WHEN '5e583789-86bd-4cb5-a729-e68719f41a72' THEN 303.99  -- Lace Wig - 15 inch BOBO natural color/L
  WHEN 'f4197743-823d-4d0d-8498-66ac651457af' THEN 359.96  -- Lace Wig - 17BOBO Natural Color/S
  WHEN '07013526-5701-4bb2-9012-e9728e874a55' THEN 359.96  -- Lace Wig - 17BOBO Natural Color/M
  WHEN '1254200d-5deb-4c7f-b4a8-9e43f80c64e0' THEN 359.96  -- Lace Wig - 17BOBO Natural Color/L
  WHEN 'fdd0677b-9f4a-49a6-9375-66e211ab5afc' THEN 182.72  -- Lace Wig - TTD20 Natural Color/S
  WHEN '28657224-82f4-4011-91a4-dcef47c0639d' THEN 376.75  -- Lace Wig - TTD40 Natural Color/S
  WHEN 'a4fefc6e-0ead-464a-9edb-4b1acf36dfe9' THEN 180.86  -- Lace Wig - 11 inch BOBO dark brown/S
  WHEN 'f8734762-e48a-4a5c-a405-e2822352543f' THEN 242.43  -- Lace Wig - 13 inch BOBO dark brown/S
  WHEN 'd13cd497-d0b1-4778-8e7a-fd415b911d58' THEN 303.99  -- Lace Wig - 15 inch BOBO dark brown/S
  WHEN '86e252af-d861-4753-928c-64c5b1bd3f9f' THEN 359.96  -- Lace Wig - 17BOBO Dark Brown/S
  WHEN '9ea287a6-02c8-4492-9e94-950fe5525c81' THEN 186.46  -- Lace Wig - TTD20 Dark Brown/S
  WHEN '4ba0585c-eaeb-45c1-81dd-537113eac62b' THEN 255.49  -- Lace Wig - TTD30 Dark Brown/S
  WHEN '19645171-0ec3-4bb5-88d5-478691d3e6f8' THEN 376.75  -- Lace Wig - TTD40 Dark Brown/S
  WHEN 'f1efd6b0-776c-4025-8d55-4bb7f1a4ea95' THEN 376.75  -- Lace Wig - TTD40 Dark Brown/M
  WHEN 'c17e92c1-98ba-42a1-9652-f18268947dea' THEN 376.75  -- Lace Wig - TTD40 Dark Brown/L
  ELSE price
END
WHERE id IN (
  '0db11d96-3f3e-4e40-83e3-0c3b688c7346',
  'b26d3bc4-1e23-4087-a893-734129a9cb27',
  'f102a78c-ae9d-41a9-b624-65fc35dc80b5',
  'b8d2fbb1-5fee-459a-b668-c8194bf7c306',
  'bfdab05b-a774-45e1-88c8-6e1b66aa6898',
  '3dac3012-783a-49ed-a96f-f598a25f42e2',
  '92cca813-7ece-41f2-bec5-2955bd851143',
  '8a222794-6f6d-4ff4-8edc-eb52d1d65f27',
  '1fc10b3f-db3a-4703-a149-9911152dfaf2',
  '17f1a2d0-7827-4ae5-b405-dafb43d981fa',
  '7ea566f6-d6b6-4bee-a410-df8ace0792ac',
  'd870de82-e679-45a3-b61c-79ebcb611c43',
  '56ad789a-8dae-4f1d-a2c2-81340ba358d7',
  '71f9d798-80ad-4dff-8a4d-4c1f2cc02aac',
  '714f10b5-ac99-4e10-8960-12a8749b0943',
  'fc8fcead-33d7-4b7a-b58f-96f5948b3c1e',
  '12e6eed6-cb28-4e2e-a41f-4e42eae9860e',
  'd83c527e-3a7b-4d9e-be14-0d3965321572',
  '5324b63d-5f98-4dd0-b5c2-33dacf1959e7',
  '81ac03e7-8ad1-4be6-9bdb-c234393f713e',
  '02e46c99-41a8-4913-9aec-3948419efede',
  '864c1a6e-ce84-4e0f-973a-4de73cfbd950',
  'a2b7d48d-448f-4ccb-9b8d-fe828a1909d2',
  '0d833317-dc28-45f7-84fb-ed4adb261466',
  '9083c9c9-418e-4a38-ad04-50b4d4bc2418',
  '568acde2-b44e-47ec-927f-c646287570bc',
  '3571436a-5012-4e3b-b732-6ef1daecc9e4',
  '705491b5-0bd9-4023-aad8-c81963e68348',
  '833a4707-e8c0-4366-bc7f-1a9c56984b90',
  'eb240ffe-c480-4139-ae07-8d8e9953173c',
  'bb7de54f-6f8e-4eb7-932e-905c269b6f15',
  '5e583789-86bd-4cb5-a729-e68719f41a72',
  'f4197743-823d-4d0d-8498-66ac651457af',
  '07013526-5701-4bb2-9012-e9728e874a55',
  '1254200d-5deb-4c7f-b4a8-9e43f80c64e0',
  'fdd0677b-9f4a-49a6-9375-66e211ab5afc',
  '28657224-82f4-4011-91a4-dcef47c0639d',
  'a4fefc6e-0ead-464a-9edb-4b1acf36dfe9',
  'f8734762-e48a-4a5c-a405-e2822352543f',
  'd13cd497-d0b1-4778-8e7a-fd415b911d58',
  '86e252af-d861-4753-928c-64c5b1bd3f9f',
  '9ea287a6-02c8-4492-9e94-950fe5525c81',
  '4ba0585c-eaeb-45c1-81dd-537113eac62b',
  '19645171-0ec3-4bb5-88d5-478691d3e6f8',
  'f1efd6b0-776c-4025-8d55-4bb7f1a4ea95',
  'c17e92c1-98ba-42a1-9652-f18268947dea'
);

-- Verify updated prices
SELECT id, name, price, category FROM products
WHERE id IN (
  '0db11d96-3f3e-4e40-83e3-0c3b688c7346',
  'b26d3bc4-1e23-4087-a893-734129a9cb27',
  'f102a78c-ae9d-41a9-b624-65fc35dc80b5',
  'b8d2fbb1-5fee-459a-b668-c8194bf7c306',
  'bfdab05b-a774-45e1-88c8-6e1b66aa6898',
  '3dac3012-783a-49ed-a96f-f598a25f42e2',
  '92cca813-7ece-41f2-bec5-2955bd851143',
  '8a222794-6f6d-4ff4-8edc-eb52d1d65f27',
  '1fc10b3f-db3a-4703-a149-9911152dfaf2',
  '17f1a2d0-7827-4ae5-b405-dafb43d981fa',
  '7ea566f6-d6b6-4bee-a410-df8ace0792ac',
  'd870de82-e679-45a3-b61c-79ebcb611c43',
  '56ad789a-8dae-4f1d-a2c2-81340ba358d7',
  '71f9d798-80ad-4dff-8a4d-4c1f2cc02aac',
  '714f10b5-ac99-4e10-8960-12a8749b0943',
  'fc8fcead-33d7-4b7a-b58f-96f5948b3c1e',
  '12e6eed6-cb28-4e2e-a41f-4e42eae9860e',
  'd83c527e-3a7b-4d9e-be14-0d3965321572',
  '5324b63d-5f98-4dd0-b5c2-33dacf1959e7',
  '81ac03e7-8ad1-4be6-9bdb-c234393f713e',
  '02e46c99-41a8-4913-9aec-3948419efede',
  '864c1a6e-ce84-4e0f-973a-4de73cfbd950',
  'a2b7d48d-448f-4ccb-9b8d-fe828a1909d2',
  '0d833317-dc28-45f7-84fb-ed4adb261466',
  '9083c9c9-418e-4a38-ad04-50b4d4bc2418',
  '568acde2-b44e-47ec-927f-c646287570bc',
  '3571436a-5012-4e3b-b732-6ef1daecc9e4',
  '705491b5-0bd9-4023-aad8-c81963e68348',
  '833a4707-e8c0-4366-bc7f-1a9c56984b90',
  'eb240ffe-c480-4139-ae07-8d8e9953173c',
  'bb7de54f-6f8e-4eb7-932e-905c269b6f15',
  '5e583789-86bd-4cb5-a729-e68719f41a72',
  'f4197743-823d-4d0d-8498-66ac651457af',
  '07013526-5701-4bb2-9012-e9728e874a55',
  '1254200d-5deb-4c7f-b4a8-9e43f80c64e0',
  'fdd0677b-9f4a-49a6-9375-66e211ab5afc',
  '28657224-82f4-4011-91a4-dcef47c0639d',
  'a4fefc6e-0ead-464a-9edb-4b1acf36dfe9',
  'f8734762-e48a-4a5c-a405-e2822352543f',
  'd13cd497-d0b1-4778-8e7a-fd415b911d58',
  '86e252af-d861-4753-928c-64c5b1bd3f9f',
  '9ea287a6-02c8-4492-9e94-950fe5525c81',
  '4ba0585c-eaeb-45c1-81dd-537113eac62b',
  '19645171-0ec3-4bb5-88d5-478691d3e6f8',
  'f1efd6b0-776c-4025-8d55-4bb7f1a4ea95',
  'c17e92c1-98ba-42a1-9652-f18268947dea'
)
ORDER BY category, name;