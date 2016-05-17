IF OBJECT_ID ('country_view', 'V') IS NOT NULL
    DROP VIEW country_view;
GO

CREATE VIEW country_view
AS
SELECT c.name AS 'Country', COUNT(distinct t.traveler_id) AS 'Travelers cnt', AVG(aux.com_cnt * 1.0) AS 'Average comments' FROM COUNTRY c, 
	TRAVELER t, ADDRESS a, LOCALITY l,
	HOTELS h, REVIEW r,
	(SELECT c.country_id AS cid, COUNT(cm.comment_id) AS com_cnt FROM COMMENTS cm, REVIEW r, HOTELS h,
		ADDRESS a, LOCALITY l, COUNTRY c
	WHERE cm.review_id = r.review_id
	AND r.hotel_id = h.hotel_id
	AND a.addr_id = h.hotel_id
	AND l.locality_id = a.locality_id
	AND l.country_id = c.country_id
	GROUP BY c.country_id
	) AS aux
WHERE c.country_id = l.country_id
AND l.locality_id = a.locality_id
AND a.addr_id = h.hotel_id
AND h.hotel_id = r.hotel_id
AND r.traveler_id = t.traveler_id
AND aux.cid = c.country_id
GROUP BY c.name
GO
SELECT * FROM country_view;
GO

SELECT Country FROM country_view
WHERE [Travelers cnt] > [Average comments]