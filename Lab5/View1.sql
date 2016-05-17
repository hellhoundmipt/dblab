IF OBJECT_ID ('locality_view', 'V') IS NOT NULL
    DROP VIEW locality_view;
GO

CREATE VIEW locality_view
AS
SELECT l.name AS 'Locality name', COUNT(distinct h.hotel_id) AS 'Hotels cnt', trv.[Travelers cnt] AS 'Travelers cnt', AVG(p.price) AS 'Average cost'
	FROM LOCALITY l
JOIN
	(SELECT l.locality_id AS lid, COUNT(t.traveler_id) AS 'Travelers cnt'
	FROM LOCALITY l, ADDRESS a, HOTELS h, REVIEW r, TRAVELER t
	WHERE l.locality_id = a.locality_id
	AND a.addr_id = h.hotel_id
	AND h.hotel_id = r.hotel_id
	AND r.traveler_id = t.traveler_id
	GROUP BY l.locality_id) AS trv ON trv.lid = l.locality_id
JOIN ADDRESS a ON l.locality_id = a.locality_id
JOIN HOTELS h ON a.addr_id = h.hotel_id
JOIN SUITE s ON s.hotel_id = h.hotel_id
JOIN PRICE p ON p.suite_id = s.suite_id
GROUP BY l.name, [Travelers cnt]
GO
SELECT * FROM locality_view;
GO

SELECT [Hotels cnt], AVG([Average cost]) AS 'Avg avg' FROM locality_view
GROUP BY [Hotels cnt]
ORDER BY [Hotels cnt] DESC