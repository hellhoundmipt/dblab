IF OBJECT_ID ('hotels_view', 'V') IS NOT NULL
    DROP VIEW hotels_view;
GO

CREATE VIEW hotels_view
AS
SELECT h.hotel_name, MIN(IIF(p.discount IS NOT NULL, p.price - p.discount, p.price)) AS 'Min price',
	COUNT(distinct s.suite_id) AS 'Suits cnt' FROM HOTELS h, SUITE s, PRICE p
WHERE h.hotel_id = s.hotel_id
AND s.suite_id = p.suite_id
AND s.status = 'free'
GROUP BY h.hotel_name
GO
SELECT * FROM hotels_view;
GO

SELECT TOP 3 WITH TIES [Suits cnt], hotel_name FROM hotels_view
WHERE [Min price] < 3000
ORDER BY [Suits cnt] DESC