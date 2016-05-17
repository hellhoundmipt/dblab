SELECT TOP 20 WITH TIES MIN(IIF(p.discount IS NOT NULL, p.price - p.discount, p.price)) AS total_price, hotel_name, suite_number FROM HOTELS h, SUITE s, PRICE p
WHERE h.hotel_id = s.hotel_id
AND s.suite_id = p.suite_id
AND s.status = 'free'
AND h.stars >=3
AND s.max_capacity > 2
AND s.max_capacity < 6
GROUP BY hotel_name, suite_number
ORDER BY total_price ASC

--Топ 20 самых дешёвых свободных комнат, вмещающих 3-5 людей
