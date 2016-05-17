SELECT TOP 2 WITH TIES COUNT(c.comment_id) AS number, h.hotel_name FROM HOTELS h, REVIEW r, COMMENTS c
WHERE h.hotel_id = r.hotel_id
AND r.review_id = c.review_id
GROUP BY h.hotel_name
ORDER BY number DESC;


SELECT DISTINCT h1.hotel_name, h2.hotel_name FROM HOTELS h1, HOTELS h2, ADDRESS a1, ADDRESS a2, LOCALITY l1, LOCALITY l2, COUNTRY c, SUITE s1, 
	SUITE s2, PRICE p1, PRICE p2
WHERE h1.hotel_id = a1.addr_id
AND h2.hotel_id = a2.addr_id
AND a1.locality_id = l1.locality_id
AND a2.locality_id = l2.locality_id
AND l1.country_id = c.country_id
AND l2.country_id = c.country_id
AND c.name = 'Austria'
AND s1.hotel_id = h1.hotel_id
AND s2.hotel_id = h2.hotel_id
AND p1.suite_id = s1.suite_id
AND p2.suite_id = p2.suite_id
AND NOT h1.hotel_id = h2.hotel_id
AND p1.price + p2.price < 30000

SELECT DISTINCT CASE
		WHEN p1.price + p2.price < 30000 THEN CONCAT(h1.hotel_name, ' -- ', h2.hotel_name)
		WHEN p1.price > 30000 AND p2.price < 30000 THEN h2.hotel_name
		WHEN p2.price > 30000 AND p1.price < 30000 THEN h1.hotel_name
	   END hotels
FROM HOTELS h1, HOTELS h2, ADDRESS a1, ADDRESS a2, LOCALITY l1, LOCALITY l2, COUNTRY c, SUITE s1, 
	SUITE s2, PRICE p1, PRICE p2
WHERE h1.hotel_id = a1.addr_id
AND h2.hotel_id = a2.addr_id
AND a1.locality_id = l1.locality_id
AND a2.locality_id = l2.locality_id
AND l1.country_id = c.country_id
AND l2.country_id = c.country_id
AND c.name = 'Austria'
AND s1.hotel_id = h1.hotel_id
AND s2.hotel_id = h2.hotel_id
AND p1.suite_id = s1.suite_id
AND p2.suite_id = p2.suite_id
AND NOT h1.hotel_id = h2.hotel_id