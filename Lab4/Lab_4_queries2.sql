SELECT hotel_name, MIN(start_date) AS reg_date FROM HOTELS h, PRICE p, SUITE s
WHERE  h.hotel_id = s.hotel_id
AND s.suite_id = p.suite_id
GROUP BY hotel_name
HAVING (DATEPART(yyyy,GETDATE())-DATEPART(yyyy,MIN(start_date))-
	CASE
	WHEN (DATEPART(mm,GETDATE())<DATEPART(mm,MIN(start_date))
	or (DATEPART(mm,GETDATE())=DATEPART(mm,MIN(start_date))
	and DATEPART(dd,GETDATE())<DATEPART(dd,MIN(start_date))))
	THEN 1
	ELSE 0
	END) < 3
AND (DATEPART(yyyy,GETDATE())-DATEPART(yyyy,MIN(start_date))-
	CASE
	WHEN (DATEPART(mm,GETDATE())<DATEPART(mm,MIN(start_date))
	or (DATEPART(mm,GETDATE())=DATEPART(mm,MIN(start_date))
	and DATEPART(dd,GETDATE())<DATEPART(dd,MIN(start_date))))
	THEN 1
	ELSE 0
	END) >= 1;


SELECT TOP 3 WITH TIES SUM(f.price) + MAX(IIF(p.discount IS NOT NULL, p.price - p.discount, p.price)) AS total_price, h.hotel_name, c.name AS country FROM HOTELS h, FACILITIES f, PRICE p,
		SUITE s, COUNTRY c, ADDRESS a, LOCALITY l
WHERE f.hotel_id = h.hotel_id
AND s.hotel_id = h.hotel_id
AND p.suite_id = s.suite_id
AND h.hotel_id = a.addr_id
AND l.locality_id = a.locality_id
AND c.country_id = l.country_id
GROUP BY c.name, h.hotel_name
ORDER BY total_price DESC;


SELECT CONCAT(t.first_name, ' ', t.second_name, ' <', t.nickname, '>') AS person--, t.age,
--CONCAT(sc.first_name, ' ', sc.second_name, ' <', sc.nickname, '>') AS person2, sc.age, sp.subscribtion_id
FROM TRAVELER t, SUBSCRIBTION_POOL sp, TRAVELER sc
WHERE sp.traveler_id = t.traveler_id
AND sp.subscr_id = sc.traveler_id
AND (DATEPART(yyyy,sc.age)>DATEPART(yyyy,t.age)
	or (DATEPART(yyyy,sc.age)=DATEPART(yyyy,t.age)
	and DATEPART(mm,sc.age)>DATEPART(mm,t.age))
	or (DATEPART(yyyy,sc.age)=DATEPART(yyyy,t.age)
	and DATEPART(mm,sc.age)=DATEPART(mm,t.age)
	and DATEPART(dd,sc.age)>DATEPART(dd,t.age)))
GROUP BY CONCAT(t.first_name, ' ', t.second_name, ' <', t.nickname, '>');

	
SELECT hotel_name, phone_number, CONCAT(l.name + ' ,', c.name) AS locality FROM HOTELS, LOCALITY l, ADDRESS a, COUNTRY c
WHERE phone_number LIKE '%653%'
AND hotel_id = addr_id
AND a.locality_id = l.locality_id
AND c.country_id = l.country_id;


SELECT TOP 20 WITH TIES MIN(IIF(p.discount IS NOT NULL, p.price - p.discount, p.price)) AS total_price, hotel_name, suite_number FROM HOTELS h, SUITE s, PRICE p
WHERE h.hotel_id = s.hotel_id
AND s.suite_id = p.suite_id
AND s.status = 'free'
AND h.stars >=3
AND s.max_capacity > 2
AND s.max_capacity < 6
GROUP BY hotel_name, suite_number
ORDER BY total_price ASC


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
--такой же результат как если просто HAVING COUNT(s.suite_id) > 1
GROUP BY lt.name
ORDER BY avg_capacity DESC