SELECT AVG(s.max_capacity) AS avg_capacity, lt.name FROM SUITE s, HOTELS h, ADDRESS a,
					LOCALITY l, LOCALITY_TYPE lt, PRICE p
WHERE lt.type_id = l.type
AND l.locality_id = a.locality_id
AND h.hotel_id = a.addr_id
AND s.hotel_id = h.hotel_id
AND p.suite_id = s.suite_id
--
AND s.suite_id IN (SELECT sq.suite_id FROM SUITE sq, PRICE pq
				GROUP BY sq.suite_id
				HAVING COUNT(pq.suite_id) > 1)
--ШШШШШ ШШ ШШШШШШШШШ ШШШ ШШШШ ШШШШШШ HAVING COUNT(s.suite_id) > 1
GROUP BY lt.name
ORDER BY avg_capacity DESC

--—редн€€ вместительность отелей в кождом виде насЄлЄнных пунктов
